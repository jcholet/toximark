import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:health_pitstop/l10n/string_hardcoded.dart';
import 'package:health_pitstop/src/features/onboarding/onboarding.dart';
import 'package:health_pitstop/src/features/onboarding/view/widgets/username_input_controller.dart';
import 'package:health_pitstop/src/utils/utils.dart';
import 'package:health_pitstop/src/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UsernameStep extends ConsumerStatefulWidget {
  const UsernameStep({
    required this.onSubmitPressed,
    required this.isLoading,
    super.key,
  });

  final void Function(String) onSubmitPressed;
  final bool isLoading;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UsernameStepState();
}

class _UsernameStepState extends ConsumerState<UsernameStep>
    with AutomaticKeepAliveClientMixin, OnboardingValidators {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _node = FocusNode();

  String get username => _controller.text;

  bool get isLoading => widget.isLoading;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.requestFocus(_node);
    });
  }

  @override
  void dispose() {
    _node.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = ref.watch(usernameInputControllerProvider);
    final isAvailable = state.unwrapPrevious().value ?? false;

    return SafeArea(
      maintainBottomViewPadding: true,
      child: Form(
        key: _formKey,
        child: ScrollableColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            Text(
              "Votre nom d'utilisateur".hardcoded,
              style: context.textTheme.displayMedium?.copyWith(
                color: AppColor.primary,
              ),
            ).animate().fade(delay: 100.ms),
            const VSpace.sm(),
            Text(
              "Choisissez un nom d'utilisateur unique "
                      'pour être facilement identifiable par vos amis.'
                  .hardcoded,
              style: context.textTheme.bodyLarge,
            ).animate().fade(delay: 100.ms),
            const VSpace.xl(),
            UsernameInput(
              controller: _controller,
              onChanged: ref
                  .read(usernameInputControllerProvider.notifier)
                  .setUsername,
              validator: (username) => usernameErrorText(username ?? ''),
              focusNode: _node,
              readOnly: isLoading,
            ).animate().fade(delay: 100.ms),
            if (canSubmitUsername(username) && !state.isLoading) ...[
              const VSpace.lg(),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    if (isAvailable) ...[
                      const PhosphorIcon(
                        PhosphorIconsFill.checkCircle,
                        size: 20,
                        color: AppColor.primary,
                      ),
                      const HSpace.sm(),
                      Text(
                        "Ce nom d'utilisateur est disponible !".hardcoded,
                        style: context.textTheme.bodySmall,
                      ),
                    ] else ...[
                      const PhosphorIcon(
                        PhosphorIconsFill.warningCircle,
                        color: AppColor.red,
                        size: 20,
                      ),
                      const HSpace.sm(),
                      Text(
                        "Ce nom d'utilisateur est déjà pris".hardcoded,
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ],
                ),
              ),
            ],
            const Spacer(),
            const VSpace.xl(),
            FadeInUp(
              duration: AppTime.slow,
              delay: AppTime.fast,
              curve: Curves.easeInOutBack,
              child: AppButton.primary(
                onPressed: isAvailable && !isLoading
                    ? () => widget.onSubmitPressed(username)
                    : null,
                child: !isLoading
                    ? Text('Accéder à Health Pitstop'.hardcoded)
                    : const AppProgressIndicator(color: AppColor.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
