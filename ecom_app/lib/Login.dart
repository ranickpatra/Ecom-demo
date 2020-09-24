import 'package:ecom_app/Home.dart';
import 'package:ecom_app/http_service.dart';
import 'package:ecom_app/loginStatus.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatelessWidget {
  String _email="", _pass="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            // Here we create one to set status bar color
            backgroundColor: Colors.orange[
                400], // Set any color of status bar you want; or it defaults to your theme's primary color
          )),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.account_circle,
                color: Colors.green[500],
                size: 200.0,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "User email"),
                onChanged: (text) => _email = text.trim(),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                onChanged: (text) => _pass = text.trim(),
              ),
              SizedBox(
                height: 50.0,
              ),
              GestureDetector(
                onTap: () {

                  if(!EmailValidator.validate(_email)) {
                    show_toast("Invalid email");
                    return;
                  }
                  if(_pass.isEmpty) {
                    show_toast("Password required");
                    return;
                  }
                  HttpService().login(_email, _pass).then((value) {
                    value = value as LoginStatus;
                    if(value.status) {
                      // Navigator.pushNamed(context, '/home');
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Home(value.id),
                      ));
                    } else {
                      show_toast("Invalid login detailse");
                    }
                  });
                },
                child: Container(
                  height: 70.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    shadowColor: Colors.greenAccent,
                    elevation: 7.0,
                    color: Colors.green,
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void show_toast(String txt) {
    Fluttertoast.showToast(
        msg: txt,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orange[300],
        textColor: Colors.white,
        fontSize: 16.6);
  }
}
