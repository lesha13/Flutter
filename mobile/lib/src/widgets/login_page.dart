import 'package:flutter/material.dart';
import 'package:mobile/src/services/auth_service.dart';

import 'package:mobile/src/providers/auth_provider.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);
  static String route = "/account";

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  String _username = "";
  String _password = "";

  Future<void> _login(String username, String password) async {
    List<String> tokens = await getTokens(username, password);
    if (tokens.isNotEmpty) {
    //   // Update providers with access and refresh tokens
    //   ref.read(accessProvider.notifier).state = tokens[0]; // Access token
    //   ref.read(refreshProvider.notifier).state = tokens[1]; // Refresh token (assuming tokens[1] is refresh token)
      
    //   // Handle successful login (e.g., navigate to another screen)
    //   Navigator.pushReplacementNamed(context, '/home'); // Replace with your desired route
    // } else {
    //   // Handle login failure (e.g., display error message)
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Login failed!')),
    //   );
    print(tokens);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Username",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) => setState(() => _username = value!),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) => setState(() => _password = value!),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await _login(_username, _password);
                      // Handle successful login or display error message
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

