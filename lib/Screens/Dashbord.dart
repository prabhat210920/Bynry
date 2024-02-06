import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_singing/Screens/ProfilePage.dart';
import 'package:flutter_singing/widget/GasBill.dart';
import 'package:flutter_singing/widget/ItemDashBoard.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoard();
}

var _islogin = true;
final _firebase = FirebaseAuth.instance;
User? _curentUser = FirebaseAuth.instance.currentUser;

class _DashBoard extends State<DashBoard> {

  String Name = "";
  String Email = "";
  String Mobile = "";

  void fetchData() async {
    User? user = _firebase.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .get();
        if (documentSnapshot.exists) {
          Map<String, dynamic> userData = documentSnapshot.data() as Map<String, dynamic>;
          setState(() {
            Name = userData['Name']??"";
            Email = userData['Email']??"";
            Mobile = userData['Mobile']??"";
          });

          // Now you can use these variables as needed
          print('Name: $Name');
          print('Email: $Email');
          print('Mobile: $Mobile');
          // print('Password: $password');
        } else {
          print('Document does not exist');
        }
      } catch (e) {
        print('Error fetching data: $e');
      }
    } else {
      print('User is not signed in');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello ${Name}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  subtitle: Text('Welcome',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white54)),
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/user.jpg'),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      // Handle button click action here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            name: Name,
                            email: Email,
                            mobile: Mobile,
                          ),
                        ),
                      );
                      print('Profile icon clicked!');
                    },
                    icon: Icon(
                      Icons.person_pin,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                  )),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
                children: [
                  DashboardItem(
                    title: 'Bills',
                    iconData: CupertinoIcons.square_list,
                    backgroundColor: Colors.black38,
                  ),
                  DashboardItem(
                    title: 'Transfer',
                    iconData: CupertinoIcons.square_list,
                    backgroundColor: Colors.black38,
                  ),
                  DashboardItem(
                    title: 'Services',
                    iconData: CupertinoIcons.square_list,
                    backgroundColor: Colors.black38,
                  ),
                  DashboardItem(
                    title: 'Transfer',
                    iconData: CupertinoIcons.square_list,
                    backgroundColor: Colors.black38,
                  ),
                  DashboardItem(
                    title: 'Complain',
                    iconData: CupertinoIcons.square_list,
                    backgroundColor: Colors.black38,
                  ),
                  DashboardItem(
                    title: 'Update',
                    iconData: CupertinoIcons.square_list,
                    backgroundColor: Colors.black38,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          GasBillContainer(billName: 'Gas', amount: 100, dueDate: '10 Feb, 2024', status: 'Due',),
          SizedBox(height: 10,),
          GasBillContainer(billName: 'Electricity', amount: 100, dueDate: '10 Feb, 2024', status: 'Due',),
          SizedBox(height: 10,),
          GasBillContainer(billName: 'Water', amount: 100, dueDate: '10 Feb, 2024', status: 'Due',),
          SizedBox(height: 10,),
          GasBillContainer(billName: 'Recharge', amount: 100, dueDate: '10 Feb, 2024', status: 'Due',),
        ],
      ),
    );
  }
}
