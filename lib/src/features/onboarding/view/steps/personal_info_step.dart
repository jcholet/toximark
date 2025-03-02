import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:health_pitstop/l10n/string_hardcoded.dart';
import 'package:health_pitstop/src/features/onboarding/onboarding.dart';
import 'package:health_pitstop/src/utils/utils.dart';
import 'package:health_pitstop/src/widgets/widgets.dart';

class PersonalInfoStep extends StatefulWidget {
  const PersonalInfoStep({
    required this.onNextPressed,
    super.key,
  });

  final void Function(String firstName, String lastName) onNextPressed;

  @override
  State<PersonalInfoStep> createState() => _PersonalInfoStepState();
}

class _PersonalInfoStepState extends State<PersonalInfoStep>
    with AutomaticKeepAliveClientMixin, OnboardingValidators {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _firstNameNode = FocusNode();
  final _lastNameNode = FocusNode();

  String get firstName => _firstNameController.text;
  String get lastName => _lastNameController.text;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.requestFocus(_firstNameNode);
    });
  }

  @override
  void dispose() {
    _firstNameNode.dispose();
    _lastNameNode.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  void _next() {
    if (_formKey.currentState!.validate()) {
      context.unfocus();
      widget.onNextPressed(firstName, lastName);
    }
  }

  void _firstNameEditingComplete() {
    if (canSubmitFirstName(firstName)) {
      _lastNameNode.requestFocus();
    }
  }

  void _lastNameEditingComplete() {
    if (canSubmitLastName(lastName)) {
      _next();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Form(
        key: _formKey,
        child: ScrollableColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            Text(
              'Vos informations personnelles ?'.hardcoded,
              style: context.textTheme.displayMedium?.copyWith(
                color: AppColor.primary,
              ),
            ).animate().fade(delay: 100.ms),
            const VSpace.xl(),
            AppTextField(
              controller: _firstNameController,
              focusNode: _firstNameNode,
              onEditingComplete: _firstNameEditingComplete,
              titleText: 'Prénom'.hardcoded,
              inputFormatters: [
                LengthLimitingTextInputFormatter(32),
                FilteringTextInputFormatter.deny(RegExp(r'\s{2,}')),
              ],
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (firstName) => firstNameErrorText(firstName ?? ''),
              autoFillHints: const [AutofillHints.givenName],
              textInputAction: TextInputAction.next,
              autocorrect: false,
              textCapitalization: TextCapitalization.words,
            ).animate().fade(delay: 100.ms),
            const VSpace.sm(),
            AppTextField(
              controller: _lastNameController,
              focusNode: _lastNameNode,
              onEditingComplete: _lastNameEditingComplete,
              titleText: 'Nom de famille'.hardcoded,
              inputFormatters: [
                LengthLimitingTextInputFormatter(32),
                FilteringTextInputFormatter.deny(RegExp(r'\s{2,}')),
              ],
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (lastName) => lastNameErrorText(lastName ?? ''),
              autoFillHints: const [AutofillHints.familyName],
              textInputAction: TextInputAction.next,
              autocorrect: false,
              textCapitalization: TextCapitalization.words,
            ).animate().fade(delay: 100.ms),
            const Spacer(),
            const VSpace.xl(),
            FadeInUp(
              duration: AppTime.slow,
              delay: AppTime.fast,
              curve: Curves.easeInOutBack,
              child: AppButton.primary(
                onPressed: _next,
                child: Text('Continuer'.hardcoded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
