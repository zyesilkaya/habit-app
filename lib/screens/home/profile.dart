import 'package:brew_crew/res/strings.dart';
import 'package:brew_crew/screens/home/edit_profile.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  String email = "";
  String name = "";
  String level= "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/3.png"),
                      radius: 75,
                      backgroundColor: Colors.grey.shade200,
                    ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: IconButton(
                            padding: new EdgeInsets.all(0.0),
                            onPressed: (){

                            },
                            icon: Icon(Icons.add_a_photo, color: Colors.black),),
                        ),
                      ),
                    )
                  ],
                )
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber,side: BorderSide.none,shape: const StadiumBorder()),
                      onPressed: () async{
                        final value = await Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile())).then((value) => setState(() {}));

                      },
                      child: Text("Edit Profile",
                        style: TextStyle(color: Colors.black87, fontSize: 18, ),
                      )
                  ),
                )

              ],
            ),
            Divider(
              height: 60,
              color: Colors.grey[800],
            ),
            Text(
              "NAME: ",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),),
            SizedBox(height: 10,),
            Text(
              tFullName,
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2,
                fontSize: 20,

              ),),
            SizedBox(height: 30,),
            Text(
              "LEVEL: ",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),),
            SizedBox(height: 10,),
            Text(
              tLevel,
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2,
                fontSize: 20,

              ),),
            SizedBox(height: 30,),
            Row(
              children: [
                Icon(Icons.email,color: Colors.grey,),
                SizedBox(width: 10,),
                Text(
                  tEmail,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),

          ],
        ),
      ),
    );
  }
}



