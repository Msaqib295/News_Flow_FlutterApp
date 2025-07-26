import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  final String url;
  const NewsWebView({super.key, required this.url});

  @override
  State<NewsWebView> createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              _isLoading = true;
              _hasError = false;
            });
            debugPrint('Loading: $url');
          },
          onPageFinished: (url) {
            setState(() {
              _isLoading = false;
            });
            debugPrint('Finished loading: $url');
          },
          onWebResourceError: (error) {
            setState(() {
              _isLoading = false;
              _hasError = true;
              _errorMessage = error.description;
            });
            debugPrint('Error loading page: ${error.description}');
          },
        ),
      );

    if (widget.url.isNotEmpty && Uri.tryParse(widget.url)?.hasAbsolutePath == true) {
      _controller.loadRequest(Uri.parse(widget.url));
    } else {
      setState(() {
        _isLoading = false;
        _hasError = true;
        _errorMessage = 'Invalid URL provided.';
      });
      debugPrint('Invalid URL: ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
      ),
      body: Stack(
        children: [
          if (!_hasError)
            WebViewWidget(controller: _controller)
          else
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Failed to load page:\n$_errorMessage',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
              ),
            ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}