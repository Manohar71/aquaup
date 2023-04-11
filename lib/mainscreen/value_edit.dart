// import 'package:aqua_up/mainscreen/homepage.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class edit extends StatefulWidget {
//   const edit({super.key});

//   @override
//   State<edit> createState() => _editState();
// }

// class _editState extends State<edit> {
//   List<int> list_item = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
//   List<int> list_ml = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];
//   dynamic selected = 4;
//   dynamic ml_select = 100;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             icon: const Icon(Icons.close)),
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: DropdownButton(
//                 hint: Text('Select liters'),
//                 value: selected,
//                 items: item
//                     .map((ite) => DropdownMenuItem<int>(
//                         value: ite, child: Text(ite.toString())))
//                     .toList(),
//                 onChanged: (ite) {
//                   setState(() {
//                     selected = ite;
//                   });
//                 }),
//           ),
//           Center(
//             child: DropdownButton(
//                 hint: Text('Select ml'),
//                 value: ml_select,
//                 items: ml
//                     .map((ite) => DropdownMenuItem<int>(
//                         value: ite, child: Text(ite.toString())))
//                     .toList(),
//                 onChanged: (ite) {
//                   setState(() {
//                     ml_select = ite;
//                   });
//                 }),
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 setState(() {
//                   print(selected);
//                   print(ml_select);
//                   homepage.liters.value = selected;
//                   homepage.ml.value = ml_select;
//                 });
//                 await setlit.set_val_lit(selected);
//               },
//               child: Text('set the value'))
//         ],
//       ),
//     );
//   }
// }

// class useml {
//   static late SharedPreferences _prefer;

//   static const _keyml = 'ml';

//   static Future init() async => _prefer = await SharedPreferences.getInstance();

//   static Future setml(int ml) async => await _prefer.setInt(_keyml, ml);
//   static int? getvalue() => _prefer.getInt(_keyml);
// }

// class userpreferences {
//   static late SharedPreferences _preferences;

//   static const _keyvalue = 'value';

//   static Future init() async =>
//       _preferences = await SharedPreferences.getInstance();

//   static Future setvalue(double value) async =>
//       await _preferences.setDouble(_keyvalue, value);

//   static double? getvalue() => _preferences.getDouble(_keyvalue);
// }
