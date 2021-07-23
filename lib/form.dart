import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class DrawForm extends StatefulWidget {
  @override
  _DrawFormState createState() => _DrawFormState();
}

class _DrawFormState extends State<DrawForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      decoration: BoxDecoration(
        color: Color(0xFF1C211B),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "email@address.com",
                  hintStyle: TextStyle(color: Color(0xFF6B6B6B)),
                  labelText: "Your Email",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder:  UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder:  UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  TextField(
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "* * * * * * * *",
                      hintStyle: TextStyle(
                        color: Color(0xFF6B6B6B),
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Transform.translate(
                      offset: Offset(0,24),
                      child: Icon(
                        FontAwesomeIcons.questionCircle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.translate(
                    offset: Offset(0, 15),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(color: Color(0xFFF7C41C)),
                        )),
                  ),
                  Flexible(
                    child: Transform.translate(
                      offset: Offset(23, 23),
                      child: Container(
                        width: 150,
                        height: 50,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xFFF7C41C)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                            ),),
                          ),
                          onPressed: () {
                            showAlert();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Login".toUpperCase(),
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                FontAwesomeIcons.longArrowAltRight,
                                color: Colors.white,
                              )
                            ],
                          ),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showAlert(){
    return  showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>   AlertDialog(
          title: Column(
            children: [
              Text("Are You Sure You Want To Sign in ?",style: TextStyle(fontSize: 16),),
            ],
          ),
          actions: [
            TextButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You Successfully Login")));
              Navigator.pop(context);
            }, child: Text("Ok")),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Cancel")),
          ],
        )
    );
  }

}
