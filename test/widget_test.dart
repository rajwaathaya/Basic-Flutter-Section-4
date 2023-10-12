// class homePage extends StatefulWidget {
//   const homePage({super.key});

//   @override
//   State<homePage> createState() => _homePageState();
// }

// class _homePageState extends State<homePage> {
//   List<String> dropMenu = ['Menu 1', 'Menu 2', 'Menu3'];
//   String _menuItem = 'Menu 1';

//   void _showDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Judul Dialog"),
//           content: Text("Isi dialog akan ditampilkan di sini."),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Tutup dialog
//               },
//               child: Text("Tutup"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Row(
//         children: [
//           Image.asset(
//             'assets/logo.png',
//             height: 45,
//           ),
//           SizedBox(width: 10),
//           Text("App Rajwa"),
//         ],
//       )),
//       body: Row(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 10.0, left: 25.0),
//             child: DropdownButton(
//                 value: _menuItem,
//                 items: dropMenu.map((String value) {
//                   return DropdownMenuItem(
//                     value: value,
//                     child: Text(
//                       value,
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   );
//                 }).toList(),
//                 onChanged: (String? value) {
//                   setState(() {
//                     _menuItem = value.toString();
//                   });
//                 }),
//           ),

//           ElevatedButton(
//             onPressed:
//                 _showDialog, 
//             child: Text("Tampilkan Dialog"),
//           ),
//         ],
//       ),
//     );
//   }
// }
