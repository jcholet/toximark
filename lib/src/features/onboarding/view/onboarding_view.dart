import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_pitstop/src/app/routes/app_router.dart';
import 'package:health_pitstop/src/features/onboarding/onboarding.dart';
import 'package:health_pitstop/src/utils/utils.dart';
import 'package:health_pitstop/src/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// The sub-routes that are presented as part of the onboarding flow.
enum OnboardingSubRoute {
  firstNameAndLastName,
  birthdate,
  avatar,
  username;

  /// Determines if the given sub-route should resize the scaffold to avoid
  /// bottom inset.
  bool get shouldResizeToAvoidBottomInset {
    return this == OnboardingSubRoute.firstNameAndLastName ||
        this == OnboardingSubRoute.username;
  }
}

class OnboardingView extends ConsumerStatefulWidget {
  const OnboardingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnboardingView> {
  final _controller = PageController();

  var _subRoute = OnboardingSubRoute.firstNameAndLastName;

  String? firstName;
  String? lastName;
  DateTime? birthdate;
  File? avatar;
  String? username;

  String get initials {
    return '${firstName?.characters.first}${lastName?.characters.first}'
        .toUpperCase();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final controller = ref.read(onboardingViewControllerProvider.notifier);
    final success = await controller.createUser(
      firstName: firstName,
      lastName: lastName,
      birthdate: birthdate,
      avatar: avatar,
      username: username,
    );

    if (mounted && success) {
      context.goNamed(AppRoute.onboardingSuccessStep.name);
    }
  }

  void _previousPage() {
    setState(() => _subRoute = OnboardingSubRoute.values[_subRoute.index - 1]);
    context.unfocus();
    _animateToPage(_subRoute.index);
  }

  void _nextPage() {
    setState(() => _subRoute = OnboardingSubRoute.values[_subRoute.index + 1]);
    _animateToPage(_subRoute.index);
  }

  void _animateToPage(int index) {
    _controller.animateToPage(
      index,
      duration: AppTime.fast,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingViewControllerProvider);
    return Scaffold(
      resizeToAvoidBottomInset: _subRoute.shouldResizeToAvoidBottomInset,
      appBar: AppBar(
        leading: AppBackButton(
          onPressed: () {
            if (state.isLoading) return;
            if (_subRoute.index == 0) {
              ref.read(onboardingViewControllerProvider.notifier).signOut();
            } else {
              _previousPage();
            }
          },
          animate: true,
        ),
        title: StepIndicator(
          currentStep: _subRoute.index,
          totalSteps: OnboardingSubRoute.values.length,
        ),
        actions: [
          // Add a fake button to keep the layout consistent
          AppBackButton(
            onPressed: () {},
            color: AppColor.transparent,
          ),
        ],
      ),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          PersonalInfoStep(
            onNextPressed: (firstName, lastName) {
              this.firstName = firstName;
              this.lastName = lastName;
              _nextPage();
            },
          ),
          BirthdateStep(
            onNextPressed: (birthdate) {
              this.birthdate = birthdate;
              _nextPage();
            },
          ),
          AvatarStep(
            onNextPressed: (avatar) {
              this.avatar = avatar;
              _nextPage();
            },
            initials: initials,
          ),
          UsernameStep(
            onSubmitPressed: (username) async {
              this.username = username;
              await _submit();
            },
            isLoading: state.isLoading,
          ),
        ],
      ),
    );
  }
}
