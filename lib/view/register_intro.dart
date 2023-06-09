import 'package:flutter/material.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/component/my_string.dart';
import 'package:tec_blog/view/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/bot.jpg",
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: MyStrings.welcome,
                  style: textTheme.headline4,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: () {
                  _showEmailBottomSheet(context, size, textTheme);
                },
                child: const Text("بزن بریم"),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.insertYourEmail,
                  style: textTheme.headline4,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                    onChanged: (value) {
                      isEmail(value);
                    },
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              width: 2, color: SolidColors.primeryColor),
                        ),
                        hintText: "tech@gmail.com",
                        hintStyle: textTheme.headline5,
                        filled: true),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _activateCodeBottomSheet(context, size, textTheme);
                  },
                  child: const Text("ادامه"),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.activateCode,
                  style: textTheme.headline4,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                    onChanged: (value) {
                      isEmail(value);
                    },
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                              width: 2, color: SolidColors.primeryColor),
                        ),
                        hintText: "******",
                        hintStyle: textTheme.headline5,
                        filled: true),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const MyCats(),
                    ));
                  },
                  child: const Text("ادامه"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
