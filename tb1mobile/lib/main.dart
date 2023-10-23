import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


String userEmail = "irfan";
String userPassword = "h3h3";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _login() {
    if (email == userEmail && password == userPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage(email: email)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email atau kata sandi tidak valid'),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF113946),
        centerTitle: false,
        title: Text(
          'Login Page',
          style: TextStyle(
            color: Color(0xFFBCA37F),
          ),
        ),
      ),
      backgroundColor: Color(0xFF113946),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFBCA37F),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                hintText: "Masukkan email anda",
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color(0xFFBCA37F),
                    width: 2.0,
                  ),
                ),
                filled: true,
                fillColor: Colors.black,
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 5),
            TextField(
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                hintText: "Masukkan password anda",
                suffixIcon: IconButton(
                  icon: _isPasswordVisible
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: _togglePasswordVisibility,
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color(0xFFBCA37F),
                    width: 2.0,
                  ),
                ),
                filled: true,
                fillColor: Colors.black,
              ),
              style: TextStyle(
                color: Colors.white,
              ),
              obscureText: !_isPasswordVisible,
            ),
            ElevatedButton(
              onPressed: _login,
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Color(0xFF113946),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFBCA37F),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPage()),
                );
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPage extends StatefulWidget {
  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  String newPassword = '';
  String confirmPassword = '';
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _toggleNewPasswordVisibility() {
    setState(() {
      _isNewPasswordVisible = !_isNewPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  void _resetPassword() {
    if (newPassword == confirmPassword) {
      userPassword = newPassword;
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password tidak cocok!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF113946),
        centerTitle: true,
        title: Text(
          'Forgot Password',
          style: TextStyle(
            color: Color(0xFFBCA37F),
          ),
        ),
      ),
      backgroundColor: Color(0xFF113946),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                newPassword = value;
              },
              decoration: InputDecoration(
                hintText: "New Password",
                suffixIcon: IconButton(
                  icon: _isNewPasswordVisible
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: _toggleNewPasswordVisibility,
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color(0xFFBCA37F),
                    width: 2.0,
                  ),
                ),
                filled: true,
                fillColor: Colors.black,
              ),
              style: TextStyle(
                color: Colors.white,
              ),
              obscureText: !_isNewPasswordVisible,
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                confirmPassword = value;
              },
              decoration: InputDecoration(
                hintText: "Confirm Password",
                suffixIcon: IconButton(
                  icon: _isConfirmPasswordVisible
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: _toggleConfirmPasswordVisibility,
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color(0xFFBCA37F),
                    width: 2.0,
                  ),
                ),
                filled: true,
                fillColor: Colors.black,
              ),
              style: TextStyle(
                color: Colors.white,
              ),
              obscureText: !_isConfirmPasswordVisible,
            ),
            ElevatedButton(
              onPressed: _resetPassword,
              child: Text(
                'Reset Password',
                style: TextStyle(
                  color: Color(0xFF113946),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFBCA37F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  final String email;

  MainPage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF113946),
        centerTitle: true,
        title: Text(
          "Menu utama",
          style: TextStyle(
            color: Color(0xFFBCA37F),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFBCA37F),
                Color(0xFF113946),
              ],
              begin: Alignment.topRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("img/gr86.png"),
                radius: 180.0,
              ),
              Text(
                "Mochammad Irfan Kurniawan",
                style: GoogleFonts.tapestry(
                  textStyle: TextStyle(
                    fontSize: 25.0,
                    color: Color(0xFFBCA37F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "`Terwujud Tidak Terwujud,",
                style: GoogleFonts.moonDance(
                  textStyle: TextStyle(
                    fontSize: 30.0,
                    letterSpacing: 0.5,
                    color: Color(0xFFBCA37F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "Tetaplah Bersujud.`",
                style: GoogleFonts.moonDance(
                  textStyle: TextStyle(
                    fontSize: 34.0,
                    letterSpacing: 0.5,
                    color: Color(0xFFBCA37F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0
                ),
                color: Color(0xFFBCA37F),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                          right: 10.0,
                          left: 10.0
                      ),
                      child: Icon(
                        Icons.phone,
                        color: Color(0xFF113946),
                      ),
                    ),
                    Text(
                      ": 41822010028",
                      style: TextStyle(
                        color: Color(0xFF113946),
                        fontSize: 20.0,
                        fontFamily: "prism",
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 25.0),
                color: Color(0xFFBCA37F),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Icon(
                        Icons.email,
                        color: Color(0xFF113946),
                      ),
                    ),
                    Text(
                      ": irfan@gmail.com",
                      style: TextStyle(
                        color: Color(0xFF113946),
                        fontSize: 20.0,
                        fontFamily: "prism",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
