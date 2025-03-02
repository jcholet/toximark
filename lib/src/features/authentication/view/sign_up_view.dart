import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_pitstop/l10n/string_hardcoded.dart';
import 'package:health_pitstop/src/app/routes/app_router.dart';
import 'package:health_pitstop/src/features/authentication/validators/auth_validators.dart';
import 'package:health_pitstop/src/features/authentication/view/sign_up_controller.dart';
import 'package:health_pitstop/src/utils/utils.dart';
import 'package:health_pitstop/src/utils/validators/string_validators.dart';
import 'package:health_pitstop/src/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({
    this.onSignedUp,
    super.key,
  });

  final VoidCallback? onSignedUp;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> with SignUpValidators {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String get email => _emailController.text;
  String get password => _passwordController.text;
  String get confirmPassword => _confirmPasswordController.text;

  var _submitted = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        // Force rebuild when password changes to update strength indicator
      });
    });
  }

  @override
  void dispose() {
    _node.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    return value != null ? emailErrorText(value) : 'Adresse email requise';
  }

  String? _validatePassword(String? value) {
    return value != null ? passwordErrorText(value) : 'Mot de passe requis';
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez confirmer votre mot de passe';
    }
    return confirmPasswordErrorText(password, value);
  }

  Future<void> _submit() async {
    setState(() {
      _submitted = true;
      _errorMessage = null;
    });

    // Validate form
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    final controller = ref.read(signUpControllerProvider.notifier);
    final success = await controller.signUp(
      email: email,
      password: password,
    );

    if (success) {
      widget.onSignedUp?.call();
    } else {
      // Récupérer l'erreur depuis le contrôleur
      final error = ref.read(signUpControllerProvider).error;
      setState(() {
        if (error != null && error.toString().contains('not authorized')) {
          _errorMessage = "Cet email n'est pas autorisé à s'inscrire."
              " Veuillez contacter l'administrateur.";
        } else if (error != null &&
            error.toString().contains('already exists')) {
          _errorMessage = 'Cet email est déjà utilisé. '
              'Veuillez vous connecter ou utiliser un autre email.';
        } else if (error != null && error.toString().contains('whitelist')) {
          _errorMessage =
              "Cet email n'est pas dans la liste des utilisateurs autorisés."
              " Veuillez contacter l'administrateur.";
        } else {
          _errorMessage =
              "Une erreur est survenue lors de l'inscription: $error";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signUpControllerProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const PhosphorIcon(PhosphorIconsRegular.arrowLeft),
          onPressed: () => context.goNamed(AppRoute.welcome.name),
        ),
        title: Text(
          'Inscription'.hardcoded,
          style: context.textTheme.displaySmall,
        ),
      ),
      body: SafeArea(
        child: FocusScope(
          node: _node,
          child: Form(
            key: _formKey,
            child: ScrollableColumn(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: [
                const VSpace.xl(),
                // Affichage du message d'erreur
                if (_errorMessage != null)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.only(bottom: AppSpacing.lg),
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.shade300),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _errorMessage!,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: Colors.red.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                AppTextField(
                  controller: _emailController,
                  titleText: 'Adresse email'.hardcoded,
                  autoFillHints: const [AutofillHints.email],
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  validator: _submitted ? _validateEmail : null,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                    child: PhosphorIcon(
                      PhosphorIconsRegular.envelopeSimple,
                      size: 24,
                    ),
                  ),
                  enabled: !state.isLoading,
                ),
                const VSpace.lg(),
                AppTextField(
                  controller: _passwordController,
                  titleText: 'Mot de passe'.hardcoded,
                  autovalidateMode: _submitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  validator: _submitted ? _validatePassword : null,
                  autoFillHints: const [AutofillHints.newPassword],
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                    child: PhosphorIcon(
                      PhosphorIconsRegular.lock,
                      size: 24,
                    ),
                  ),
                  enabled: !state.isLoading,
                ),
                const VSpace.sm(),
                Text(
                  'Le mot de passe doit contenir :'.hardcoded,
                  style: context.textTheme.bodySmall,
                ),
                const VSpace.sm(),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.xs,
                  children: [
                    _buildCriteriaChip(
                      'Min. 8 caractères',
                      MinLengthValidator(8).isValid(password),
                    ),
                    _buildCriteriaChip(
                      'Majuscules & minuscules',
                      CapitalAndLowercaseValidator().isValid(password),
                    ),
                    _buildCriteriaChip(
                      'Caractère spécial',
                      SpecialCharacterValidator().isValid(password),
                    ),
                    _buildCriteriaChip(
                      'Chiffre',
                      DigitValidator().isValid(password),
                    ),
                  ],
                ),
                const VSpace.lg(),
                AppTextField(
                  controller: _confirmPasswordController,
                  titleText: 'Confirmer le mot de passe'.hardcoded,
                  autovalidateMode: _submitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  validator: _submitted ? _validateConfirmPassword : null,
                  autoFillHints: const [AutofillHints.newPassword],
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  autocorrect: false,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                    child: PhosphorIcon(
                      PhosphorIconsRegular.lockKey,
                      size: 24,
                    ),
                  ),
                  enabled: !state.isLoading,
                ),
                const Spacer(),
                const VSpace.xl(),
                AppButton.primary(
                  onPressed: state.isLoading ? () {} : _submit,
                  child: !state.isLoading
                      ? Text("S'inscrire".hardcoded)
                      : const AppProgressIndicator(color: AppColor.white),
                ),
                const VSpace.lg(),
                AppButton.tinyTransparent(
                  onPressed: () => context.goNamed(AppRoute.signIn.name),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Déjà un compte ? '.hardcoded,
                          style: context.textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: 'Se connecter'.hardcoded,
                          style: context.textTheme.titleMedium,
                        ),
                      ],
                    ),
                    style: context.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const VSpace.sm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCriteriaChip(String label, bool isValid) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isValid ? AppColor.primary : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isValid
            ? [
                BoxShadow(
                  color: AppColor.primary.withValues(alpha: 0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      margin: const EdgeInsets.only(bottom: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: isValid ? Colors.white : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isValid ? Colors.white : AppColor.primary,
                  width: 2,
                ),
              ),
              child: isValid
                  ? const Icon(
                      Icons.check,
                      size: 12,
                      color: AppColor.primary,
                    )
                  : null,
            ),
            const SizedBox(width: 6),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: context.textTheme.bodySmall!.copyWith(
                color: isValid ? Colors.white : AppColor.primary,
                fontWeight: FontWeight.bold,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
