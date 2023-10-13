import 'package:flutter/material.dart';


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
        backgroundColor:const Color.fromARGB(255, 250, 125, 116),
          title: Row(
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 45,
          ),
          SizedBox(width: 10),
          Text("INDOSIAR",
          style: TextStyle(fontFamily: 'RedHatDisplay'),
          ),
        ],
      )),
      //dropdown
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
          //listview
          Align(
            alignment: Alignment.center,
            child: Card(
              child: Container(
                height: 100,
                width: double.infinity,
                child: Container(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                      return Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )
                          ]
                        ),
                        child: Center(
                          child: Text("Box ${index + 1}"),
                        ),
                      );
                    }),
                    ),
                ),
              ),
            ),
          ),
          //dialog
          SizedBox(height: 20),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 250, 125, 116))),
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
          //snackbar
          SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 250, 125, 116))),
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
          //bottom sheet
          SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 250, 125, 116))),
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
        ],  
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/header3.jpg'), fit: BoxFit.cover)
              ),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                        radius: 60.0,
                        backgroundColor: Colors.red,
                      ),
                 ), 
              ],
            ),
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person),
            trailing: IconButton(
              onPressed: (){},
               icon: Icon(Icons.arrow_right)
            ),
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
            trailing: IconButton(
              onPressed: (){},
               icon: Icon(Icons.arrow_right)
            ),
          ),
          ListTile(
            title: Text('Log Out'),
            leading: Icon(Icons.logout),
            trailing: IconButton(
              onPressed: (){},
               icon: Icon(Icons.arrow_right)
            ),
          ),
         ],
        ),
      ),
    );
  }
}