import 'package:flutter/material.dart';
import 'package:personalized_todo_list/screens/category_management.dart';
import 'package:personalized_todo_list/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
//Controller password & email
class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  late TextEditingController _passwordController;
  late TextEditingController _emailController;
  final _emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(

            decoration: BoxDecoration(
              image: DecorationImage(
               //background img
               
                image: AssetImage("/Users/madhu/Desktop/Mexxar_personalized_todo_list/lib/assets/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Mexxar ToDo",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 200.0,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'EMAIL',
                      hintText: 'Enter your Email (type - ashen@gmail.com)',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      hintText: 'Enter your Password (type - 123)',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.grey),
                      
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(1000, 60)),
                    ),
                    onPressed: () {
                      String enteredUsername = _emailController.text.trim();
                      String enteredPassword = _passwordController.text;

                      if (!_emailRegex.hasMatch(enteredUsername)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Enter a valid email address'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        return;
                      }

                      String correctUsername = "ashen@gmail.com";
                      String correctPassword = "123";

                      if (enteredUsername == correctUsername &&
                          enteredPassword == correctPassword) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Incorrect username or password'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    child: Text('Login'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
