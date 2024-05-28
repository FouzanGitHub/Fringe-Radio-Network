import '../../../resources/exports/index.dart';

class DashboardController extends GetxController {
 
 final Uri pandaUrl   = Uri.parse('https://fringepanda.com/');
 final Uri strangeUrl = Uri.parse('https://thestrangedotcom.com/');
 final Uri policyUrl  = Uri.parse('https://www.spreaker.com/privacy');
  
  final RxInt selectedIndex = 0.obs;
 
     List<DrawerModel> drawerItems = [
       DrawerModel(
        title: Strings.home,
        icon: Icons.home_outlined,
        onTap: () {},
      ),
       DrawerModel(
        title: Strings.donate,
        icon: Icons.volunteer_activism_outlined,
        onTap: () {Get.toNamed(Routes.donate);},
      ),
      DrawerModel(
        title: Strings.ironShow,
        icon: Icons.slideshow_outlined,
        onTap: () {Get.toNamed(Routes.ironShow);},
      ),
      DrawerModel(
        title: Strings.spiritWars,
        icon: Icons.queue_music_outlined,
        onTap: () {Get.toNamed(Routes.spiritWar);},
      ),
      DrawerModel(
        title: Strings.fringePanda,
        icon: Icons.pets_outlined,
        onTap: (){}
      ),
      DrawerModel(
        title: Strings.beLogo,
        icon: Icons.link_outlined,
        onTap: () {Get.toNamed(Routes.beOnLogo);},
      ),
      DrawerModel(
        title: Strings.goStrange,
        icon: Icons.link_outlined,
        onTap: () {},
      ),
      DrawerModel(
        title: Strings.privacyPolicies,
        icon: Icons.policy_outlined,
        onTap: () {},
      ),
      DrawerModel(
        title: Strings.contactUs,
        icon: Icons.contact_support_outlined,
        onTap: () {Get.toNamed(Routes.contactUs);},
      ),
     ];
  final List<Widget> screens = [
   HomeScreen(),
  const AboutScreen(),
  const ShopScreen(),
  const ChatLiveScreen()
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
  Future<void> pandaLaunchUrl() async {
    if (!await launchUrl(pandaUrl)) {
      throw Exception("Could not launch $pandaUrl");
    }
  }
  Future<void> strangeLaunchUrl() async {
    if (!await launchUrl(strangeUrl)) {
      throw Exception("Could not launch $strangeUrl");
    }
  }
  Future<void> policyLaunchUrl() async {
    if (!await launchUrl(policyUrl)) {
      throw Exception("Could not launch $policyUrl");
    }
  }



@override
  void onInit() {
     super.onInit();

 
  }
}
