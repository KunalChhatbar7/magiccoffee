import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magiccoffee/Ui/Constans/app.dart';
import 'package:magiccoffee/Ui/Constans/icons.dart';

profileFields({
  required String ProfileIcon,
  required String Title,
  required String SubTitle,
  required double height,
  required double width,
  required GestureTapCallback onTapEdit,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Row(
        children: [
          Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 1,
            child: Container(
              height: height * 0.06,
              width: width * 0.12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors().ProfileBackgroudColor,
              ),
              child: Center(
                child: SvgPicture.asset(
                  ProfileIcon,
                  height: height * 0.03,
                  width: width * 0.07,
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * 0.03,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Title,
                style: AppData().regulterTextStyle(
                  FontSize: 12,
                  FontColor: AppColors().ProfileTitleColor,
                ),
              ),
              Text(
                SubTitle,
                style: AppData().regulterTextStyle(
                  FontSize: 12,
                  FontColor: AppColors().AppMainColor,
                  FontWeights: FontWeight.w600,
                ),
              )
            ],
          ),
        ],
      ),
      InkWell(
        onTap: onTapEdit,
        child: SvgPicture.asset(
          IconsData().EditIcon,
        ),
      ),
    ],
  );
}
