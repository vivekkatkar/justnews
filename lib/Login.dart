import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 250,
                height: 250,
              ),
              SizedBox(height: 20),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD2D5D2),
                ),
              ),
              SizedBox(height: 20),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize
          .min, // Use mainAxisSize.min to allow the column to take minimum vertical space
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFD2D5D2),
            borderRadius: BorderRadius.circular(30),
          ),
          margin: EdgeInsets.only(bottom: 20),
          child: TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              prefixIcon: Icon(Icons.person),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFD2D5D2),
            borderRadius: BorderRadius.circular(30),
          ),
          margin: EdgeInsets.only(bottom: 10),
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              prefixIcon: Icon(Icons.lock),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Don't have an account?",
              style: TextStyle(color: Color(0xFFD2D5D2)),
            ),
            InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, "signup");
                },
                child: Text(
                  " Sign Up",
                  style: TextStyle(
                    color: Color(0xFFD2D5D2),
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ))
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                print('Username: ${_usernameController.text}');
                print('Password: ${_passwordController.text}');
                Navigator.pushReplacementNamed(context, "homepage");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFbe6d41),
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Login', style: TextStyle(fontSize: 18)),
            ),
          ),
        ),
      ],
    );
  }
}
