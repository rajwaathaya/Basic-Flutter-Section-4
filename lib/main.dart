import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BottomNavBar(),
    debugShowCheckedModeBanner: false,
  ));
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar();

  @override
  State<BottomNavBar> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [loginPage(), homePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 211, 210, 210),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  bool visibilityPass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'assets/logo.png',
                        width: 250,
                        height: 120,
                      ))),
              Text(
                "Indosiar",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 325,
                color: Colors.white,
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

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<String> dropMenu = ['Menu 1', 'Menu 2', 'Menu3'];
  String _menuItem = 'Menu 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Image.asset(
            'assets/logo.png',
            height: 45,
          ),
          SizedBox(width: 10),
          Text("App Rajwa"),
        ],
      )),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: DropdownButton(
                value: _menuItem,
                items: dropMenu.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _menuItem = value.toString();
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Judul Dialog"),
                          content: Text("Isi dialog akan ditampilkan di sini."),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Tutup"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      child: Center(
                        child: Text(
                          'Show Dialog',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Judul Snackbar"),
                  action: SnackBarAction(
                    label: 'cancel',
                    onPressed: () {},
                  ),
                ),
              );
            },
            child: Container(
              height: 40,
              width: 150,
              child: Center(
                child: Text(
                  'Show Snackbar',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.add),
                            title: Text('Menu 1'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Menu 2'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.search),
                            title: Text('Menu 3'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              height: 40,
              width: 150,
              child: Center(
                child: Text(
                  'Show BottomSheet',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          Align(
            child: Container(
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}
