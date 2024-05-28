import '../../resources/exports/index.dart';


class Dashboard extends GetView<DashboardController> {
  const Dashboard({super.key});

   @override
  Widget build(BuildContext context) {
    final DashboardController controller =
        Get.put(DashboardController());

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        
          appBar:const  AppBarWidget(
        
          showImage: true,
          ),
        endDrawer: MyDrawer(),
        
        body:  Obx(() => controller.screens[controller.selectedIndex.value]),
        bottomNavigationBar: BottomNavigationBarWidget(
          selectedIndex: controller.selectedIndex,
          onItemTapped: controller.changeIndex,
        ),
      ),
    );
  }
}