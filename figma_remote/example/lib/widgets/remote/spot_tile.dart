import 'package:figma_remote/figma_remote.dart';
import 'package:flutter/widgets.dart';

import '../local/spot_tile.dart' as local;

class SpotTile extends local.SpotTile {
  const SpotTile({
    Key? key,
    required String name,
    required double positive,
  }) : super(
          key: key,
          name: name,
          positive: positive,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 140,
      child: RemoteFigmaComponent(
        componentName: 'SpotCard',
        variants: {
          'Mode': positive > 0.5 ? 'Good' : 'Bad',
        },
        data: RemoteFigmaData(
          text: {
            'name': name,
            'description':
                '${(positive * 100).toInt()}% de conditions positives'
          },
        ),
      ),
    );
  }
}
