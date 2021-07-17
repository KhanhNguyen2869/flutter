import 'package:flutter/material.dart';
import 'package:testlogin/api.dart';
import 'package:testlogin/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  String message = "";

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: userController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'email cannot be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'pass cannot be empty';
                    }
                    return null;
                  },
                ),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var username = userController.text;
                      var password = passwordController.text;
                      setState(() {
                        message = "please wait";
                      });
                      var rep = await loginUser(username, password);
                      print(rep);

                      if (rep.status == 'success') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
                    }
                  },
                  child: Text("Login"),
                ),
                Text(message),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
