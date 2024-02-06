// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_pw_validator/flutter_pw_validator.dart';
// import 'package:flutter_singing/Component/background.dart';
// import 'package:flutter_singing/Screens/RegisterPage.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter_singing/Screens/forgot.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// var _islogin = true;
// final _firebase = FirebaseAuth.instance;
// User? _curentUser = FirebaseAuth.instance.currentUser;
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   var _enteredEmail = '';
//   var _enteredUserName = '';
//   var _enteredPassword = '';
//   var _authenticating = false;
//
//
//   String? validatePassword(String password) {
//     if (password.length < 8) {
//       return 'Password must be at least 8 characters long';
//     } else if (!password.contains(RegExp(r'[A-Z]'))) {
//       return 'Password must contain at least one uppercase letter';
//     } else if (!password.contains(RegExp(r'[0-9]'))) {
//       return 'Password must contain at least one digit';
//     } else {
//       return null; // No warning, password is valid
//     }
//   }
//
//   void submit() async {
//     final _isValid = _formKey.currentState!.validate();
//     if (!_isValid) {
//       return;
//     }
//     _formKey.currentState!.save();
//     print(_enteredEmail);
//     print(_enteredPassword);
//     print(_firebase);
//
//     try {
//       setState(() {
//         _authenticating = true;
//       });
//       final userCredential = await _firebase.signInWithEmailAndPassword(
//           email: _enteredEmail, password: _enteredPassword);
//     } on FirebaseAuthException catch (error) {
//       ScaffoldMessenger.of(context).clearSnackBars();
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(error.message ?? 'Authentication failed'),
//         ),
//       );
//     }
//     print("completed");
//     setState(() {
//       _authenticating = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     // var passwordTextController;
//     return Scaffold(
//       body: Background(
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   padding: EdgeInsets.symmetric(horizontal: 40),
//                   child: Text(
//                     "LOGIN",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF2661FA),
//                         fontSize: 36),
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//                 SizedBox(height: size.height * 0.03),
//                 Container(
//                   alignment: Alignment.center,
//                   margin: EdgeInsets.symmetric(horizontal: 40),
//                   // child: TextField(
//                   //   decoration: InputDecoration(labelText: "Username"),
//                   // ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       hintText: 'Enter your email',
//                       prefixIcon:
//                       Icon(Icons.email), // Prefix icon for email
//                       // Custom border
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: BorderSide(
//                           color: Colors.blue, // Border color
//                           width: 2.0, // Border width
//                         ),
//                       ),
//                       // Focused border
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: BorderSide(
//                           color: Colors
//                               .green, // Border color when focused
//                           width: 2.0, // Border width when focused
//                         ),
//                       ),
//                       // Error border
//                       errorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: BorderSide(
//                           color: Colors
//                               .red, // Border color when there's an error
//                           width:
//                           2.0, // Border width when there's an error
//                         ),
//                       ),
//                       // Error text style
//                       errorStyle: TextStyle(color: Colors.red),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     autocorrect: false,
//                     textCapitalization: TextCapitalization.none,
//                     validator: (value) {
//                       if (!EmailValidator.validate(value.toString())) {
//                         return 'Please enter a valid email address';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       _enteredEmail = value!;
//                     },
//                   ),
//                 ),
//
//                 SizedBox(height: size.height * 0.03),
//                 Container(
//                   alignment: Alignment.center,
//                   margin: EdgeInsets.symmetric(horizontal: 40),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       hintText: 'Enter your Password',
//                       prefixIcon:
//                       Icon(Icons.password_outlined), // Prefix icon for email
//                       // Custom border
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: BorderSide(
//                           color: Colors.blue, // Border color
//                           width: 2.0, // Border width
//                         ),
//                       ),
//                       // Focused border
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: BorderSide(
//                           color: Colors
//                               .green, // Border color when focused
//                           width: 2.0, // Border width when focused
//                         ),
//                       ),
//                       // Error border
//                       errorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: BorderSide(
//                           color: Colors
//                               .red, // Border color when there's an error
//                           width:
//                           2.0, // Border width when there's an error
//                         ),
//                       ),
//                       // Error text style
//                       errorStyle: TextStyle(color: Colors.red),
//                     ),
//                     keyboardType: TextInputType.visiblePassword,
//                     obscureText: true,
//                     autocorrect: false,
//                     textCapitalization: TextCapitalization.none,
//                     validator: (value) {
//                       return validatePassword(value.toString());
//                     },
//                     onSaved: (value) {
//                       // Passwordcontroller = value!;
//                       _enteredPassword = value!;
//                     },
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.centerRight,
//                   margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                   child: GestureDetector(
//                     onTap: (){
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
//                     }
//                   ),
//                 ),
//                 SizedBox(height: size.height * 0.05),
//                 Container(
//                   alignment: Alignment.centerRight,
//                   margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                   child: ElevatedButton(
//                     onPressed: submit,
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       primary: Colors.blue, // Set the background color
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 20.0), // Adjust padding as needed
//                     ),
//                     child: Text(
//                       "LOGIN",
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white, // Set the text color
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.centerRight,
//                   margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                   child: GestureDetector(
//                     onTap: () => {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => RegisterScreen()))
//                     },
//                     child: Text(
//                       "Don't Have an Account? Sign up",
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF2661FA)),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_singing/Component/background.dart';
import 'package:flutter_singing/Screens/LoginPage.dart';
import 'package:flutter_singing/Screens/RegisterPage.dart';
import 'package:flutter_singing/Screens/forgot.dart';
import 'package:flutter_singing/Screens/home.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


var _islogin = true;
final _firebase = FirebaseAuth.instance;
User? _curentUser = FirebaseAuth.instance.currentUser;

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';

  String? validatePassword(String? value) {
    // Password length should be at least 8 characters
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Password should contain at least one uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    // Password should contain at least one lowercase letter
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    // Password should contain at least one digit
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }

    // Password should contain at least one special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    // All validation checks passed
    return null;
  }


  void submit() async {
    final _isValid = _formKey.currentState!.validate();
    if (!_isValid) {
      return;
    }
    _formKey.currentState!.save();
    try {
      final userCredential = await _firebase.signInWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication failed'),
        ),
      );
    }
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));

  }
  // var _authenticating = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA),
                        fontSize: 36
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                // Container(
                //   alignment: Alignment.center,
                //   margin: EdgeInsets.symmetric(horizontal: 60),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       labelText: 'Name',
                //       hintText: 'Enter your full Name',
                //       prefixIcon:
                //       Icon(Icons.person), // Prefix icon for email
                //       // Custom border
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10.0),
                //         borderSide: BorderSide(
                //           color: Colors.blue, // Border color
                //           width: 2.0, // Border width
                //         ),
                //       ),
                //       // Focused border
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10.0),
                //         borderSide: BorderSide(
                //           color: Colors
                //               .green, // Border color when focused
                //           width: 2.0, // Border width when focused
                //         ),
                //       ),
                //       // Error border
                //       errorBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10.0),
                //         borderSide: BorderSide(
                //           color: Colors
                //               .red, // Border color when there's an error
                //           width:
                //           2.0, // Border width when there's an error
                //         ),
                //       ),
                //       // Error text style
                //       errorStyle: TextStyle(color: Colors.red),
                //     ),
                //     keyboardType: TextInputType.emailAddress,
                //     autocorrect: false,
                //     textCapitalization: TextCapitalization.none,
                //     onSaved: (value) {
                //       _enteredName = value!;
                //     },
                //   ),
                // ),

                // SizedBox(height: size.height * 0.03),
                //
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      prefixIcon:
                      Icon(Icons.email), // Prefix icon for email
                      // Custom border
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      // Focused border
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors
                              .green, // Border color when focused
                          width: 2.0, // Border width when focused
                        ),
                      ),
                      // Error border
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors
                              .red, // Border color when there's an error
                          width:
                          2.0, // Border width when there's an error
                        ),
                      ),
                      // Error text style
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      if (!EmailValidator.validate(value.toString())) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _enteredEmail = value!;
                    },
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your Password',
                      prefixIcon:
                      Icon(Icons.password_outlined), // Prefix icon for email
                      // Custom border
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      // Focused border
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors
                              .green, // Border color when focused
                          width: 2.0, // Border width when focused
                        ),
                      ),
                      // Error border
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors
                              .red, // Border color when there's an error
                          width:
                          2.0, // Border width when there's an error
                        ),
                      ),
                      // Error text style
                      errorStyle: TextStyle(color: Colors.red),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    validator: (value) {
                      return validatePassword(value.toString());
                    },
                    onSaved: (value) {
                      // Passwordcontroller = value!;
                      _enteredPassword = value!;
                    },
                  ),
                ),
            Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ForgotPasswordScreen()))
                    },
                    child: Text(
                      "Forgot?",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA)),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  child: ElevatedButton(
                    onPressed: submit,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      primary: Colors.blue, // Set the background color
                      padding: EdgeInsets.symmetric(horizontal: 20.0), // Adjust padding as needed
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Set the text color
                      ),
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()))
                    },
                    child: Text(
                      "Don't Have an Account? Sign up",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA)
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
