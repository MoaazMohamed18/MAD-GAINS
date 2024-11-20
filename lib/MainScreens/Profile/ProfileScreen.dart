import 'package:flutter/material.dart';
import 'package:madgains/Components/colors.dart';
import 'package:madgains/LoginScreen/login.dart';
import 'package:madgains/MainScreens/Profile/EditProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _name = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .get();
      if (snapshot.exists) {
        setState(() {
          _name = snapshot.data()?['name'] ?? '';
          _email = user.email ?? '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/weightlifter.png'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    '     $_name',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: blueColor),
                  onPressed: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (c) {
                        return EditProfile();
                      }),
                    );
                    _loadUserData();
                  },
                ),
              ],
            ),
            Text(
              _email,
              style: TextStyle(
                fontSize: 16,
                color: blackColor,
              ),
            ),
            SizedBox(height: 16),
            IconButton(
              icon: Icon(Icons.logout,
                color: blueColor,
                size: 30,),
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(builder: (c) {
                    return LoginPage();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
