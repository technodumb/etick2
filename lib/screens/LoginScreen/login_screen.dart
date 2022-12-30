import 'package:etick2/components/components.dart';
import 'package:etick2/database/user_database.dart';
import 'package:flutter/material.dart';
import 'package:etick2/provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final firebaseProvider = Provider.of<FirebaseProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);
    List<User> userList = firebaseProvider.userList;
    List<String> usernameList =
        firebaseProvider.userList.map((e) => e.username).toList();
    List<String> passwordList =
        firebaseProvider.userList.map((e) => e.password).toList();

    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Consumer(
      builder: (context, LoginProvider loginProvider, child) => Scaffold(
        body: SizedBox(
          width: width,
          height: height,
          // alignment: Alignment.center,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderNoLogin(),
              Container(
                margin: EdgeInsets.all(50),
                height: height * 0.6,
                width: height * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Colors.grey[200],
                              filled: true,
                              hintText: 'Username',
                            ),
                            controller: usernameController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Colors.grey[200],
                              filled: true,
                              hintText: 'Password',
                            ),
                            controller: passwordController,
                          ),
                        ),
                        Text('',
                            style: TextStyle(fontSize: 10, color: Colors.red)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {
                                if (usernameList
                                        .contains(usernameController.text) &&
                                    passwordList[usernameList.indexOf(
                                            usernameController.text)] ==
                                        passwordController.text) {
                                  User user = userList[usernameList
                                      .indexOf(usernameController.text)];
                                  loginProvider.login(user);
                                  Navigator.pushNamed(context, '/home');
                                } else {
                                  print(
                                      "${usernameController.text} and ${passwordController.text}");
                                  print(
                                      "Username: ${firebaseProvider.userList}, password: $passwordList");
                                  print('Wrong username or password');
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.green,
                                fixedSize: Size(100, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (!usernameList
                                        .contains(usernameController.text) &&
                                    usernameController.text != '' &&
                                    passwordController.text != '') {
                                  User user = User(
                                    username: usernameController.text,
                                    password: passwordController.text,
                                    bookingIDs: [],
                                  );
                                  firebaseProvider.addUser(user);
                                  loginProvider.register(user);
                                  Navigator.pushNamed(context, '/home');
                                } else {
                                  print('Username already exists');
                                }
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                fixedSize: Size(100, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    // var movieSelect = MovieConversion();
                    // var firebaseFunction = FirebaseFunctions();
                    firebaseProvider.firebaseFunctions.clearAllSeats();
                    print('cleared');
                    //   movieData.values.forEach((value) {
                    //   });
                  },
                  child: Text("upload")),
            ],
          ),
        ),
      ),
    );
  }
}
