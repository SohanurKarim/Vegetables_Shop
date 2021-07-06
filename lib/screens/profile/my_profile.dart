import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodtest0/config/color.dart';
import 'package:foodtest0/screens/home_screen/drawer_side.dart';

class Myprofile extends StatelessWidget {
  //const Myprofile({Key? key}) : super(key: key);

  Widget listTile({required IconData icon, required String title}){
    return Column(
      children: [
        Divider(height: 2,),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 18,
            color: textColor,
          ),
        ),
      ),
      drawer: DrwerSide(),
      body: ListView(
        children: [
           Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    color: primaryColor,
                  ),
                  Container(
                    height: 548,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical:10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 250,
                              height: 80,
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 2,),
                                      Text(
                                        "Md. Sohanru Karim",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Text("sohanur.vu5.cse5@gmail.com"),
                                    ],
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: primaryColor,
                                    child: CircleAvatar(
                                      radius: 12,
                                      child: Icon(
                                        Icons.edit,
                                        color: textColor,
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        listTile(
                            icon: Icons.shop_outlined,
                            title: "My Orders"
                        ),
                        listTile(
                            icon: Icons.location_on_outlined,
                            title: "My Delivery Address"
                        ),
                        listTile(
                            icon: Icons.person_outlined,
                            title: "Refer a Friend"
                        ),
                        listTile(
                            icon: Icons.file_copy_outlined,
                            title: "Terms & Conditions"
                        ),
                        listTile(
                            icon: Icons.policy_outlined,
                            title: "Privacy & Policy",
                        ),
                        listTile(
                            icon: Icons.add_chart,
                            title: "About"
                        ),
                        listTile(
                            icon: Icons.exit_to_app_outlined,
                            title: "Log Out"
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 30),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: primaryColor,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('https://cdn.dribbble.com/users/1141243/screenshots/5837877/panda.png?compress=1&resize=400x300'),
                    radius: 45,
                    backgroundColor: scaffoldBackgroundColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
