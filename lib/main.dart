import 'package:flutter/material.dart';
import 'package:eticket/services/services.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                  child: Text("Sign Up"),
                  onPressed: () async {
                    SignInSingUpResult result = await AuthServices.signUp(
                        "ahmad.irza18@gmai.com",
                        "ayo123",
                        "Irza",
                        ["Action", "Horror", "Romance"],
                        "Indonesia");

                    if (result.user == null) {
                      print(result.message);
                    } else {
                      print(result.user.toString());
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
