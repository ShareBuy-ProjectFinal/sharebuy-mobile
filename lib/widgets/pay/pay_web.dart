// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:share_buy/application/routes/navigator_name.dart';
import 'package:share_buy/widgets/component/snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayWeb extends StatefulWidget {
  String url;
  PayWeb({super.key, required this.url});

  @override
  State<PayWeb> createState() => _PayWebState();
}

class _PayWebState extends State<PayWeb> {
  late final WebViewController _controller;
  late final WebViewCookieManager cookieManager = WebViewCookieManager();

  @override
  void initState() {
    // TODO: implement initState
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      //..setBackgroundColor(const Color(0x00000000))
      ..enableZoom(false)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            if (error.errorCode == -2) {
              MessageToast.showToast(context, 'Vui lòng bật kết nối mạng',
                  type: MessageType.error);
            }
          },
          onNavigationRequest: (NavigationRequest request) async {
            // if (request.url.startsWith(AppConstants.ssoRedirectUri)) {
            //   Uri uri = Uri.parse(request.url);
            //   String code = uri.queryParameters['code'] ?? '';
            //   Navigator.of(context).pop(code);
            //   return NavigationDecision.prevent;
            // }
            if (request.url.startsWith("momo://app")) {
              await launchUrl(Uri.parse(request.url));
              log("momo://app: ${request.url}");
              return NavigationDecision.prevent;
            }
            if (request.url.contains("message=Successful")) {
              Navigator.pushNamedAndRemoveUntil(
                  context,
                  NavigatorName.HOME_SCREEN,
                  arguments: {'currentIndex': 3, 'currentTabInderOrder': 1},
                  (route) => false);
            }
            log("request.url: ${request.url}");
            return NavigationDecision.navigate;
          },
        ),
      );
    super.initState();
    load();
  }

  void load() async {
    await cookieManager.clearCookies();
    _controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'),
        //  Navigator.pushNamedAndRemoveUntil(
        //               context,
        //               NavigatorName.HOME_SCREEN,
        //               arguments: {'currentIndex': 3},
        //               (route) => false);
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context,
                NavigatorName.HOME_SCREEN,
                arguments: {'currentIndex': 3, 'currentTabInderOrder': 0},
                (route) => false);
          },
        ),
      ),
      body: SafeArea(child: WebViewWidget(controller: _controller)),
    );
  }
}
