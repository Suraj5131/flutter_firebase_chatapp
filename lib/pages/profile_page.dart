import 'package:chatapp_firebase/pages/auth/login_page.dart';
import 'package:chatapp_firebase/pages/home_page.dart';
import 'package:chatapp_firebase/service/auth_service.dart';
import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  String userName;
  String email;
  ProfilePage({Key? key, required this.email, required this.userName})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
          child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50),
        children: <Widget>[
          Icon(
            Icons.account_circle,
            size: 150,
            color: Colors.grey[700],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.userName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            height: 2,
          ),
          ListTile(
            onTap: () {
              nextScreen(context, const HomePage());
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.group),
            title: const Text(
              "Squads",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {},
            selected: true,
            selectedColor: Theme.of(context).primaryColor,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.person),
            title: const Text(
              "Profile",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () async {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: const Text("Logout"),
                      content: const Text("Are you sure you want to logout?"),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel")),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red),
                                onPressed: () {
                                  authService.signOut();
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()),
                                      (route) => false);
                                },
                                child: Text("LogOut"))
                          ],
                        ),
                      ],
                    );
                  });
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      )),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height * .5,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 200,
                  color: Colors.grey[700],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      child: const Text("Full Name",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                    ),
                    Text(": ",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    Expanded(
                        child: Text(widget.userName,
                            style: const TextStyle(fontSize: 17))),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                const Divider(
                  height: 20,
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      child: const Text("Email",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                    ),
                    Text(": ",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    Expanded(
                        child: Text(widget.email,
                            style: const TextStyle(fontSize: 17))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
