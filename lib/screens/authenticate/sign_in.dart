import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String password="";
  String email = "";
  String error = "";
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text('Sign In'),
        actions: [
          TextButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.person,color: Colors.black,),
              label: Text("Sign in", style: TextStyle(color: Colors.black),))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextFormField(
                validator: (val) => val!.isEmpty ? "Enter an email": null,
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                validator: (val) => val!.length < 6 ? "Enter the password +6 chars long": null,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                },
                obscureText: true,
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async{
                  if(_formKey.currentState!.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error = "These credentials does not exist";
                      });
                    }
                  }
                },
                child: Text("Sign In"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[400]),
              ),
              SizedBox(height: 20),
              Text(error, style: TextStyle(
                  color: Colors.red,fontSize: 14
              ))
            ],
          ),
        ),
      ),
    );
  }
}
