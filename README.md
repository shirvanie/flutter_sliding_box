# Sliding Box for Flutter
[![pub package](https://img.shields.io/pub/v/flutter_sliding_box.svg)](https://pub.dartlang.org/packages/flutter_sliding_box)
[![GitHub Stars](https://img.shields.io/github/stars/shirvanie/flutter_sliding_box.svg?logo=github)](https://github.com/shirvanie/flutter_sliding_box)
[![Platform](https://img.shields.io/badge/platform-all-green.svg)](https://img.shields.io/badge/platform-android%20|%20ios%20|%20linux%20|%20macos%20|%20web%20|%20windows-green.svg)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/shirvanie/flutter_sliding_box/blob/master/LICENSE)
[![likes](https://img.shields.io/pub/likes/flutter_sliding_box?logo=flutter)](https://pub.dev/packages/flutter_sliding_box/score)

A draggable flutter widget that makes it easier to use a SlidingBox panel for all platform. Boxes can be customized with your content and placed in your app.
<br><br>
To see examples of the following SlidingBoxes on the device or simulator:
```bash
cd example/
flutter run --release
```

## Demo

| Source link                                                                                                 | Light                                                                                                                                                                                      | Dark                                                                                                                                                                                    |
|-------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [example/lib/main.dart](https://github.com/shirvanie/flutter_sliding_box/blob/master/example/lib/main.dart) | <img width="150px" alt="Default Light" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/main_light.GIF" style="box-shadow: 0px 0px 7px #cccccc;"/>  | <img width="150px" alt="Default Dark" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/main_dark.GIF" style="box-shadow: 0px 0px 7px #cccccc;"/> |

| Source link                                                                                                             | Light                                                                                                                                                                                | Dark                                                                                                                                                                               |
|-------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [example/lib/map_screen.dart](https://github.com/shirvanie/flutter_sliding_box/blob/master/example/lib/map_screen.dart) | <img width="150px" alt="Map Light" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/map_light.GIF" style="box-shadow: 0px 0px 7px #cccccc;"/> | <img width="150px" alt="Map Dark" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/map_dark.GIF" style="box-shadow: 0px 0px 7px #cccccc;"/> |

<br>

| Source link                                                                                                                               | Light                                                                                                                                                                                                  | Dark                                                                                                                                                                                                 |
|-------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [example/lib/music_player_screen.dart](https://github.com/shirvanie/flutter_sliding_box/blob/master/example/lib/music_player_screen.dart) | <img width="150px" alt="Music Player Light" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/music_player_light.GIF" style="box-shadow: 0px 0px 7px #cccccc;"/> | <img width="150px" alt="Music Player Dark" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/music_player_dark.GIF" style="box-shadow: 0px 0px 7px #cccccc;"/> |

<br>

| Source link                                                                                                                 | Light                                                                                                                                                                                    |
|-----------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [example/lib/share_screen.dart](https://github.com/shirvanie/flutter_sliding_box/blob/master/example/lib/share_screen.dart) | <img width="150px" alt="Share Light" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/share_light.GIF" style="box-shadow: 0px 0px 7px #cccccc;"/> |


# Getting Started

1.  [Installation](#installation)
2.  [Usage](#usage)
3.  [Custom Usage](#custom-usage)
4.  [Backdrop Usage](#backdrop-usage)
5.  [Backdrop AppBar Usage](#backdrop-appBar-usage)
6.  [SearchBox Usage](#searchbox-usage)
7.  [Box Controller](#box-controller)
8.  [Body Builder](#body-builder)


## Installation

Add *flutter_sliding_box* as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_sliding_box: ^1.0.5
```

import the plugin package to your dart code

```dart
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
```

## Usage

<p>
 <img width="220px" alt="Simple SlidingBox" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/simple_box.png"/>
</p>

by default use SlidingBox as root widget for body (recommended)

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingBox(
        context: context,
        body: const Center(
          child: Text("This is the sliding box widget",
            style: TextStyle(color: Colors.black),),
        ),
        backdrop: Backdrop(
          color: Colors.blueGrey,
        ),
      ),
    );
  }
```

### Custom Usage

There are several options that allow for more control:

| Properties               | Description                                                                                                                                                                                               |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `body`                   | A widget that slides from `minHeight` to `maxHeight` and is placed on the `backdrop`                                                                                                                      |
| `bodyBuilder`            | Provides a `ScrollController` to attach to a scrollable widget in the box and current box position. If `body` and `bodyBuilder` are both non-null, `body` will be used                                    |
| `context`                | required `context` property                                                                                                                                                                               |
| `controller`             | It can be used to control the state of sliding box and search box                                                                                                                                         |
| `collapsed`              | If set to true, the state of the box is collapsed                                                                                                                                                         |
| `collapsedBody`          | The Widget displayed overtop the box when `collapsed`. This fades out as the sliding box is `opened`                                                                                                      |
| `width`                  | The `width` of the sliding box                                                                                                                                                                            |
| `minHeight`              | The height of the sliding box when fully `collapsed`                                                                                                                                                      |
| `maxHeight`              | The height of the sliding box when fully `opened`                                                                                                                                                         |
| `color`                  | The `color` to fill the background of the sliding box                                                                                                                                                     |
| `borderRadius`           | The corners of the sliding box are rounded by this                                                                                                                                                        |
| `style`                  | The styles of the sliding box that includes `boxShadow` and `boxUnderBox` and `none`                                                                                                                      |
| `physics`                | Gets a `ScrollPhysic`, the `physics` determines how the scroll view continues to animate after the user stops dragging the scroll view                                                                    |
| `draggable`              | Allows toggling of draggability of the sliding box. Tf set this to false, the sliding box cannot be dragged up or down                                                                                    |
| `draggableIcon`          | A Icon Widget that is placed in top of the box. Gets a IconData                                                                                                                                           |
| `draggableIconColor`     | The color of the `draggableIcon`. the position of the icon is top of the box                                                                                                                              |
| `draggableIconEnabled`   | If set to false, the `draggableIcon` hides. Use the `controller` to open and close sliding box by taps                                                                                                    |
| `draggableIconBackColor` | The color to fill the background of the `draggableIcon` icon. The position of the icon is top of the box                                                                                                  |
| `onBoxSlide`             | This callback is called when the sliding box slides around with position of the box. The position is a double value between `0.0` and `1.0`, where `0.0` is fully `collapsed` and `1.0` is fully `opened` |
| `onBoxOpen`              | This callback is called when the sliding box is fully opened                                                                                                                                              |
| `onBoxClose`             | This callback is called when the sliding box is fully closed                                                                                                                                              |
| `onBoxShow`              | This callback is called when the sliding box is visible                                                                                                                                                   |
| `onBoxHide`              | This callback is called when the sliding box is invisible                                                                                                                                                 |
| `onSearchBoxShow`        | This callback is called when the search box is visible                                                                                                                                                    |
| `onSearchBoxHide`        | This callback is called when the search box is invisible                                                                                                                                                  |
| `animationCurve`         | The `animationCurve` defines the easier behavior of the box animation                                                                                                                                     |
| `animationDuration`      | The `animationDuration` defines the time for the box animation to complete                                                                                                                                |
| `backdrop`               | A Widget that is placed under the box, the value should be filled with the `Backdrop` object                                                                                                              |

### Backdrop Usage

#### Using the `Backdrop`

Manually changing the properties of the  `Backdrop`

| Properties           | Description                                                                                                                                |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| `color`              | The `color` to fill the background of the `backdrop`                                                                                       |
| `width`              | The `width` of the `backdrop body`                                                                                                         |
| `fading`             | If set to `true`, the backdrop body `fades out` when the sliding box `opened`                                                              |
| `moving`             | If set to `true`, the backdrop body `moving up` when the sliding box `opened`                                                              |
| `overlay`            | If set to `true`, a dark layer displayed overtop the `backdrop` when sliding box is `opened`                                               |
| `overlayOpacity`     | The value of the dark layer overtop the `backdrop`. a double value between `0.0` and `1.0`                                                 |
| `backgroundGradient` | The `gradient color` to fill the `background` of the backdrop. if `color` and `backgroundGradient` are both non-null, `color` will be used |
| `body`               | A Widget that is placed in the backdrop and behind the sliding box                                                                         |
| `appBar`             | An app bar to display at the top of the backdrop                                                                                           |

<p>
 <img width="220px" alt="SlidingBox AppBar" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/app_bar.png"/>
</p>

SlidingBox includes appBar: `BackdropAppBar`

```dart
  BoxController boxController = BoxController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingBox(
        context: context,
        controller: boxController,
        minHeight: 200,
        maxHeight: 400,
        body: Center(
          child: Text("This is the sliding box widget",
            style: TextStyle(color: Colors.black),),
        ),
        backdrop: Backdrop(
          color: Colors.blueGrey,
          appBar: BackdropAppBar(
            title: Padding(
                padding: EdgeInsets.all(10),
                child: Text("AppBar", style: TextStyle(fontSize: 20),)
            ),
            leading: Icon(Icons.menu, color: Colors.white, size: 27,),
          ),
        ),
      ),
    );
  }
```

### Backdrop AppBar Usage

#### Using the `BackdropAppBar`

Manually changing the properties of the `BackdropAppBar`

| Properties   | Description                                                                                                                  |
|--------------|------------------------------------------------------------------------------------------------------------------------------|
| `title`      | A Widget that is placed on the topLeft of the `backdrop`                                                                     |
| `leading`    | A `Icon` Widget that is placed in left of the `title`                                                                        |
| `decoration` | The decoration to paint behind the child                                                                                     |
| `searchBox`  | An search box to display at the top of the `backdrop`. If non-null, an search `Icon` displayed on topRight of the `backdrop` |
| `actions`    | A list of Widgets that is placed on the topRight of the `backdrop`                                                           |


<p>
 <img width="220px" alt="SlidingBox AppBar SearchBox" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/app_bar_search_icon.png"/>

 <img width="220px" alt="SlidingBox AppBar SearchBox" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/app_bar_search_body.png"/>
</p>


SlidingBox appBar includes searchBox: `SearchBox`

```dart
  BoxController boxController = BoxController();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingBox(
        context: context,
        controller: boxController,
        minHeight: 200,
        maxHeight: MediaQuery.of(context).size.height - 100,
        body: Center(
          child: Text("This is the sliding box widget",
            style: TextStyle(color: Colors.black),),
        ),
        backdrop: Backdrop(
          color: Colors.blueGrey,
          appBar: BackdropAppBar(
            title: Padding(
                padding: EdgeInsets.all(10),
                child: Text("AppBar", style: TextStyle(fontSize: 20),)
            ),
            leading: Icon(Icons.menu, color: Colors.white, size: 27,),
            searchBox: SearchBox(
              controller: textEditingController,
              body: Center(
                child: Text("This is the search box body widget",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(25),
                  child: IconButton(
                    iconSize: 25,
                    icon: Icon(Icons.search, color: Colors.white, size: 27,),
                    onPressed: () {
                      textEditingController.text = "";
                      boxController.showSearchBox();
                    },
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
```

### SearchBox Usage

#### Using the `SearchBox`

Manually changing the properties of the `SearchBox`

| Properties        | Description                                                                                                                                                                                               |
|-------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `controller`      | It can be used to control the state of search box text field. Gets a `TextEditingController`                                                                                                              |
| `leading`         | A `Icon` Widget that is placed in left of the search box text field                                                                                                                                       |
| `color`           | The `color` to fill the background of the `SearchBox`                                                                                                                                                     |
| `inputDecoration` | The `decoration` to show around the search box text field                                                                                                                                                 |
| `borderRadius`    | The corners of the search box are rounded by this                                                                                                                                                         |
| `style`           | The `style` to use for the text being edited                                                                                                                                                              |
| `body`            | A Widget that is placed in the sliding box and under the searching box                                                                                                                                    |
| `draggableBody`   | Allows toggling of draggability of the sliding box. if set this to `false`, the sliding box cannot be dragged up or down when search box visible. If set this to true, search box invisible when dragging |


<p>
 <img width="220px" alt="SlidingBox Backdrop Overlay" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/backdrop_overlay_collapsed.png"/>

 <img width="220px" alt="SlidingBox Backdrop Overlay" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/backdrop_overlay_opened.png"/>
</p>

SlidingBox backdrop includes overlay: `true`

<br>

you can customize `overlayOpacity` (a value between `0.0` and `1.0`), default value is `0.5`

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingBox(
        context: context,
        body: const Center(
          child: Text("This is the sliding box widget",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backdrop: Backdrop(
          overlay: true,
          overlayOpacity: 0.5,
          color: Colors.grey,
        ),
      ),
    );
  }
```

<p>
 <img width="220px" alt="SlidingBox Backdrop Width" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/backdrop_width.png"/>

 <img width="220px" alt="SlidingBox Backdrop Width" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/box_width.png"/>
</p>

SlidingBox `backdrop width` and `body width`

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingBox(
        context: context,
        width: MediaQuery.of(context).size.width - 50,
        minHeight: 200,
        maxHeight: 400,
        body: Center(
          child: Text("This is the sliding box widget",
           style: TextStyle(color: Colors.black),),
        ),
        backdrop: Backdrop(
          width: MediaQuery.of(context).size.width - 100,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
```

<p>
 <img width="220px" alt="SlidingBox Box Style underBox" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/box_style_under_box.png"/>

 <img width="220px" alt="SlidingBox Box Style boxShadow" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/box_style_shadow.png"/>
</p>

SlidingBox includes style: `boxUnderBox` or `boxShadow`

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingBox(
        context: context,
        minHeight: 200,
        maxHeight: 400,
        style: BoxStyle.boxUnderBox, // or BoxStyle.boxShadow
        body: Center(
          child: Text("This is the sliding box widget",
            style: TextStyle(color: Colors.black),),
        ),
        backdrop: Backdrop(
          color: Colors.blueGrey,
        ),
      ),
    );
  }
```

### Box Controller

#### Using the `BoxController`

Manually changing the state of the `SlidingBox`. For better performance, use a `BoxController` as controller (recommended).

| Properties           | Data Type | Description                                                                                                                                                           |
|----------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `isAttached`         | `bool`    | Determine if the `boxController` is attached to an instance of the `SlidingBox` (this property must be `true` before any other `BoxController` functions can be used) |
| `isBoxOpen`          | `bool`    | Returns whether or not the box is `open`                                                                                                                              |
| `isBoxClosed`        | `bool`    | Returns whether or not the box is `close`                                                                                                                             |
| `isBoxVisible`       | `bool`    | Returns whether or not the box is `visible`                                                                                                                           |
| `isSearchBoxVisible` | `bool`    | Returns whether or not the search box is `visible`                                                                                                                    |
| `getPosition`        | `bool`    | Returns current box position (a value between `0.0` and `1.0`)                                                                                                        |
| `minHeight`          | `double`  | Returns current box `minHeight`                                                                                                                                       |
| `maxHeight`          | `double`  | Returns current box `maxHeight`                                                                                                                                       |
| `boxWidth`           | `double`  | Returns current box `width`                                                                                                                                           |
| `backdropWidth`      | `double`  | Returns current backdrop `width`                                                                                                                                      |

| Methods           | Return Type    | Description                                                                    |
|-------------------|----------------|--------------------------------------------------------------------------------|
| `openBox()`       | `Future<void>` | Opens the sliding box with animation (i.e. to the `maxHeight`)                 |
| `closeBox()`      | `Future<void>` | Closes the sliding box with animation (i.e. to the `minHeight`)                |
| `showBox()`       | `Future<void>` | Shows the sliding box (i.e. is visible)                                        |
| `hideBox()`       | `Future<void>` | Hides the sliding box (i.e. is invisible)                                      |
| `showSearchBox()` | `Future<void>` | Shows the search box (i.e. is visible)                                         |
| `hideSearchBox()` | `Future<void>` | Hides the search box (i.e. is invisible)                                       |
| `setPosition()`   | `Future<void>` | Sets the sliding box position with animation (a value between `0.0` and `1.0)` |
| `setSearchBody()` | `Future<void>` | Sets the search box `body` content                                             |

<p>
 <img width="220px" alt="BoxController" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/box_controller1.png"/>

 <img width="220px" alt="BoxController ShowSearchBox" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/box_controller2.png"/>
</p>

```dart
  BoxController boxController = BoxController();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingBox(
        context: context,
        controller: boxController,
        minHeight: 200,
        maxHeight: MediaQuery.of(context).size.height - 100,
        body: const Center(
          child: Text("This is the sliding box widget",
            style: TextStyle(color: Colors.black),),
        ),
        collapsed: true,
        backdrop: Backdrop(
          color: Colors.blueGrey,
          appBar: BackdropAppBar(
              searchBox: SearchBox(
                controller: textEditingController,
                body: Center(
                  child: MaterialButton(
                    child: Text("Hide SearchBox"),
                    onPressed: () {
                      boxController.hideSearchBox();
                      boxController.closeBox();
                    },
                    color: Colors.blueGrey,
                    textColor: Colors.white,
                  ),
                ),
                draggableBody: true,
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(25),
                    child: IconButton(
                      iconSize: 25,
                      icon: Icon(Icons.search, color: Colors.white, size: 27,),
                      onPressed: () {
                        textEditingController.text = "";
                        boxController.showSearchBox();
                      },
                    ),
                  ),
                ),
              ]
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    child: Text("Open"),
                    onPressed: () => boxController.openBox(),
                    color: Colors.white,
                  ),
                  MaterialButton(
                    child: Text("Close"),
                    onPressed: () => boxController.closeBox(),
                    color: Colors.white,
                  ),
                  MaterialButton(
                    child: Text("Show"),
                    onPressed: () => boxController.showBox(),
                    color: Colors.white,
                  ),
                  MaterialButton(
                    child: Text("Hide"),
                    onPressed: () => boxController.hideBox(),
                    color: Colors.white,
                  ),
                  MaterialButton(
                    child: Text("Show SearchBox"),
                    onPressed: () => boxController.showSearchBox(),
                    color: Colors.white,
                  ),
                  MaterialButton(
                    child: Text("Hide SearchBox"),
                    onPressed: () => boxController.hideSearchBox(),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
```

<br>

### Body Builder

#### Using the `bodyBuilder`

When content overflow in body widget, scroll enable automatically, and you can using the body builder to manage and control `scroll` and box `position`.
<p>
 <img width="220px" alt="SlidingBox BodyBuilder collapsed" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/body_builder_collapsed.png"/>

 <img width="220px" alt="SlidingBox BodyBuilder dragged" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/body_builder_dragged.png"/>

 <img width="220px" alt="SlidingBox BodyBuilder opened" src="https://raw.githubusercontent.com/shirvanie/flutter_sliding_box/master/screenshots/body_builder_opened.png"/>
</p>


```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingBox(
        context: context,
        minHeight: 200,
        maxHeight: 400,
        bodyBuilder: (sc, pos) => _body(sc, pos),
        backdrop: Backdrop(
           color: Colors.blueGrey,
        ),
      ),
    );
  }
 
  _body(ScrollController sc, double pos) {
     sc.addListener(() {
       print("scrollController position: ${sc.position.pixels}");
     });
     return Column(
       children: [
         SizedBox(height: 10,),
         Center(
           child: Text("box position: $pos",
              style: TextStyle(color: Colors.black),),
         ),
         SizedBox(height: 10,),
         Container(color: Colors.grey, height: 100,),
         SizedBox(height: 10,),
         Container(color: Colors.grey, height: 100,),
         SizedBox(height: 10,),
         Container(color: Colors.grey, height: 100,),
         SizedBox(height: 10,),
         Container(color: Colors.grey, height: 100,),
       ],
     );
  }
```
