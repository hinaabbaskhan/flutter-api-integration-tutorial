import 'package:api_integration_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.orange,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Please Enter Email',
                  labelText: "Email Address",
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //Password
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
                right: 18,
              ),
              //TextField
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Please Enter Password',
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye_sharp),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:api_integration_flutter/services/networking.dart';
// import 'package:flutter/material.dart';
// import 'home_screen.dart';
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   login(String email, String password) async {
//     try {
//       String url = 'https://reqres.in/api/login';
//       NetworkHelper networkHelper = NetworkHelper(url);
//       var jsonData =
//       await networkHelper.postData({"email": email, "password": password});
//       if (jsonData["token"] != null) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const HomeScreen()),
//         );
//       } else {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Try again!')));
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('$e Try again! ')));
//     }
//
//     // http.Response? response = await http.post(
//     //   Uri.parse(url),
//     //   body: {"email": email, "password": password},
//     // );
//     // if (response.statusCode == 200) {
//     //   print('login successful');
//     //   Navigator.push(
//     //     context,
//     //     MaterialPageRoute(builder: (context) => const HomeScreen()),
//     //   );
//     // } else {
//     //   print('failed');
//     // }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 18,
//                 right: 18,
//               ),
//               child: TextFormField(
//                 autofocus: false,
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   hintText: 'Please Enter Email',
//                   labelText: "Email Address",
//                   prefixIcon: Icon(Icons.email),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black38),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             //Password
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 18,
//                 right: 18,
//               ),
//               //TextField
//               child: TextFormField(
//                 autofocus: false,
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   hintText: 'Please Enter Password',
//                   labelText: "Password",
//                   prefixIcon: Icon(Icons.lock),
//                   suffixIcon: Icon(Icons.remove_red_eye_sharp),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black38),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             InkWell(
//               onTap: () {
//                 login(emailController.text.trim(),
//                     passwordController.text.trim());
//               },
//               child: Container(
//                 height: 50,
//                 width: 300,
//                 decoration: BoxDecoration(
//                   color: Colors.orange,
//                   // border: Border.all(color: Colors.white, width: 3),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Login',
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
