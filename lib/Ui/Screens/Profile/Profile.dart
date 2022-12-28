import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magiccoffee/Ui/Constans/app.dart';
import 'package:magiccoffee/Ui/Constans/icons.dart';
import 'package:magiccoffee/Ui/Constans/strings.dart';
import 'package:magiccoffee/Ui/Constans/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors().ScaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                top: height * 0.05,
                left: width * 0.05,
                right: width * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    StringsData().Profile,
                    style: AppData().regulterTextStyle(
                      FontSize: 20,
                      FontColor: AppColors().AppMainColor,
                      FontWeights: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: height * 0.03,
              left: width * 0.05,
              right: width * 0.05,
            ),
            child: Column(
              children: [
                profileFields(
                  height: height,
                  width: width,
                  ProfileIcon: IconsData().ProfileIcon,
                  Title: 'Name',
                  SubTitle: 'Alex',
                  onTapEdit: () {
                    print("Name");
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                profileFields(
                  height: height,
                  width: width,
                  ProfileIcon: IconsData().PhoneIcon,
                  Title: 'Phone number',
                  SubTitle: '+375 33 664-57-36',
                  onTapEdit: () {
                    print("Phone");
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                profileFields(
                  height: height,
                  width: width,
                  ProfileIcon: IconsData().EmailIcon,
                  Title: 'Email',
                  SubTitle: 'adosmenesk@pm.me',
                  onTapEdit: () {
                    print("Email");
                  },
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      color: AppColors().ScaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors().AppMainColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
