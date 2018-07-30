![logo](docs/logo.png)

A Dart code generator that converts Figma components to Flutter widgets.

## Try it

**Disclaimer : All of this is purely experimental and under active development (read why I started the project [here](https://aloisdeniel.github.io/introducing-figma-to-flutter/)).** 

The easiest way is to use the [online tool](http://aloisdeniel.github.com/figma-to-flutter).

## Documentation

### Dynamic elements

**Example:** `$checkmark`

You can declare nodes as dynamic by starting name with `$`.

A `<WidgetName>Data` class is generated alonside the main class, with a property for each dynamic element.

Dynamic properties are exposed and depend on node type :

* `NODE`
    * `isVisible`: indicates whether the node and its children should be drawn.
* `TEXT`
    * `text` : the content of the text node. The style is the style of the first declared character.

### Directive

All directives start with `#` and allow you to control behavior of your components by pluging Flutter elements.

#### `tap` - `RECTANGLE`

**Example:** `#tap(onSelected)`

Defines a rectangle as a tappable area (an [InkWell](https://docs.flutter.io/flutter/material/InkWell-class.html)) with a callback.

#### `widget` - `NODE`

**Example:** `#widget(field)`

Includes a widget at the node location.


## Roadmap

- [ ] **Semantics**
- [ ] **Build time generator** : creating a generator for updating widgets at build time (like `built_value`).
- [ ] **Drawing**
    - [ ] Fills
        - [ ] `GRADIENT_ANGULAR`
        - [ ] `GRADIENT_DIAMOND`
        - [ ] `GRADIENT_EMOJI`
        - [ ] `GRADIENT_IMAGE`
            - [ ] Scale Modes
                - [ ] `FILL`
                - [ ] `FIT`
                - [ ] `TILE`
                - [ ] `STRETCH`
    - [ ] Effects
        - [ ] `INNER_SHADOW`
        - [ ] `LAYER_BLUR`
        - [ ] `BACKGROUND_BLUR`

    - [ ] Blend modes (*All is considered *`PASS_THROUGH`/`NORMAL`)
    - [ ] Text fills
    - [ ] Masks & Clips
    - [ ] Styles

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/aloisdeniel/figma-to-flutter/issues