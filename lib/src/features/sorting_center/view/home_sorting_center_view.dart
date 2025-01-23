import 'package:flutter/material.dart';
import 'package:tennaxia_geolocation/src/utils/spacing.dart';
import 'package:tennaxia_geolocation/src/widgets/widgets.dart';

class HomeSortingCenterView extends StatelessWidget {
  const HomeSortingCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToxiMark'),
      ),
      body: const ScrollableColumn(
        children: [
          Text('Centre de tri'),
          VSpace.md(),
          Text("Aujourd'hui"),
          VSpace.lg(),
          // TODO(jonas): Add the list of today's pickups
          Text('À venir'),
          VSpace.lg(),
          // TODO(jonas): Add the list of upcoming pickups
          Text('Historique'),
          VSpace.lg(),
          // TODO(jonas): Add the list of past pickups
        ],
      ),
    );
  }
}
