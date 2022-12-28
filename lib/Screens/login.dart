import 'package:flutter/material.dart';

import 'Home.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  String? _email;
  String? _password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Super Cars",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.red,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(width: 1, color: Colors.black),
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.email),
                                contentPadding: EdgeInsets.all(8)),
                            onSaved: (val) => _email = val,
                            onChanged: (val) => _email = val,
                            validator: (val) {
                              return val!.contains("@") ? null : "Invalid";
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                                contentPadding: EdgeInsets.all(8)),
                            onSaved: (val) => _password = val,
                            onChanged: (val) => _password = val,
                            validator: (val) {
                              return val!.length >= 8 ? null : "Invalid";
                            },
                          ),
                        ),
                        MaterialButton(
                          padding: const EdgeInsets.all(8),
                          color: Colors.blue[700],
                          onPressed: () => submit(context),
                          child: const Text("Login"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text("Create Account",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text("forgot password",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400)),
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Home()));
    }
  }
}
