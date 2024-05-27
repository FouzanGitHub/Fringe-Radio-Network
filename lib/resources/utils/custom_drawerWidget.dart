import '../../../resources/exports/index.dart';


class MyDrawer extends StatelessWidget {
  // final List<DrawerModel> items;

   MyDrawer({Key? key, }) : super(key: key);
 final DashboardController dashboardController = DashboardController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: Get.width * 0.8,
      padding: const EdgeInsets.all(16.0),
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.only(top:Sizes.PADDING_24),
        child: ListView.separated(
          itemCount: dashboardController.drawerItems.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
           final  items = dashboardController.drawerItems;
           List abc = [
            Get.toNamed(Routes.donate),
            Get.toNamed(Routes.ironShow),
            Get.toNamed(Routes.spiritWar),
            dashboardController.pandaLaunchUrl(),
            dashboardController.strangeLaunchUrl(),
            dashboardController.policyLaunchUrl(),
            dashboardController.pandaLaunchUrl(),
            dashboardController.strangeLaunchUrl(),
            Get.toNamed(Routes.contactUs),
           

           ];
            return Padding(
              padding: const EdgeInsets.all(Sizes.PADDING_4),
              child: GestureDetector(
                onTap: () {
                 abc[index];
                },
                child: Row(
                  children: [
                    Icon(items[index].icon,
                    size: Sizes.ICON_SIZES_30,
                    color: AppColors.primaryColor,
                    ),
                    const SpaceW20(),
                    Text(
                      items[index].title,
                      style: CustomTextTheme.regular18.copyWith(
                      color: AppColors.textBlack
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ).expanded()
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, __) => const SpaceH20(),
        ),
      ),
    );
  }
}
