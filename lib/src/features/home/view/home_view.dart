import 'package:flutter/material.dart';
import 'package:health_pitstop/src/features/authentication/authentication.dart';
import 'package:health_pitstop/src/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text('Home'),
            AppButton.primary(
              onPressed: () => ref.read(authRepositoryProvider).signOut(),
              child: const Text('Se déconnecter'),
            ),
          ],
        ),
      ),
    );
  }
}
