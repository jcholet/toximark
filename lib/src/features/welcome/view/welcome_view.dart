import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_pitstop/l10n/string_hardcoded.dart';
import 'package:health_pitstop/src/app/routes/app_router.dart';
import 'package:health_pitstop/src/utils/utils.dart';
import 'package:health_pitstop/src/widgets/widgets.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollableColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            const VSpace.xl(),
            Center(
              child: Text(
                'Health Pitstop'.hardcoded,
                style: context.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const VSpace.md(),
            Center(
              child: Text(
                'Service médical'.hardcoded,
                style: context.textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
            ),
            const VSpace.xl(),
            const VSpace.xl(),
            // Description
            Text(
              'Votre allié santé pendant les 24h du Mans. '
                      "Connectez-vous et rejoignez l'équipe médicale !"
                  .hardcoded,
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const VSpace.xl(),
            const Spacer(),
            const VSpace.xl(),
            // Boutons
            AppButton.primary(
              onPressed: () => context.goNamed(AppRoute.signIn.name),
              child: Text('Se connecter'.hardcoded),
            ),
            const VSpace.lg(),
            AppButton.tinyTransparent(
              onPressed: () => context.replaceNamed(AppRoute.signUp.name),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Pas encore de compte ? '.hardcoded,
                      style: context.textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: 'Inscrivez-vous'.hardcoded,
                      style: context.textTheme.titleMedium,
                    ),
                  ],
                ),
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const VSpace.xl(),
          ],
        ),
      ),
    );
  }
}
