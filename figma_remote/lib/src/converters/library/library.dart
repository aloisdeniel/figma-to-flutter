import 'package:figma/figma.dart';
import 'package:figma_remote/src/converters/nodes/node.dart';
import 'package:figma_remote/src/helpers/api_extensions.dart';
import 'package:rfw/dart/model.dart';
import 'package:collection/collection.dart';

RemoteWidgetLibrary buildFigmaLibrary({
  required FileResponse file,
}) {
  final components = file.components?.entries.map(
    (x) => file.document!.findNodeWithId(x.key),
  );

  var index = 0;
  return RemoteWidgetLibrary(
    [
      const Import(
        LibraryName(<String>['core', 'widgets']),
      ),
      const Import(
        LibraryName(<String>['addons', 'widgets']),
      ),
    ],
    [
      if (components != null)
        ...components.whereNotNull().map(
              (node) => WidgetDeclaration(
                node.name ?? 'component${index++}',
                null,
                convertNode(node)!,
              ),
            ),
    ],
  );
}
