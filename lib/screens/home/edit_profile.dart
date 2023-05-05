import 'package:brew_crew/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {

  String name=tFullName;
  String email=tEmail;
  String level=tLevel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.keyboard_arrow_left)),
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage("assets/1.png")),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                      child: Icon(Icons.add_a_photo),
                    )
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Form(
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (String name){
                          this.name = name==null ? tFullName : name;
                        },
                        decoration: InputDecoration(label: Text("Full name"), prefixIcon: Icon(CupertinoIcons.person)),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        onChanged: (String name){
                          this.email = name==null ? tEmail : name;
                        },
                        decoration: InputDecoration(label: Text("E mail"), prefixIcon: Icon(CupertinoIcons.mail)),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        onChanged: (String name){
                          this.level = name==null ? tLevel : name;
                        },
                        decoration: InputDecoration(label: Text("Level"), prefixIcon: Icon(CupertinoIcons.arrow_up_circle)),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(label: Text("Password"), prefixIcon: Icon(CupertinoIcons.padlock_solid)),
                      ),
                      SizedBox(height: 20,),
                      SizedBox(
                        width: double.infinity,

                        child: ElevatedButton(
                          onPressed: (){
                            tFullName = name==null ? tFullName:name;
                            tEmail = email==null ? tEmail:email;
                            tLevel = level == null ? tLevel:level;
                            Navigator.pop(context);
                          },
                          child: Text("Edit Profile", style: TextStyle(fontSize: 16,color: Colors.black87),),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber,side: BorderSide.none,shape: const StadiumBorder()),
                        ),
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
