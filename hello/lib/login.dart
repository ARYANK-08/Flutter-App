import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello/myHomePage.dart';
import 'auth.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aryan's App"),
        backgroundColor: Theme.of(context).primaryColor,
        ),
      body: const Body()
      );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late User user;

  @override
  void initState() {
    super.initState();
    signOutGoogle();
  }

  void click(){
    signInWithGoogle().then((user) => {
      this.user = user!,
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(user)))
    });
    
  }

  Widget googleLoginButton() {
    return OutlinedButton(
        onPressed: click,
        child: const Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('assets/google_logo.png'), height: 35),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Sign in with Google',
                        style: TextStyle(color: Colors.grey, fontSize: 25)))
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, child: googleLoginButton());
  }
}