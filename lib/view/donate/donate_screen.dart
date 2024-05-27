import '../../resources/exports/index.dart';

class DonateScreen extends GetView<DonateController> {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(showImage: true),
      endDrawer: MyDrawer(),
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          Container(
              height: Sizes.HEIGHT_200,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImage.donateImage), fit: BoxFit.fill),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.pleaseDonate,
                    style: CustomTextTheme.regular18,
                  ),
                  Text(
                    Strings.theFringeRadioNetwork,
                    style: CustomTextTheme.regular18,
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(Sizes.PADDING_15),
            child: Text(
              Strings.donateDetail,
              style:
                  CustomTextTheme.normal16.copyWith(color: AppColors.textBlack),
              textAlign: TextAlign.justify,
            ),
          ),
         const  SpaceH20(),
          CustomButton(
              height: Sizes.HEIGHT_50,
              width: Sizes.WIDTH_150,
              title: Strings.donateNow,
              isIcon: true,
              icon: Icons.paid_outlined,
              pressed: (){controller.launchUrlWeb();},
              isBackgroundDark: false,
              )
        ],
      ),
    );
  }
}
