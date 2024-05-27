import '../../resources/exports/index.dart';

class ShopScreen extends GetView<ShopController> {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final ShopController controller = Get.put(ShopController());
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
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
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              Strings.shopDetail,
              style: CustomTextTheme.regular16
                  .copyWith(color: AppColors.textBlack),
              textAlign: TextAlign.start,
            ),
          ),
          const SpaceH20(),
          CustomButton(
            height: Sizes.HEIGHT_40,
            width: Sizes.WIDTH_120,
            title: Strings.clickHere,
            isIcon: false,
            isBackgroundDark: false,
            pressed: () {
             controller.launchUrlWeb();
            },
          ),
        ],
      ),
    );
  }
}
