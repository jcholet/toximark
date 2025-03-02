import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:health_pitstop/l10n/string_hardcoded.dart';
import 'package:health_pitstop/src/features/onboarding/view/widgets/birthdate_picker.dart';
import 'package:health_pitstop/src/utils/utils.dart';
import 'package:health_pitstop/src/widgets/widgets.dart';

class BirthdateStep extends StatefulWidget {
  const BirthdateStep({
    required this.onNextPressed,
    super.key,
  });

  final void Function(DateTime) onNextPressed;

  @override
  State<BirthdateStep> createState() => _BirthdateStepState();
}

class _BirthdateStepState extends State<BirthdateStep>
    with AutomaticKeepAliveClientMixin {
  DateTime? _birthdate;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      maintainBottomViewPadding: true,
      child: ScrollableColumn(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(
            'Votre anniversaire'.hardcoded,
            style: context.textTheme.displayMedium?.copyWith(
              color: AppColor.primary,
            ),
          ).animate().fade(delay: 100.ms),
          const VSpace.md(),
          Text(
            'Veuillez indiquer votre date de naissance pour personnaliser '
                    'votre expérience. Vos informations personnelles resteront '
                    'confidentielles et sécurisées.'
                .hardcoded,
            style: context.textTheme.bodyLarge,
          ).animate().fade(delay: 100.ms),
          const VSpace.xxl(),
          BirthdatePicker(
            onDateChanged: (date) {
              setState(() => _birthdate = date);
            },
          ).animate().fade(delay: AppTime.medium).scale(
                delay: AppTime.medium,
                duration: AppTime.medium,
                curve: Curves.easeOutBack,
              ),
          const VSpace.xl(),
          if (_birthdate != null) ...[
            const Spacer(),
            const VSpace.xl(),
            FadeInUp(
              duration: AppTime.slow,
              delay: AppTime.fast,
              curve: Curves.easeInOutBack,
              child: AppButton.primary(
                onPressed: () => widget.onNextPressed(_birthdate!),
                child: Text('Continuer'.hardcoded),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
