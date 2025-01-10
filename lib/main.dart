import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  late InAppWebViewController webViewController;
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      body: PopScope(
        //  onPopInvokedWithResult: (popDisposition, result) async {
        //   // Handle back navigation with popDisposition and result
        //   if (popDisposition == PopDisposition.bubble) {
        //     if (await webViewController.canGoBack()) {
        //       await webViewController.goBack(); // Navigate back in WebView history
        //       return PopDisposition.doNotBubble; // Prevent the app from closing
        //     }
        //   }
        //   return PopDisposition.bubble; // Allow app to close
        // },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: InAppWebView(
                  initialSettings: InAppWebViewSettings(
                    supportZoom: false,
                    disableHorizontalScroll: true,
                    cacheEnabled: true,
                    allowsBackForwardNavigationGestures: false,
                    //disableVerticalScroll: true,
                  ),
                  initialUrlRequest: URLRequest(
                    url: WebUri("https://iconic.disreportcard.com/"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
