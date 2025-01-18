import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'signup_screen.dart';
import 'todo_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  String? errorMessage;

  void _login() async {
    try {
      await _auth.signIn(_emailController.text, _passwordController.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TodoScreen()));
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: Text('Login')),
            TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen())), child: Text('Sign Up')),
            if (errorMessage != null) Text(errorMessage!, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
