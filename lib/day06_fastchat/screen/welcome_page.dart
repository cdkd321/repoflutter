import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
import 'register_page.dart';

// welcome page, include login and register navigate button
class WelcomePage extends StatefulWidget {
  static var path = 'chat_welcome_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('welcome to fast chat'),),
      body: SafeArea(
        child: Column(children: [
          Icon(Icons.flash_on, color: Colors.orange,),
          ElevatedButton(onPressed: (){}, child: Text('login')),
          ElevatedButton(onPressed: (){}, child: Text('register')),
        ],),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return WelcomePageState();
  }
}

class WelcomePageState extends State<WelcomePage> {

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    Future.microtask(() async {
      await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyCfh_Pp1IqMh6MmVYXZC2CoNwZBXCyvnYk",
      appId: "1:769050683272:android:dc9ceba912ca968b9b3c3d", messagingSenderId: '769050683272',
      projectId: "fastchat-90513",));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Hero(tag:'chat_log_tag', child: Icon(Icons.flash_on, size: 50, color: Colors.orange,)),
                  height: 60.0,
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //Go to login screen.
                    Navigator.of(context).pushNamed(LoginPage.path);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                    Navigator.of(context).pushNamed(RegistrationPage.path);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}