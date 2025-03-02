import 'dart:async';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:health_pitstop/src/bootstrap.dart';

void main() {
  unawaited(bootstrap());
  Animate.restartOnHotReload = true;
}
