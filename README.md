# Flutter Photo View 
THIS LIBRARY IS BASED ON PHOTO_VIEW, ALLOWING YOU TO CREATE A PAGE VIEW THAT CAN CONTAIN IMAGES, GIFS, PDFS, DOCS, AND VIDEOS SIMULTANEOUSLY WHILE STILL ENABLING ZOOM FUNCTIONALITY FOR IMAGES AND GIFS WITHOUT DISPLAY ISSUES.

A simple zoomable image/content widget for Flutter.

PhotoView enables images to become able to zoom and pan with user gestures such as pinch, rotate and drag.

It also can show any widget instead of an image, such as Container, Text or a SVG. 

Even though being super simple to use, PhotoView is extremely customizable though its options and the controllers. 


## Installation

Add `media_list_view` as a dependency in your pubspec.yaml file.

Import Photo View:
```dart
import 'package:media_list_view/media_list_view.dart';
```

## Docs & API

The [API Docs](https://pub.dartlang.org/documentation/photo_view/latest/photo_view/photo_view-library.html) some detailed information about how to use PhotoView.


If you want to see it in practice, check the [example app](https://github.com/bluefireteam/photo_view/tree/master/example/lib) that explores most of Photo View's use cases or download the latest version apk on the [releases page](https://github.com/bluefireteam/photo_view/releases)
 

## (Very) Basic usage

Given a `ImageProvider imageProvider` (such as [AssetImage](https://docs.flutter.io/flutter/painting/AssetImage-class.html) or [NetworkImage](https://docs.flutter.io/flutter/painting/NetworkImage-class.html)):

```dart
@override
Widget build(BuildContext context) {
  return Container(
    child: PhotoView(
      imageProvider: AssetImage("assets/large-image.jpg"),
    )
  );
}
```

Result: 

![In action](https://user-images.githubusercontent.com/6718144/56463745-45ec0380-63b0-11e9-8e56-0dba5deabb1a.gif)


Read more about the `PhotoView` widget [here](https://pub.dartlang.org/documentation/photo_view/latest/photo_view/PhotoView-class.html).


## Gallery

Show images and GIFs (zoomable) along with videos in a list, allowing users to navigate between them using PhotoViewGallery.

Read more about the gallery [here](https://pub.dartlang.org/documentation/photo_view/latest/photo_view_gallery/PhotoViewGallery-class.html).

```dart
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const img =
        'https://cdn2.tuoitre.vn/thumb_w/480/471584752817336320/2024/7/29/tuoi-tre-cuoi-tram-hoat-hinh-01-1722239999290630742377.jpg';
    const img2 =
        'https://vn.portal-pokemon.com/play/resources/pokedex/img/pm/cf47f9fac4ed3037ff2a8ea83204e32aff8fb5f3.png';
    const listIms = [img, img2];
    const video =
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';
    const listMedia = [
      img,
      img2,
      video,
      "https://shortpixel.com/blog/wp-content/uploads/2023/12/nyan-cat.gif"
    ];
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: PhotoViewGallery.builder(
            itemBuilder: (context, index) {
              if (index == 2) {
                return const VideoWidget(); //this is custom widget to show video not the from the lib
              }
              return PhotoAttachmentWidget(  //this is custom widget to show images not the from the lib
                img: listMedia[index],
              );
            },
            itemCount: listMedia.length,
          ),
        ),
      ),
    );
  }
}
```


## Usage with controllers

When you need to interact with PhotoView's internal state values, `PhotoViewController` and `PhotoViewScaleStateController` are the way to.

Controllers, when specified to PhotoView widget, enables the author(you) to listen for state updates through a `Stream` and change those values externally.

Read more about controllers [here](https://pub.dartlang.org/documentation/photo_view/latest/photo_view/PhotoView-class.html#controllers).

In the example app, we can see what can be achieved with controllers: 

![In action](https://user-images.githubusercontent.com/6718144/56464051-3328fd00-63b7-11e9-9c4d-73b04f72a81e.gif)

### More screenshots


| **Custom background, <br>small image <br>and custom alignment** | **Limited scale** | **Hero animation** |
| ------------- | ------------- | ------------- |
| ![In action](https://user-images.githubusercontent.com/6718144/56464128-ff4ed700-63b8-11e9-802e-a933b3e79ea3.gif) | ![In action](https://user-images.githubusercontent.com/6718144/56464182-23f77e80-63ba-11e9-87a9-4838ef20af7e.gif) | ![In action](https://user-images.githubusercontent.com/6718144/56464202-9700f500-63ba-11e9-9f47-14e8bf441958.gif) |
| **Part of the screen** | **Custom child** |
| ![In action](https://user-images.githubusercontent.com/6718144/56464215-d92a3680-63ba-11e9-9c37-d4796e992123.gif) | ![In action](https://user-images.githubusercontent.com/6718144/56464225-1b537800-63bb-11e9-9c5b-ea8632c99969.gif) |



