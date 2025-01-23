import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tennaxia_geolocation/l10n/string_hardcoded.dart';
import 'package:tennaxia_geolocation/src/features/authentication/view/sign_in_controller.dart';
import 'package:tennaxia_geolocation/src/utils/utils.dart';
import 'package:tennaxia_geolocation/src/widgets/widgets.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({
    this.onSignedIn,
    super.key,
  });

  final VoidCallback? onSignedIn;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
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

  Future<void> _submit() async {
    setState(() => _submitted = true);
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
                Text(
                  'Tennaxia - ToxiMark'.hardcoded,
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: AppColor.primary,
                  ),
                ),
                const VSpace.xl(),
                const VSpace.xl(),
                AppTextField(
                  controller: _emailController,
                  titleText: 'Adresse email'.hardcoded,
                  autoFillHints: const [AutofillHints.email],
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
