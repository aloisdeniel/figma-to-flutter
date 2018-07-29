
abstract class Declaration {

  String get name;

  static Declaration parse(String value) {
    if(value == null)
      return StaticItem(null);

    // Dynamic
    if(value.startsWith("\$"))
    {
      return DynamicItem(value.substring(1));
    }

    // Directive
    if(value.startsWith("#"))
    {
      value = value.substring(1);
      var i = value.indexOf("(");
      var directive = value.substring(0, i);
      var child = Declaration.parse(value.substring(i+1, value.length-1));
      return DirectiveItem(directive, child);
    }

    return StaticItem(value);
  }
}

class StaticItem extends Declaration {
  final String _name;
  StaticItem(this._name);

  @override
  String get name => _name;
}

class DynamicItem extends Declaration {
  final String _name;
  DynamicItem(this._name);

  @override
  String get name => _name;
}

class DirectiveItem extends Declaration {
  final String directive;
  final Declaration item;
  DirectiveItem(this.directive, this.item);

  @override
  String get name => item.name;
}