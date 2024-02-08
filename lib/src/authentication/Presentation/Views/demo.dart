// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tdd_clean/src/authentication/Presentation/cubit/auth_cubit.dart';
//
//
//
// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});
//
//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }
//
// class _AuthScreenState extends State<AuthScreen> {
//
//
//   void getUsers(){
//     context.read<AuthCubit>().getAllUsersHandler();
//   }
//
//   @override
//   void initState(){
//     super.initState();
//     getUsers();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return   BlocConsumer<AuthCubit, AuthState>(
//       listener: (context, state) {
//         if (state is AuthError){
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           body: state is GettingUser ?
//                 const Center(child: CircularProgressIndicator()) :
//                 const Center( child: Text("allUsers")),
//
//           floatingActionButton: FloatingActionButton.extended(onPressed: () async {
//             _showLoginDialog(context);
//           },
//               icon: const Icon(Icons.add),
//               label: const Text("Add User")
//           ),
//
//
//         );
//       },
//     );
//   }
// }
//
//
// void _showLoginDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Login'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Username'),
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               obscureText: true,
//               decoration: InputDecoration(labelText: 'Password'),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Close the dialog
//             },
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               // Perform login logic here
//               Navigator.of(context).pop(); // Close the dialog after successful login
//             },
//             child: Text('Login'),
//           ),
//         ],
//       );
//     },
//   );
// }
