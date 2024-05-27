import 'package:flutter_bounce/flutter_bounce.dart';

import '../exports/index.dart';

class CustomButton extends StatelessWidget {
  final dynamic height;
  final dynamic width;
  final String title;
  final bool isIcon;
  final dynamic icon;
  final dynamic pressed;
  final dynamic isBackgroundDark;
  const CustomButton(
      {super.key,
      this.height,
      this.width,
      required this.title,
      required this.isIcon,
      this.icon,
     required this.pressed,
     required  this.isBackgroundDark
      });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration:const Duration(milliseconds: 100),
      onPressed: pressed,
      child: Container(
        padding:const  EdgeInsets.only(left: Sizes.PADDING_4, right: Sizes.PADDING_4),
        height: height ?? Sizes.HEIGHT_32 ,
        width: width   ?? Sizes.WIDTH_120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: AppColors.primaryColor,
            boxShadow: [
              BoxShadow(
              color: isBackgroundDark 
              ? AppColors.blackColor.withOpacity(0.3)
              :   AppColors.grey.withOpacity(0.3),
              blurRadius: 3,
              spreadRadius: 3,
              offset: const Offset(0, 3)
              )
            ]
            ),
        child: isIcon
        ?Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: CustomTextTheme.regular14,
            ),
            Icon(
              icon,
              color: AppColors.whiteColor,
            )
          ],
        )
        :Center(child: Text(
              title,
              style: CustomTextTheme.regular14,
            ),)
      ),
    );
  }
}
