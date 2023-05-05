import 'package:flutter/material.dart';
import '../../services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
        title: Text('Sign Up'),
        actions: [
          TextButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.person,color: Colors.black,),
              label: Text("Register", style: TextStyle(color: Colors.black),))
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
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error = "Please supply a valid email address";
                      });
                    }
                  }
                },
                child: Text("Register"),
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
    );;
  }
}
