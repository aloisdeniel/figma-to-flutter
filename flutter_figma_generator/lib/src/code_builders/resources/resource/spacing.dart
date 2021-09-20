import 'resource.dart';

class SpacingResource extends Resource {
  const SpacingResource(
    String name,
    String instance,
  ) : super(name, instance);

  factory SpacingResource.fromFigma({
    required String name,
    required num value,
    double opacity = 1.0,
  }) {
    return SpacingResource(name, '${value.toDouble()}');
  }
}
