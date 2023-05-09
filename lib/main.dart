import 'package:flutter/material.dart';
import 'package:medcalapp/Second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => loginpage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromRGBO(255, 255, 255, 1),
          child: Center(
            child: Image.asset("image/logo.JPG"),
          ),
        ),
      ),
    );
  }
}

class loginpage extends StatefulWidget {
  loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController controller1 = TextEditingController();

  final key1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: key1,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(255, 255, 255, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Image.asset("image/logo.JPG"),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(89, 177, 183, 1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "MdicalBulletin",
                            style: TextStyle(
                              fontSize: 40,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                          Text(
                            "Enter your Name",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                          TextFormField(
                            style: TextStyle(
                              color: Color.fromARGB(
                                255,
                                255,
                                255,
                                255,
                              ),
                            ),
                            controller: controller1,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "empty is not right";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.list,
                                color: Color.fromRGBO(89, 177, 183, 1),
                              ),
                              hintText: "Enter Your Name",
                              label: Text("Enter Your Name"),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                onPressed: () {
                                  if (key1.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => inputpage(
                                            nameperson: controller1.text),
                                      ),
                                    );
                                  } else {}
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Enter",
                                      style: TextStyle(
                                        color: Color.fromRGBO(89, 177, 183, 1),
                                      ),
                                    ),
                                    Icon(
                                      Icons.edit_note_sharp,
                                      color: Color.fromRGBO(89, 177, 183, 1),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
