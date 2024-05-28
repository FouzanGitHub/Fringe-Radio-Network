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
      child: Column(
        children: [
      
           Bounce(
            duration:const Duration(milliseconds: 100),
            onPressed: ()=>Get.back(),
             child: Padding(
               padding: const EdgeInsets.only(right:Sizes.PADDING_10,top:Sizes.PADDING_20),
               child: Align(
                alignment: Alignment.topRight,
                 child: Container(
                  padding: const EdgeInsets.all(Sizes.PADDING_10),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.primaryColor,
                  boxShadow: [
                    BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset:const Offset(0, 2),
                    color: AppColors.blackColor.withOpacity(0.2)
                    )
                  ]
                  ),
                  child:const Icon(Icons.close_rounded,
                  color: AppColors.whiteColor,
                  ),
                 ),
               ),
             ),
           ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(top:Sizes.PADDING_10),
              child: ListView.separated(
                itemCount: dashboardController.drawerItems.length,
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                 final  items = dashboardController.drawerItems;
                 List navigateTo = [
                  (){
                    Get.back();
                    Get.toNamed(Routes.dashboard);
                    
                    },
                  (){
                    Get.back();
                    Get.toNamed(Routes.donate);
                    
                    },
                  (){
                    Get.back();
                    Get.toNamed(Routes.ironShow);
                    },
                  (){
                    Get.back();
                    Get.toNamed(Routes.spiritWar);
                    },
                  (){
                    Get.back();
                    dashboardController.pandaLaunchUrl();
                    },
                  (){
                    Get.back();
                    Get.toNamed(Routes.beOnLogo);
                    },
                  (){
                    Get.back();
                    dashboardController.strangeLaunchUrl();
                    },
                  (){
                    Get.back();
                    dashboardController.policyLaunchUrl();
                    },
                  (){
                    Get.back();
                    Get.toNamed(Routes.contactUs);
                    },
                  ];
                  return Bounce(
                    onPressed:navigateTo[index],
                    duration:const Duration(milliseconds: 50),
                    child: Padding(
                      padding: const EdgeInsets.all(Sizes.PADDING_6),
                      child: Row(
                        children: [
                          Icon(items[index].icon,
                          size: Sizes.ICON_SIZES_35,
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
          ),
          Expanded(
            child: Container(
              height: Sizes.HEIGHT_240,
              width: double.maxFinite,
              decoration: BoxDecoration(
              image: DecorationImage(
              colorFilter: ColorFilter.mode(AppColors.whiteColor.withOpacity(0.2), BlendMode.dstATop),
              image:const AssetImage(AppImage.logo,),
              fit: BoxFit.fill 
              )
              ),
              
            ),
          )
        ],
      ),
    );
  }
}
