import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/models/user_location.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';

class WebViewBox extends StatefulWidget {
  const WebViewBox({
    super.key,
    required this.company,
  });
  final String company;

  @override
  State<WebViewBox> createState() => _WebViewBoxState();
}

class _WebViewBoxState extends State<WebViewBox> {
  late WebViewController webViewController;
  final screen = locator<ScreenSizeHelper>();

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://www.google.com/maps/search/${widget.company}+${UserLocation.userPlace}'));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screen.width,
      height: screen.height * 0.85,
      child: WebViewWidget(controller: webViewController),
    );
  }
}
