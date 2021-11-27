
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_of_art/model/user.dart';
import 'package:world_of_art/provider/user.dart';
import 'landinPage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _passwordController = new TextEditingController();

  UserModel _user = new UserModel();
  bool isSignedIn = false, showPassword = true, showConfirmPassword = true;
  final TextEditingController _emailController = new TextEditingController();
  String  _email = "", _password = "",_confirmpassword;
  AuthBase authBase = AuthBase();
  @override

  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(    appBar: AppBar(
      title: Text("Login"),

      leading:IconButton(icon: Icon(Icons.keyboard_return) ,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return LandinPage();
              },
            ));
          }
      ),
    ),
      body: Form(
          key: _formkey,
          child: SingleChildScrollView(child:  Column(
    children: <Widget>[
    SizedBox(
    height: 60,
    ),
    // User Name Field
    Container(
    margin: EdgeInsets.symmetric(horizontal: 40),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(40),
    ),
    child: TextFormField(
      controller:  _emailController,
    keyboardType: TextInputType.emailAddress,
    onChanged: (value)=>_email=value,
    validator: ( value) =>value.isEmpty ? "Enter a valid email" : null
    ,
    onSaved: (String value) {
    _user.email = value;
    },
    cursorColor: Color.fromRGBO(255, 63, 111, 1),
    decoration: InputDecoration(
    border: InputBorder.none,
    hintText: 'User name',
    hintStyle: TextStyle(
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(255, 63, 111, 1),
    ),
    icon: Icon(
    Icons.account_circle,
    color: Color.fromRGBO(255, 63, 111, 1),
    ),
    ),
    ),
    ),
    SizedBox(
    height: 20,
    ),Container(
    margin: EdgeInsets.symmetric(horizontal: 40),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(40),
    ),
    child: TextFormField(
      onChanged: (value)=>_password=value,
    obscureText: showPassword,
    validator: (String value)=>value.length < 8 ?'your password be large than 8 character':null,
    onSaved: (String value) {
    _user.password = value;
    },
    keyboardType: TextInputType.visiblePassword,
    cursorColor: Color.fromRGBO(255, 63, 111, 1),
    decoration: InputDecoration(
    suffixIcon: IconButton(
    icon: Icon(
    (showPassword) ? Icons.visibility_off : Icons.visibility,
    color: Color.fromRGBO(255, 63, 111, 1),
    ),
    onPressed: () {
    setState(() {
    showPassword = !showPassword;
    });
    }
    ),
    border: InputBorder.none,
    hintText: 'Password',
    hintStyle: TextStyle(
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(255, 63, 111, 1),
    ),
    icon: Icon(
    Icons.lock,
    color: Color.fromRGBO(255, 63, 111, 1),
    ),
    ),
    ),
    ), SizedBox(
    height: 20,
    ),
    // Confirm Password Field
    Container(
    margin: EdgeInsets.symmetric(horizontal: 40),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(40),
    ),
    child: TextFormField(
      onChanged: (value)=>_confirmpassword=value,
    validator: (String value) {
      return null ;
    },
    obscureText: showConfirmPassword,
    keyboardType: TextInputType.visiblePassword,
    controller: _passwordController,
    cursorColor: Color.fromRGBO(255, 63, 111, 1),
    decoration: InputDecoration(
    suffixIcon: IconButton(
    icon: Icon(
    (showConfirmPassword) ? Icons.visibility_off : Icons.visibility,
    color: Color.fromRGBO(255, 63, 111, 1),
    ),
    onPressed: () {
    setState(() {
    showConfirmPassword = !showConfirmPassword;
    });
    }
    ),
    border: InputBorder.none,
    hintText: 'Confirm Password',
    hintStyle: TextStyle(
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(255, 63, 111, 1),
    ),
    icon: Icon(
    Icons.lock,
    color: Color.fromRGBO(255, 63, 111, 1),
    ),
    ),
    ),
    ), SizedBox(
    height: 50,
    ),
    // Sign Up Button
    Container(height: 60,
    width: 300,
    child: ElevatedButton(
    child: Text("Singn Up",style: TextStyle(color: Colors.red),),

    onPressed: () async{if(_formkey.currentState.validate()){
      print(_email);
      print(_password);
      print(_confirmpassword);

    }
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('email', _emailController.text);

    // Navigator.push(context, MaterialPageRoute(
    //   builder: (BuildContext context) {
    //     return HomePage();
    //
    //   },
    // ));

    await  authBase.registerWithEmailAndPassword(_email, _password);

    Navigator.of(context).pushReplacementNamed('homepage');
    },
    style: ElevatedButton.styleFrom(primary:Color(0xFFFAFAFA),onSurface: Color(0xFF039BE5)),

    ),

    ),

    ]
    ),
        )

      )
    );
  }
}

