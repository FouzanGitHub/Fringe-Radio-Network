import '../exports/index.dart';

class CustomMessageDialog extends StatelessWidget {
  const CustomMessageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.HEIGHT_450,
      width: Sizes.WIDTH_350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/messageAnimation.json',
              height: Sizes.HEIGHT_300, width: Sizes.WIDTH_250),
          Text(
            Strings.sendMessageLine,
            style: CustomTextTheme.regular18.copyWith(
              color: AppColors.textBlack,
            ),
            textAlign: TextAlign.center,
          ),
          const SpaceH20(),
          CustomButton(
              height: Sizes.HEIGHT_45,
              width: Sizes.WIDTH_140,
              title: Strings.ok,
              isIcon: false,
              pressed: () {
                Get.back();
              },
              isBackgroundDark: false)
        ],
      ),
    );
  }
}
