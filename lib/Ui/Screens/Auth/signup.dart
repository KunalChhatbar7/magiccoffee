import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magiccoffee/Ui/Constans/app.dart';
import 'package:magiccoffee/Ui/Constans/icons.dart';
import 'package:magiccoffee/Ui/Constans/strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailTextController = TextEditingController();

  var passwordTextController = TextEditingController();

  var userNameTextController = TextEditingController();
  var rePasswordTextController = TextEditingController();

  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: height * 0.09, left: width * 0.05, right: width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(IconsData().BackIcon),
            ),
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
                    StringsData().SignUp,
                    style: AppData().regulterTextStyle(
                      FontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    StringsData().CreateNewAccount,
                    style: AppData().regulterTextStyle(
                      FontSize: 14,
                      FontColor: AppColors().SubTextColor,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextField(
                    controller: userNameTextController,
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
                                IconsData().ProfileIcon,
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
                        hintText: StringsData().UserName,
                        hintStyle: AppData().regulterTextStyle(
                            FontSize: 12, FontColor: AppColors().SubTextColor)),
                  ),
                  SizedBox(
                    height: height * 0.03,
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
                    height: height * 0.03,
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
                            )),
                        hintText: StringsData().EnterPassword,
                        hintStyle: AppData().regulterTextStyle(
                            FontSize: 12, FontColor: AppColors().SubTextColor)),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  TextField(
                    enabled: true,
                    obscureText: obscureText,
                    controller: rePasswordTextController,
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
                            )),
                        hintText: StringsData().EnterRePassword,
                        hintStyle: AppData().regulterTextStyle(
                            FontSize: 12, FontColor: AppColors().SubTextColor)),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Center(
                    child: Text(
                      StringsData().SingUpMessage,
                      style: AppData().regulterTextStyle(
                        FontSize: 11,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: height * 0.08,
                        width: width * 0.22,
                        decoration: BoxDecoration(
                          color: AppColors().AppMainColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(IconsData().RightIcon),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Row(
                    children: [
                      Text(
                        StringsData().AlreadyHaveAccount,
                        style: AppData().regulterTextStyle(
                            FontSize: 12, FontColor: AppColors().SubTextColor),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          StringsData().SignIn,
                          style: AppData().regulterTextStyle(
                              FontSize: 12,
                              FontColor: AppColors().AppMainColor),
                        ),
                      ),
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
