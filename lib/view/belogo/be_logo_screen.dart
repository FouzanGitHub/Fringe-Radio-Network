import 'package:fringe_radio_network/resources/exports/index.dart';

class BeOnLogoScreen extends GetView<BeOnLogoController> {
  const BeOnLogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: const AppBarWidget(showImage: true),
      endDrawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            height: Sizes.HEIGHT_200,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImage.shopImage), fit: BoxFit.fill),
            ),
          ),
          const SpaceH20(),
          Padding(
            padding: const EdgeInsets.only(
                left: Sizes.PADDING_15, right: Sizes.PADDING_15),
            child: Text(
              Strings.beLogoDetail1,
              style: CustomTextTheme.regular16.copyWith(
                color: AppColors.textBlack,
              ),
              textAlign: TextAlign.left,
            ),
          ),
           const SpaceH30(),
          CustomButton(
              height: Sizes.HEIGHT_45,
              width: Sizes.WIDTH_130,
              title: Strings.clickHere,
              isIcon: false,
              pressed: (){controller.launchUrlWeb();},
              isBackgroundDark: false),
          const SpaceH40(),
          Padding(
            padding: const EdgeInsets.only(
                left: Sizes.PADDING_15, right: Sizes.PADDING_15),
            child: Text(
              Strings.beLogoDetail2,
              style: CustomTextTheme.regular16.copyWith(
                color: AppColors.textBlack,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SpaceH30(),
          CustomButton(
              height: Sizes.HEIGHT_45,
              width: Sizes.WIDTH_130,
              title: Strings.download,
              isIcon: true,
              icon: Icons.file_download_outlined,
              pressed: (){},
              isBackgroundDark: false),
        ],
      ),
    );
  }
}
