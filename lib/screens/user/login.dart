
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_of_art/provider/adminMode.dart';
import 'package:world_of_art/provider/google_signin.dart';
import 'package:world_of_art/provider/modelHud.dart';
import 'package:world_of_art/provider/user.dart';
import 'package:world_of_art/screens/admin/adminHome.dart';
import 'package:world_of_art/screens/user/Homepage.dart';
import 'package:world_of_art/screens/user/landinPage.dart';

import '../../constants.dart';


class LoginPage extends StatefulWidget {
  @override
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final adminPassword = 'Admin1234';
 // String email , password;
  String _email = "";
   String   _password = "";
  AuthBase authBase = AuthBase();
  GoogleSignInProvider googleSignInProvider = GoogleSignInProvider();

  //User _user = new User();
  bool isSignedIn = false,
      showPassword = true;
  bool keepMeLoggedIn = false;
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _displayName = new TextEditingController();


  @override



  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
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
          child: SingleChildScrollView(child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text("Login to get started",style: TextStyle(fontSize: 40),),
              ),SizedBox(
                height: 50,
              ),
              // Email Text Field
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
                  validator: (String value) {
                    return null;
                  },
                  onChanged: (value)=>_email=value,
                  onSaved: (String value) {
                  //  _user.email = value;
                  },
                  cursorColor:Color.fromRGBO(33, 23, 12, 1.0),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(33, 23, 12, 1.0),
                    ),
                    icon: Icon(
                      Icons.email,
                      color:Color.fromRGBO(33, 23, 12, 1.0),
                    ),
                  ),
                ),
              ), //EMAIL TEXT FIELD
              SizedBox(
                height: 20,
              ),
              // Password Text Field
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextFormField(
                  controller:  _passwordController,
                  obscureText: showPassword,
                  validator: (String value) {
                    return null;

                  },
                  onChanged: (value)=>_password=value,
                  onSaved: (String value) {
                 //   _user.password = value;
                   // password = value;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Color.fromRGBO(33, 23, 12, 1.0),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(
                          (showPassword) ? Icons.visibility_off : Icons.visibility,
                          color: Color.fromRGBO(33, 23, 12, 1.0),
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
                      color: Color.fromRGBO(33, 23, 12, 1.0),
                    ),
                    icon: Icon(
                      Icons.lock,
                      color: Color.fromRGBO(33, 23, 12, 1.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(height: 60,
                width: 300,
                child: ElevatedButton(
                  child: Text("Login",style: TextStyle(color: Colors.red),),

                  onPressed: () async{
                    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                    sharedPreferences.setString('email', _emailController.text);


                        await authBase.loginWithEmailAndPassword(
                            _email, _password);
                        Navigator.of(context).pushReplacementNamed('homepage');




                 //   await  authBase.loginWithEmailAndPassword(_email, _password);
                 //   Navigator.of(context).pushReplacementNamed('homepage');
                  },
                  style: ElevatedButton.styleFrom(primary:Color(0xFFFAFAFA),onSurface: Color(0xFF039BE5)),

                ),

              ),
              SizedBox(
                height: 40,
              ),Container(
                  child: Row(
                      children:<Widget> [
                        Text("or login witth"),
                        Container( child: ElevatedButton(
                          child: Text("F",style: TextStyle(color: Colors.blue),),

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                                return LoginPage();
                              },
                            ));

                          },
                          style: ElevatedButton.styleFrom(primary:Color(0xFFFAFAFA),onSurface: Color(0xFF039BE5),shape: CircleBorder()),

                        ),),
                        Container(
                            child:  Column(
                                children: [
                                GestureDetector(
                                onTap: () {
                            //Sign In with google
                            AuthBase()
                            .signWithGoogle()
                            .then((UserCredential value) async{
                          final displayName = value.user.displayName;

                          print(displayName);

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                                  (route) => false);
                          final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                          sharedPreferences.setString('email',_displayName.text);});
            },
                child:
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    children: [
                      Container(
                        child: ElevatedButton(
                          child: Text('admin',style:TextStyle(color: Provider.of<AdminMode>(context).isAdmin
                              ? Color(0xFFFFC12F)
                      : Colors.white,
                  )
                          ),
                          onPressed: () async {
                            if(_password == adminPassword){
    try{await authBase.registerWithEmailAndPassword(_email.trim(), _password.trim());
    Navigator.pushNamed(context, AdminHome.id);
    }catch(e){
    print('error');
    }
    }

                           else{final modelhud = Provider.of<ModelHud>(context, listen: false);
                              modelhud.changeisLoading(false);
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("ERROR"),

    )
    );
                           };

    //                         final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //                         sharedPreferences.setString('email', _passwordController.text);
    //                         final modelhud = Provider.of<ModelHud>(context, listen: false);
    //                         modelhud.changeisLoading(true);
    // if (Provider.of<AdminMode>(context, listen: false).isAdmin) {
    //   if (_password == adminPassword) {
    //     try {
    //       await authBase.registerWithEmailAndPassword(
    //           email.trim(), password.trim());
    //       Navigator.pushNamed(context, AdminHome.id);
    //     } catch (e) {
    //       modelhud.changeisLoading(false);
    //       Scaffold.of(context).showSnackBar(SnackBar(
    //         content: Text(e.message),
    //       ));print(password);
    //     }
    //   }
    // }

                            // Provider.of<AdminMode>(context, listen: false).changeIsAdmin(true);
                          //  Provider.of<AdminMode>(context).isAdmin? password = "Admin123"
                           // Navigator.pushNamed(context, AdminHome.id);

                            // Navigator.push(context, MaterialPageRoute(
                            //   builder: (BuildContext context) {
                            //     return LoginPage();
                            //   },
                            // ));

                          },   ),
                      )
                    ],
                  ) ,

                 //   Text('admin',style: TextStyle(color:Color(0xFFFFC12F),))
                )
               // child:

                // ElevatedButton(
                //
                //
                //   child: Text("G",style: TextStyle(color: Colors.red),),
                //   style: ElevatedButton.styleFrom(primary:Color(0xFFFAFAFA),onSurface: Color(0xFF039BE5),shape: CircleBorder()),
                //
                //
                //
                // ),


                                ),
            ]
          ),
        ),

    //                            child: Text('admin',style: TextStyle(
    // color: Provider.of<AdminMode>(context).isAdmin
    // ? Color(0xFFFFC12F)
    //     : Colors.white,


                        // Container(
                        //   child:  Padding(
                        //     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        //     child: Row(
                        //       children: <Widget>[
                        //         Expanded(
                        //           child: GestureDetector(
                        //             onTap: () {
                        //               Provider.of<AdminMode>(context, listen: false)
                        //                   .changeIsAdmin(true);
                        //             },
                        //             child: Text(
                        //               'i\'m an admin',
                        //               textAlign: TextAlign.center,
                        //               style: TextStyle(
                        //                   color: Provider.of<AdminMode>(context).isAdmin
                        //                       ? Color(0xFFFFC12F)
                        //                       : Colors.white),
                        //             ),
                        //           ),
                        //         ),
                        //         Expanded(
                        //           child: GestureDetector(
                        //             onTap: () {
                        //               Provider.of<AdminMode>(context, listen: false)
                        //                   .changeIsAdmin(false);
                        //             },
                        //             child: Text(
                        //               'i\'m a user',
                        //               textAlign: TextAlign.center,
                        //               style: TextStyle(
                        //                   color:
                        //                   Provider.of<AdminMode>(context, listen: true)
                        //                       .isAdmin
                        //                       ? Colors.white
                        //                       : Color(0xFFFFC12F)
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // )









                            // ElevatedButton(
                            //   child: Text("G",style: TextStyle(color: Colors.red),),
                            //
                            //   onPressed: () async{







                              //  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                //sharedPreferences.setString('email', _PasswordController.text);



                                //
                                // final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                                // provider.login();
                                // // Navigator.of(context).pushReplacementNamed('homepage');
                                // Navigator.push(context, MaterialPageRoute(
                                //   builder: (BuildContext context) {
                                //     if(provider.isSigningIn){
                                //       return HomePage();
                                //     }
                                //     else{
                                //       return LandinPage();
                                //     }
                                //   },
                                //
                                // )
                                // );

                       //       },
                        //      style: ElevatedButton.styleFrom(primary:Color(0xFFFAFAFA),onSurface: Color(0xFF039BE5),shape: CircleBorder()),

                       //     )

                   //     )






                      ]
                  )
              )
            ]
        ),),)
    )
    ;

  }
  void validate(BuildContext context) async {
    final modelhud = Provider.of<ModelHud>(context, listen: false);
    modelhud.changeisLoading(true);
    if (widget.globalKey.currentState.validate()) {
      widget.globalKey.currentState.save();
      if (Provider.of<AdminMode>(context, listen: false).isAdmin) {
        if (_password == adminPassword) {
          try {
            await authBase.registerWithEmailAndPassword(_email.trim(), _password.trim());
            Navigator.pushNamed(context, AdminHome.id);
          } catch (e) {
            modelhud.changeisLoading(false);
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(e.message),
            ));
          }
        } else {
          modelhud.changeisLoading(false);
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Something went wrong !'),
          ));
        }
      } else {
        try {
          await authBase.registerWithEmailAndPassword(_email.trim(), _password.trim());
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return HomePage();
            },
          ));
        } catch (e) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(e.message),
          ));
        }
      }
    }
    modelhud.changeisLoading(false);
  }

  void keepUserLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(kKeepMeLoggedIn, keepMeLoggedIn);
  }
}


