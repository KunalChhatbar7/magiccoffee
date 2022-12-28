import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magiccoffee/Ui/Constans/app.dart';
import 'package:magiccoffee/Ui/Constans/icons.dart';
import 'package:magiccoffee/Ui/Constans/strings.dart';
import 'package:magiccoffee/Ui/Screens/Auth/forgotpassword.dart';
import 'package:magiccoffee/Ui/Screens/Auth/signup.dart';
import 'package:magiccoffee/Ui/Screens/Home/home.dart';
import 'package:page_transition/page_transition.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var emailTextController = TextEditingController();

  var passwordTextController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors().WhiteColor,
      body: Padding(
        padding: EdgeInsets.only(
            top: height * 0.09, left: width * 0.05, right: width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            // SvgPicture.asset(IconsData().BackIcon),
            SizedBox(
              height: height * 0.046,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringsData().SignIn,
                    style: AppData().regulterTextStyle(
                      FontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    StringsData().Walcome,
                    style: AppData().regulterTextStyle(
                      FontSize: 14,
                      FontColor: AppColors().SubTextColor,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  TextField(
                    controller: emailTextController,
                    cursorColor: AppColors().AppMainColor,
                    autofocus: false,
                    decoration: InputDecoration(
                        focusColor: AppColors().AppMainColor,
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors().AppMainColor)),
                        prefixIcon: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                IconsData().EmailIcon,
                                height: height * 0.03,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: height * 0.04,
                                child: VerticalDivider(
                                  thickness: 2,
                                  color: AppColors().SubTextColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        hintText: StringsData().EnterEmail,
                        hintStyle: AppData().regulterTextStyle(
                            FontSize: 12, FontColor: AppColors().SubTextColor)),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  TextField(
                    enabled: true,
                    obscureText: obscureText,
                    controller: passwordTextController,
                    cursorColor: AppColors().AppMainColor,
                    autofocus: false,
                    decoration: InputDecoration(
                        focusColor: AppColors().AppMainColor,
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors().AppMainColor)),
                        prefixIcon: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                IconsData().LockIcon,
                                height: height * 0.03,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: height * 0.04,
                                child: VerticalDivider(
                                  thickness: 2,
                                  color: AppColors().SubTextColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(14),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            child: SvgPicture.asset(
                              IconsData().ShowIcon,
                              color: obscureText
                                  ? AppColors().SubTextColor
                                  : AppColors().AppMainColor,
                            ),
                          ),
                        ),
                        hintText: StringsData().EnterPassword,
                        hintStyle: AppData().regulterTextStyle(
                            FontSize: 12, FontColor: AppColors().SubTextColor)),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Center(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 200),
                          child: const ForgotPassword(),
                        ),
                      );
                    },
                    child: Text(
                      StringsData().ForgotPassword,
                      style: AppData().regulterTextStyle(
                        FontSize: 14,
                        Decoration: TextDecoration.underline,
                      ),
                    ),
                  )),
                  SizedBox(
                    height: height * 0.16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: height * 0.08,
                        width: width * 0.22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: const Duration(milliseconds: 200),
                                child: const HomeScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: height * 0.08,
                            width: width * 0.22,
                            decoration: BoxDecoration(
                              color: AppColors().AppMainColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(IconsData().RightIcon),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.16,
                  ),
                  Row(
                    children: [
                      Text(
                        StringsData().Newmember,
                        style: AppData().regulterTextStyle(
                            FontSize: 12, FontColor: AppColors().SubTextColor),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: const Duration(milliseconds: 200),
                              child: const SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          StringsData().SignUp,
                          style: AppData().regulterTextStyle(
                              FontSize: 12,
                              FontColor: AppColors().AppMainColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
