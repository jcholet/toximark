import 'dart:async';

import 'package:health_pitstop/src/features/profile/data/profile_repository.dart';
import 'package:health_pitstop/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'username_input_controller.g.dart';

@riverpod
class UsernameInputController extends _$UsernameInputController {
  /// Used to debounce the input queries.
  final _usernameController = StreamController<String>();
  late final StreamSubscription<String> _subscription;

  @override
  FutureOr<bool> build() {
    // Debounce the inputs
    _subscription = _usernameController.stream
        .debounceTime(AppTime.debounce)
        .listen(_updateState);
    // Don't forget to close the StreamController on dispose
    ref.onDispose(() {
      _usernameController.close();
      _subscription.cancel();
    });
    // By default, the username is not available
    return false;
  }

  void setUsername(String username) {
    // Trim the username
    final trimmedUsername = username.trim();

    if (trimmedUsername.length >= 3) {
      // Reset the state to loading
      state = const AsyncValue.loading();

      // Add the username to the sink so it can be debounced
      _usernameController.sink.add(trimmedUsername);
    } else {
      // If the username is too short, reset the state to false
      state = const AsyncValue.data(false);
    }
  }

  Future<void> _updateState(String username) async {
    final profileRepository = ref.read(profileRepositoryProvider);
    state = await AsyncValue.guard(
      () => profileRepository.isUsernameAvailable(username),
    );
  }
}
