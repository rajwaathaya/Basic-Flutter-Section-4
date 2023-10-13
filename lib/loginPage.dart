import 'package:flutter/material.dart';
import 'package:flutter_apk/homePage.dart';


class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

//LOGIN PAGE
class _loginPageState extends State<loginPage> {
  bool visibilityPass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 219, 219),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 250,
                        height: 120,
                      ))),
              Text(
                "INDOSIAR",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'RedHatDisplay',
                  color: Color.fromARGB(255, 250, 125, 116),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 325,
                color: const Color.fromARGB(255, 255, 219, 219),
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ),
                          labelText: 'Username',
                          hintText: 'Input Username',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        obscureText: !visibilityPass,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ),
                          labelText: 'Password',
                          hintText: 'Input Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visibilityPass = !visibilityPass;
                              });
                            },
                            icon: visibilityPass
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Lupa Password?",
                              style: TextStyle(
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 250, 125, 116))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => homePage(),
                              ));
                        },
                        child: Container(
                          height: 40,
                          width: 500,
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Belum Punya Akun? Buat Akun!",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Atau Masuk Dengan Akun Google",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ]),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}