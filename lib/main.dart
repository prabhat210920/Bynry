import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_singing/Screens/Dashbord.dart';
import 'package:flutter_singing/Screens/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_singing/Screens/RegisterPage.dart';
import 'package:flutter_singing/Screens/home.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Signing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (ctx, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasData){
          return MyHomePage();
        }
        return LoginScreen();
      },),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:animate_do/animate_do.dart';
//
// void main() => runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     )
// );
//
//
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   height: 400,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage('assets/images/background.png'),
//                           fit: BoxFit.fill
//                       )
//                   ),
//                   child: Stack(
//                     children: <Widget>[
//                       Positioned(
//                         left: 30,
//                         width: 80,
//                         height: 200,
//                         child: FadeInUp(duration: Duration(seconds: 1), child: Container(
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage('assets/images/light-1.png')
//                               )
//                           ),
//                         )),
//                       ),
//                       Positioned(
//                         left: 140,
//                         width: 80,
//                         height: 150,
//                         child: FadeInUp(duration: Duration(milliseconds: 1200), child: Container(
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage('assets/images/light-2.png')
//                               )
//                           ),
//                         )),
//                       ),
//                       Positioned(
//                         right: 40,
//                         top: 40,
//                         width: 80,
//                         height: 150,
//                         child: FadeInUp(duration: Duration(milliseconds: 1300), child: Container(
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage('assets/images/clock.png')
//                               )
//                           ),
//                         )),
//                       ),
//                       Positioned(
//                         child: FadeInUp(duration: Duration(milliseconds: 1600), child: Container(
//                           margin: EdgeInsets.only(top: 50),
//                           child: Center(
//                             child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
//                           ),
//                         )),
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(30.0),
//                   child: Column(
//                     children: <Widget>[
//                       FadeInUp(duration: Duration(milliseconds: 1800), child: Container(
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Color.fromRGBO(143, 148, 251, 1)),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Color.fromRGBO(143, 148, 251, .2),
//                                   blurRadius: 20.0,
//                                   offset: Offset(0, 10)
//                               )
//                             ]
//                         ),
//                         child: Column(
//                           children: <Widget>[
//                             Container(
//                               padding: EdgeInsets.all(8.0),
//                               decoration: BoxDecoration(
//                                   border: Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1)))
//                               ),
//                               child: TextField(
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: "Email or Phone number",
//                                     hintStyle: TextStyle(color: Colors.grey[700])
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.all(8.0),
//                               child: TextField(
//                                 obscureText: true,
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: "Password",
//                                     hintStyle: TextStyle(color: Colors.grey[700])
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       )),
//                       SizedBox(height: 30,),
//                       FadeInUp(duration: Duration(milliseconds: 1900), child: Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             gradient: LinearGradient(
//                                 colors: [
//                                   Color.fromRGBO(143, 148, 251, 1),
//                                   Color.fromRGBO(143, 148, 251, .6),
//                                 ]
//                             )
//                         ),
//                         child: Center(
//                           child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
//                         ),
//                       )),
//                       SizedBox(height: 70,),
//                       FadeInUp(duration: Duration(milliseconds: 2000), child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         )
//     );
//   }
// }


