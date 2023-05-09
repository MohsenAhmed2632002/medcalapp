// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:medcalapp/Viewdata.dart';

class inputpage extends StatefulWidget {
  final String nameperson;
  inputpage({
    Key? key,
    required this.nameperson,
  }) : super(key: key);
  @override
  State<inputpage> createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {
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
                        topLeft: Radius.circular(100),
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
                            "HI ${widget.nameperson}\nPut the Name you Want to Search to Help You",
                            style: TextStyle(
                              fontSize: 18,
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
                              hintText: "Enter Your medicine",
                              label: Text("Enter Your medicine"),
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Viewdata(namemedicine: controller1.text,nameperson:widget.nameperson),
                                      ),
                                    );
                                  } else {}
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Search",
                                      style: TextStyle(
                                        color: Color.fromRGBO(89, 177, 183, 1),
                                      ),
                                    ),
                                    Icon(
                                      Icons.search_sharp,
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
