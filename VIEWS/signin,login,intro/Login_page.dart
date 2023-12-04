import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/CONTROLLERS/auth_controller.dart';
import '../../CONTROLLERS/main_product_card/Retriving_controllers/product.dart';
import 'Signup_form.dart';
import '../HOME.dart';

class Login extends StatefulWidget {


  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  // ProductController Productcontroller=Get.find<ProductController>();


  // late SMIBool isHandsUp;
  // late SMITrigger failTrigger, successTrigger;
  // late SMIBool isChecking;
  // Artboard? artboard;
  // late StateMachineController stateMachineController;
  // var animationlink = 'assists/images/3645-7621-remix-of-login-machine.riv';
  // late SMINumber looknumber;
  // late String emailErrorText;


  @override
  void initState() {
    super.initState();
    // initArtboard();
  }

  // initArtboard() {
  //   rootBundle.load(animationlink).then((value) {
  //     final file = RiveFile.import(value);
  //     final art = file.mainArtboard;
  //     stateMachineController = StateMachineController.fromArtboard(art, 'Login Machine')!;
  //     art.addController(stateMachineController);
  //
  //     for (var element in stateMachineController.inputs) {
  //       if (element.name == 'isChecking') {
  //         isChecking = element as SMIBool;
  //       } else if (element.name == 'isHandsUp') {
  //         isHandsUp = element as SMIBool;
  //       } else if (element.name == 'trigSuccess') {
  //         successTrigger = element as SMITrigger;
  //       } else if (element.name == 'trigFail') {
  //         failTrigger = element as SMITrigger;
  //       } else if (element.name == 'numLook') {
  //         looknumber = element as SMINumber;
  //       }
  //     }
  //     setState(() {
  //       artboard = art;
  //     });
  //   });
  // }
  //
  // checking() {
  //   isHandsUp.change(false);
  //   isChecking.change(true);
  //   looknumber.change(0);
  // }
  //
  // handsup() {
  //   isHandsUp.change(true);
  //   isChecking.change(false);
  // }
  //
  // handsdown() {
  //   isHandsUp.change(false);
  //   isChecking.change(false);
  // }
  //
  // moveEyes(value) {
  //   looknumber.change(value.length.toDouble());
  // }
  //
  // @override
  // void dispose() {
  //   stateMachineController.dispose();
  //     super.dispose();
  // }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> handleLogin() async {
    try {
      await  Auth_controller.instance.login(emailController.text.trim(), passwordController.text.trim());
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        Get.to(() => HomeScreen());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed. Please check your credentials.'),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email not found. Please sign up.'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid email format. Please enter a valid email. ${e.code}'),
          ),
        );
      }
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login message",
        backgroundColor: Colors.blue,
        snackPosition: SnackPosition.TOP,
        titleText: Text(
          "Login Failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              // handsdown();
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
               color: Colors.black,
                height:size.height,
                alignment: Alignment.topCenter,
                // decoration: BoxDecoration(
                //    image: DecorationImage(image: AssetImage("assists/images/DORADO LOGO (1).png")),
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   child: SizedBox(
                    //     width: 200,
                    //     height: 120,
                    //     child:
                    //     // artboard != null
                    //     //     ?
                    //     SingleChildScrollView(
                    //       child:
                          Container(
                            color: Colors.black54,
                            // margin: EdgeInsets.only(top: 40),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                // Image(
                                //   image:AssetImage("assists/images/DORADO LOGO (1).png"),
                                //   // DecorationImage(image: AssetImage("assists/images/DORADO LOGO (1).png")),
                                // ),
                                Text(
                                  "DORADO",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 28, fontFamily: 'RobotoCondensed', color: Colors.white),
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                // Text(
                                //   "Welcome Back, you've been missed!",
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'RobotoCondensed', color: Colors.white),
                                // )
                              ],
                            ),
                          ),

                    Container(
                      // alignment: Alignment.center,
                      width: size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      padding: const EdgeInsets.all(15),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              TextFormField(
                                controller: emailController,
                                // onTap: checking,
                                // onChanged: ((value) => moveEyes(value)),
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  prefixIconColor: Colors.black54,
                                  hintText: 'phone number',
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20))),
                                  focusColor: Colors.blueAccent,
                                  contentPadding: EdgeInsets.all(5),
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                // onTap: handsup,
                                keyboardType: TextInputType.visiblePassword,
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.password),
                                    prefixIconColor: Colors.black54,
                                    contentPadding: EdgeInsets.all(5),
                                    hintText: 'Password',
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                              ),
                              const SizedBox(height: 7,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                       Get.to(() => Signup());
                                    },
                                    child: const Text('forgot password?', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 7,),
                              ElevatedButton(
                                onPressed: () {
                                  handleLogin();
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("New to THE_ORIGINALS?   ", style: TextStyle(fontSize: 13),),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => Signup());
                                    },
                                    child: const Text('Sign up.', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10, bottom: 10),
            alignment: Alignment.bottomRight,
            child: OutlinedButton(
              onPressed: () {
                Get.to(() => HomeScreen());
              },
              child: Text('Skip', style: TextStyle(fontFamily: 'RobotoCondensed'),
              ),
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                side: const BorderSide(width: 2, color: Colors.lightBlueAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
