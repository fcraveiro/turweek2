import 'package:flutter/material.dart';

//import 'package:google_sign_in/google_sign_in.dart';
// import 'dart:async';

import 'package:turweek2/login_page.dart';

void main() => runApp(Aplicativo());

class Aplicativo extends StatefulWidget {
  @override
  _AplicativoState createState() => _AplicativoState();
}

class _AplicativoState extends State<Aplicativo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage()
    );
  }
}


/*



        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                  onPressed: () => LoginPage(),
                color: Colors.blue,
                child: Text('Login Email', style: TextStyle(color: Colors.white),),
              )


            ],

          ),
        ),





final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();

Future<String> _testSignInWithGoogle() async {
  final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  FirebaseUser user = await auth.signInWithGoogle(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  assert(user.email != null);
  assert(user.displayName != null);
  print('ok, $user');
  print('ok, $user.email');
  print('ok, $user.displayname');
  return 'signInWithGoogle succeeded: $user';
}

void _testa() {
  _testSignInWithGoogle();
}

void main() => runApp(Aplicativo());

class Aplicativo extends StatefulWidget {
  @override
  _AplicativoState createState() => _AplicativoState();
}

class _AplicativoState extends State<Aplicativo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('a'),
        ),
        body: GestureDetector(
          onTap: _testa,
          child: Container(
            margin: EdgeInsets.only(top: 20.0, left: 30.0),
            width: 85.0,
            height: 35.0,
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('GOOGLE', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




*/
