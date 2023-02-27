// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class NuevoPasswordDialog extends StatefulWidget {

//   const NuevoPasswordDialog({super.key});

//   @override
//   State<NuevoPasswordDialog> createState() => _NuevoPasswordDialogState();
// }

// class _NuevoPasswordDialogState extends State<NuevoPasswordDialog> {
//   var _nombre = "";

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoAlertDialog(
//       title: const Text('Debe cambiar la contraseña\n'),
//       content: CupertinoTextField(

//         // style: TextStyle(color: Colors.white),
//         placeholder: 'Nueva contraseña',
//         onChanged: (value) => {
//           setState(() {
//             _nombre = value;
//           }),
//         }
//       ),
//       actions: [
//         CupertinoDialogAction(
//           child: const Text('Cancelar'),
//           onPressed: () => Navigator.pop(context),
//         ),
//         CupertinoDialogAction(
//           child: const Text('Cambiar'),
//           onPressed: _nombre != "" ? () {
//             Navigator.of(context).pop();
//             showCupertinoDialog(
//               context: context,
//               builder: (context) => CupertinoAlertDialog(
//                 title: Text('Su nueva contraseña se cambiara a\n $_nombre'),
                
//                 actions: [
//                   CupertinoDialogAction(
//                     child: Text('Cancelar', style: TextStyle(color: Colors.red),),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                   Consumer<provider>(
//                     builder: (context, provider, child) => CupertinoDialogAction(
//                       child: Text('Aceptar'),
//                       onPressed: () {
//                         provider.awsServices.NewPasswordRequired(_nombre);
//                         // Navigator.of(context).pop();
//                         // Navigator.of(context).popAndPushNamed('piscinaPage');
//                         Navigator.pushReplacementNamed(context, 'piscinaPage');
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }:null,
//         ),
//       ],
//     );
//   }
// }