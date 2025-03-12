import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:media_list_view/photo_view.dart';
import 'package:media_list_view/photo_view_gallery.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MainApp());
}

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
          // child: PageView.builder(
          //   controller: controller,
          //   itemCount: 4,
          //   itemBuilder: (context, index) {
          //     if (index == 2) {
          //       return const VideoWidget();
          //     } else if (index == 3) {
          //       return const Text("final page");
          //     }
          //     return PhotoAttachmentWidget(
          //       img: listMedia[index],
          //     );
          //   },
          // ),
          child: PhotoViewGallery.builder(
            itemBuilder: (context, index) {
              if (index == 2) {
                return const VideoWidget();
              }
              return PhotoAttachmentWidget(
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

class PdfViewer extends StatelessWidget {
  final String pdfUrl =
      "https://pdfobject.com/pdf/sample.pdf"; // Replace with your PDF URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PDF Viewer")),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(pdfUrl)),
      ),
    );
  }
}

class PhotoAttachmentWidget extends StatelessWidget {
  const PhotoAttachmentWidget({
    super.key,
    required this.img,
  });
  final String img;
  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: NetworkImage(img),
      loadingBuilder: (context, event) =>
          const Center(child: CircularProgressIndicator()),
      errorBuilder: (_, __, ___) => const Center(
        child: Text("Can not load this video"),
      ),
      minScale: 1.0,
      maxScale: 4.0,
      filterQuality: FilterQuality.high,
    );
  }
}

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key});

  @override
  State<StatefulWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        setState(() {}); // Update UI after initialization
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                Positioned(
                  bottom: 16,
                  child: FloatingActionButton(
                    onPressed: _togglePlayPause,
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          : const CircularProgressIndicator(),
    );
  }
}
