import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_pitstop/l10n/string_hardcoded.dart';
import 'package:health_pitstop/src/app/routes/app_router.dart';
import 'package:health_pitstop/src/features/authentication/validators/auth_validators.dart';
import 'package:health_pitstop/src/features/authentication/view/sign_in_controller.dart';
import 'package:health_pitstop/src/utils/utils.dart';
import 'package:health_pitstop/src/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({
    this.onSignedIn,
    super.key,
  });

  final VoidCallback? onSignedIn;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> with SignInValidators {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text;
  String get password => _passwordController.text;

  var _submitted = false;

  @override
  void dispose() {
    _node.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    return value != null ? emailErrorText(value) : 'Adresse email requise';
  }

  String? _validatePassword(String? value) {
    return value != null ? passwordErrorText(value) : 'Mot de passe requis';
  }

  Future<void> _submit() async {
    setState(() => _submitted = true);

    // Validate form
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    final controller = ref.read(signInControllerProvider.notifier);
    final success = await controller.signIn(
      email: email,
      password: password,
    );

    if (success) {
      widget.onSignedIn?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signInControllerProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const PhosphorIcon(PhosphorIconsRegular.arrowLeft),
          onPressed: () => context.goNamed(AppRoute.welcome.name),
        ),
        title: Text(
          'Connexion'.hardcoded,
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
                  autoFillHints: const [AutofillHints.password],
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
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
                const Spacer(),
                const VSpace.xl(),
                AppButton.primary(
                  onPressed: state.isLoading ? () {} : _submit,
                  child: !state.isLoading
                      ? Text('Se connecter'.hardcoded)
                      : const AppProgressIndicator(color: AppColor.white),
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
        ),
      ),
    );
  }
}
