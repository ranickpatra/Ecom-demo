import 'package:ecom_app/http_service.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
                  decoration: InputDecoration(labelText: "User Name"),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return "User Name required";
                    }
                  }),
              TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return "Password required";
                    }
                  }),
              SizedBox(height: 50.0,),
              Container(
                height: 50.0,
                child: Material(
                  borderRadius: BorderRadius.circular(25.0),
                  shadowColor: Colors.greenAccent,
                  elevation: 7.0,
                  color: Colors.green,
                  child: GestureDetector(
                    onTap: () {
                      HttpService().login("r@g.com", '1234').then((value) {
                        if(value.status) {
                          Navigator.pushNamed(context, '/home');
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 25
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
