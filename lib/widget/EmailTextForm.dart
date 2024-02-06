// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class EmailTextForm extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: 'Email',
//         hintText: 'Enter your email',
//         prefixIcon:
//         Icon(Icons.email), // Prefix icon for email
//         // Custom border
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide(
//             color: Colors.blue, // Border color
//             width: 2.0, // Border width
//           ),
//         ),
//         // Focused border
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide(
//             color: Colors
//                 .green, // Border color when focused
//             width: 2.0, // Border width when focused
//           ),
//         ),
//         // Error border
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide(
//             color: Colors
//                 .red, // Border color when there's an error
//             width:
//             2.0, // Border width when there's an error
//           ),
//         ),
//         // Error text style
//         errorStyle: TextStyle(color: Colors.red),
//       ),
//       keyboardType: TextInputType.emailAddress,
//       autocorrect: false,
//       textCapitalization: TextCapitalization.none,
//       validator: (value) {
//         if (!EmailValidator.validate(value.toString())) {
//           return 'Please enter a valid email address';
//         }
//         return null;
//       },
//       onSaved: (value) {
//         _enteredEmail = value!;
//       },
//     );
//   }
// }