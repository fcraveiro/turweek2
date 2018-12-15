import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      print('valido: Email: $_email, Password: $_password');
      return true;
    } else {
      print('invalido');
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          FirebaseUser user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password);
          print('Signed in ${user.uid}, ${user.isEmailVerified} ');
        } else {
          FirebaseUser user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: _email, password: _password);
          print('Criado in ${user.uid}');
        }
      } catch (e) {
        print('Erro: $_email, $_password, $e');
      }
    }
  }

  void moveToRegistro() {
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Login'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: new Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: new Form(
            key: formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildInputs() + buildSubmitButtons(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return [
      new TextFormField(
        decoration: new InputDecoration(
          labelText: 'Email',
        ),
        validator: (value) => value.isEmpty ? 'Email Invalido' : null,
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        decoration: new InputDecoration(
          labelText: 'Senha',
        ),
        validator: (value) => value.isEmpty ? 'Senha Invalida' : null,
        obscureText: false,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: new RaisedButton(
            elevation: 5,
            color: Colors.pink[400],
            onPressed: validateAndSubmit,
            child: Text(
              'Login',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 40, right: 40),
          child: new FlatButton(
            onPressed: moveToRegistro,
            color: Colors.orange,
            shape: StadiumBorder(),
            child: new Text(
              'Não tem Conta? Cadastre',
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
          ),
        ),
      ];
    } else {
      return [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: new RaisedButton(
            elevation: 5,
            color: Colors.orange,
            onPressed: validateAndSubmit,
            child: Text(
              'Cadastrar',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 40, right: 40),
          child: new FlatButton(
            onPressed: moveToLogin,
            color: Colors.pink[400],
            shape: StadiumBorder(),
            child: new Text(
              'Já Tem Conta? Login',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
      ];
    }
  }
}

