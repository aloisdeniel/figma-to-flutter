import 'resource.dart';

class RadiusResource extends Resource {
  const RadiusResource(
    String name,
    String instance,
  ) : super(name, instance);

  factory RadiusResource.fromFigma({
    required String name,
    required num value,
  }) {
    return RadiusResource(
      name,
      value == 0 ? 'Radius.zero' : 'Radius.circular(${value.toDouble()})',
    );
  }
}
