import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/UitlsFolder/colors.dart';
import 'package:instagram_clone/UitlsFolder/utils.dart';
import 'package:instagram_clone/Widgets/text_Field.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/screens/login_screen.dart';

import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive.dart';
import '../responsive/web_screen_layout.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({Key? key}) : super(key: key);

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _emailEditingController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
  }

  void selectImage() async {
    Uint8List image = await PickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailEditingController.text,
      password: _passwordController.text,
      username: _userNameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const ResponsiveLayout(
            mobilescreenLayout: MobilscreenLayout(),
            webscreenLayout: webscreenLayout(),
          ),
        ),
      );
    }
  }

  void loginscreennav() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const Loginscreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: SafeArea(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(),
                        flex: 1,
                      ),
                      //logo
                      SvgPicture.asset(
                        'assets/ic_instagram.svg',
                        color: primaryColor,
                        height: 65,
                      ),
                      const SizedBox(height: 24),
                      //circula widget
                      Stack(
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  radius: 64,
                                  backgroundImage: MemoryImage(_image!),
                                )
                              : const CircleAvatar(
                                  radius: 64,
                                  backgroundImage: NetworkImage(
                                    'https://t3.ftcdn.net/jpg/00/64/67/80/360_F_64678017_zUpiZFjj04cnLri7oADnyMH0XBYyQghG.jpg',
                                  ),
                                ),
                          Positioned(
                            bottom: -10,
                            left: 80,
                            child: IconButton(
                              onPressed: selectImage,
                              icon: const Icon(Icons.add_a_photo_rounded),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //textfield username
                      TextfeildInput(
                          textEditingController: _userNameController,
                          hinttext: 'Type Your Username',
                          textInputType: TextInputType.text),
                      const SizedBox(
                        height: 20,
                      ),
                      //textfield email
                      TextfeildInput(
                          textEditingController: _emailEditingController,
                          hinttext: 'Type Your Email',
                          textInputType: TextInputType.emailAddress),
                      const SizedBox(
                        height: 20,
                      ),
                      //textfield password
                      TextfeildInput(
                        textEditingController: _passwordController,
                        hinttext: 'Type Your password',
                        textInputType: TextInputType.text,
                        isPass: true,
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      //textfield for bio
                      TextfeildInput(
                          textEditingController: _bioController,
                          hinttext: 'Type Your bio',
                          textInputType: TextInputType.text),
                      const SizedBox(
                        height: 20,
                      ),
                      //button
                      InkWell(
                        onTap: signUpUser,
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              color: blueColor),
                          child: _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: primaryColor,
                                  ),
                                )
                              : const Text('Sign In'),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(),
                      ),
                      //signup
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text('Already Have an Account'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: loginscreennav,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: const Text(
                                'login',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    ));
  }
}
