import 'package:flutter_map/flutter_map.dart';
import 'package:health_pitstop/src/utils/utils.dart';

class AppTileLayer extends TileLayer {
  AppTileLayer({
    super.key,
    super.retinaMode,
  }) : super(
          urlTemplate:
              'https://api.mapbox.com/styles/v1/${Env.mapboxUsername}/${Env.mapboxStyleId}/tiles/512/{z}/{x}/{y}{r}?access_token=${Env.mapboxAccessToken}',
          userAgentPackageName: 'fr.tipsst.tipsst',
        );
}
