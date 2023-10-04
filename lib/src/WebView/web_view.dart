import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '/src/WebView/component/body.dart';

class WebViewScreen extends StatelessWidget {
  final String? urlHelpo;
  final String? emailHelpo;

  const WebViewScreen({
    Key? key,
    this.urlHelpo,
    this.emailHelpo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(urlHelpo: urlHelpo, emailHelpo: emailHelpo),
    );
  }
}
