import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import '../../CONTROLLERS/auth_controller.dart';
import 'Login_page.dart';
import '../HOME.dart';

class Signup extends StatefulWidget {


  @override
  State<Signup> createState() => signup();
}

class signup extends State<Signup> {


  late SMIBool isHandsUp;
  late SMITrigger failTrigger, successTrigger;
  late SMIBool isChecking;
  Artboard? artboard;
  late StateMachineController stateMachineController;
  var animationlink = 'assists/images/3645-7621-remix-of-login-machine.riv';
  late SMINumber looknumber;

  initArtboard() {
    rootBundle.load(animationlink).then((value) {
      final file = RiveFile.import(value);
      final art = file.mainArtboard;
      stateMachineController =
          StateMachineController.fromArtboard(art, 'Login Machine')!;
      art.addController(stateMachineController);

      for (var element in stateMachineController.inputs) {
        if (element.name == 'isChecking') {
          isChecking = element as SMIBool;
        } else if (element.name == 'isHandsUp') {
          isHandsUp = element as SMIBool;
        } else if (element.name == 'trigSuccess') {
          successTrigger = element as SMITrigger;
        } else if (element.name == 'trigFail') {
          failTrigger = element as SMITrigger;
        } else if (element.name == 'numLook') {
          looknumber = element as SMINumber;
        }
      }
      setState(() {
        artboard = art;
      });
    });
  }

  checking() {
    isHandsUp.change(false);
    isChecking.change(true);
    looknumber.change(0);
  }

  handsup() {
    isHandsUp.change(true);
    isChecking.change(false);
  }

  handsdown() {
    isHandsUp.change(false);
  }

  moveEyes(value) {
    looknumber.change(value.length.toDouble());
  }

  @override
  void initState() {
    super.initState();
    initArtboard();
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(children: [
      GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            handsdown();
          },
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              // backgroundColor: Colors.tealAccent,
              body: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: SizedBox(
                          width: 200,
                          height: 130,
                          child: artboard != null
                              ? Rive(artboard: artboard!)
                              : Container(
                                  margin: EdgeInsets.only(top: 40),
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Text(
                                        "HELLO AGAIN!",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            fontFamily: 'RobotoCondensed',
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Welcome Back, you've been missed!",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            fontFamily: 'RobotoCondensed',
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                ///username block

                                TextFormField(
                                  controller: usernameController,
                                  onTap: checking,
                                  onChanged: ((value) => moveEyes(value)),
                                  keyboardType: TextInputType.name,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                  decoration: const InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.alternate_email_outlined),
                                    prefixIconColor: Colors.black54,
                                    hintText: 'Username',
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    focusColor: Colors.indigo,
                                    contentPadding: EdgeInsets.all(5),
                                  ),
                                ),

                                const SizedBox(
                                  height: 7,
                                ),
                                //////EMAIL BLOCK//////
                                TextFormField(
                                  controller: emailController,
                                  onTap: checking,
                                  onChanged: ((value) => moveEyes(value)),
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.phone),
                                    prefixIconColor: Colors.black54,
                                    hintText: 'phone number',
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    focusColor: Colors.indigo,
                                    contentPadding: EdgeInsets.all(5),
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),

                                /////PASSWORD BLOCK//////

                                TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  onTap: handsup,
                                  keyboardType: TextInputType.visiblePassword,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.password),
                                      prefixIconColor: Colors.black54,
                                      hintText: 'Password',
                                      filled: true,
                                      contentPadding: EdgeInsets.all(5),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                ),

                                const SizedBox(
                                  height: 7,
                                ),
                                ////signupButton

                                ElevatedButton(
                                  onPressed: () {
                                    Auth_controller.instance.register(
                                        emailController.text.trim(),
                                        passwordController.text.trim(),
                                        usernameController.text.trim());
                                  },
                                  child: const Text(
                                    "SignUp",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Already a user?  ",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        Get.to(() => Login());
                                      },
                                      child: const Text(
                                        'LOGIN.',
                                        style: TextStyle(
                                            color: Colors.indigo,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ))),
      Container(
        alignment: Alignment.bottomRight,
        margin: EdgeInsets.only(right: 10, bottom: 10),
        child: OutlinedButton(
          onPressed: () {
            Get.to(() => HomeScreen());
          },
          child: Text(
            'Skip',
            style: TextStyle(fontFamily: 'RobotoCondensed'),
          ),
          style: OutlinedButton.styleFrom(
            shape: const StadiumBorder(),
            side: const BorderSide(width: 2, color: Colors.lightBlueAccent),
          ),
        ),
      )
    ]);
  }
}
