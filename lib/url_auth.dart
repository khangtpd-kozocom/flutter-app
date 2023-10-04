import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'src/WebView/web_view.dart';
import 'src/components/form_error.dart';

class UrlAndAuth extends StatefulWidget {
  @override
  _UrlAndAuthState createState() => _UrlAndAuthState();
}

class _UrlAndAuthState extends State<UrlAndAuth> {
  final _formKey = GlobalKey<FormState>();
  late String emailHelpo;
  late String urlHelpo;
  final emailController = TextEditingController();
  final urlController = TextEditingController();

  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: buildUrlFormField(),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 0),
            child: FormError(errors: errors),
          ),
          ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebViewScreen(
                                emailHelpo: emailController.text,
                                urlHelpo: urlController.text,
                              )));
                }
              },
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              child: const Text('Test')),
        ],
      ),
    );
  }

  TextFormField buildUrlFormField() {
    return TextFormField(
      controller: urlController,
      onSaved: (newValue) => urlHelpo = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: 'Nhập link vào bro ơi');
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: 'Nhập link vào bro ơi');
          return "";
        }
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Url",
        hintText: "Nhập Link",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
