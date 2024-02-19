import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  // TextEditingController _mobileController = TextEditingController();
  // TextEditingController _otpController = TextEditingController();

    final _auth = FirebaseAuth.instance;
    final ref = FirebaseDatabase.instance.ref("Users");

    void addUser(){
        String id = _auth.currentUser!.uid.toString();

          ref.child(id).set({
            'id' : id,
            'name' : _usernameController.text.toString(),
            'email' : _emailController.text.toString(),
            'postcnt' : 0,
          }
          ).then((value) {
            // Fluttertoast.showToast(msg: "Added");
            print('Data Added');

            Navigator.pushReplacementNamed(context, "interests");
          }).catchError((error, stackTrace) {
            // Fluttertoast.showToast(msg: "Error");
            print('Error');
          });
    }

  void signUp(){
    if(_formKey.currentState!.validate()){
      _auth.createUserWithEmailAndPassword(
          email: _emailController.text.toString(),
          password: _passwordController.text.toString(),
      ).then((value) {
        _auth.signInWithEmailAndPassword(
          email: _usernameController.text.toString(),
          password: _passwordController.text.toString(),
        );

        addUser();
      }).onError((error, stackTrace) {
        print("Error Occered");
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png', // Replace with the actual path to your logo
                    height: 200,
                    width: 300,
                  ),
                ),
                Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "login");
                        },
                        child: Text(
                          " Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ))
                  ],
                ),
                //SizedBox(height: 5),
                Center(
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                buildTextField(
                  controller: _usernameController,
                  labelText: 'Username',
                  icon: Icons.person,
                ),
                SizedBox(height: 16),
                buildTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  obscureText: true,
                  icon: Icons.lock,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length != 8) {
                      return 'Password must be 8 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                buildTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  icon: Icons.email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email address';
                    } else if (!RegExp(
                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                // buildTextField(
                //   controller: _mobileController,
                //   labelText: 'Mobile Number',
                //   keyboardType: TextInputType.phone,
                //   icon: Icons.phone,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter a mobile number';
                //     } else if (value.length != 10) {
                //       return 'Mobile number must be 10 digits long';
                //     }
                //     return null;
                //   },
                // ),
                SizedBox(height: 16),
                // buildTextField(
                //   controller: _otpController,
                //   labelText: 'OTP',
                //   keyboardType: TextInputType.number,
                //   icon: Icons.security,
                //   validator: (value) {
                //     // Add OTP validation if needed
                //     return null;
                //   },
                // ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    signUp();
                    // if (_formKey.currentState!.validate()) {
                    //   // Form is valid, perform sign-up logic here
                    //   // For now, just print the form values
                    //   print('Username: ${_usernameController.text}');
                    //   print('Password: ${_passwordController.text}');
                    //   print('Email: ${_emailController.text}');
                    //   print('Mobile Number: ${_mobileController.text}');
                    //   print('OTP: ${_otpController.text}');
                    //   showSnackBar(context, 'Sign up successful!');
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Background color
                    padding:
                        EdgeInsets.symmetric(vertical: 16), // Increase padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Trigger form validation manually
          if (_formKey.currentState!.validate()) {
            showSnackBar(context, 'Validation passed!');
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false,
    TextInputType? keyboardType,
    IconData? icon,
    String? Function(String?)? validator,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Color(0xFFD2D5D2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none, // Remove TextField border
          ),
          prefixIcon: icon != null ? Icon(icon) : null,
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
