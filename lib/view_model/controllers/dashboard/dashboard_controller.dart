import '../../../resources/exports/index.dart';


class DashboardController extends GetxController {
  final RxInt selectedIndex = 0.obs;
    late List<DrawerModel> drawerItems;
  final List<Widget> screens = [
  const HomeScreen(),
  const AboutScreen(),
  const StoreScreen(),
  const ChatLiveScreen()
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
@override
void onInit() {
     drawerItems = [
      DrawerModel(
          title: Strings.donate,
          icon: Icons.volunteer_activism_outlined,
          onTap: () {
          
          }),
      DrawerModel(
        title: Strings.ironShow,
        icon: Icons.slideshow_outlined,
        onTap: () {}),
      
      DrawerModel(
        title: Strings.spiritWars,
        icon: Icons.queue_music_outlined,
        onTap: () {}
        ),
      
      DrawerModel(
        title: Strings.fringePanda,
        icon: Icons.pets_outlined,
        onTap: () {}
      ),
       DrawerModel(
        title: Strings.beLogo,
        icon: Icons.link_outlined,
        onTap: () {}
      ),
       DrawerModel(
        title: Strings.goStrange,
        icon: Icons.link_outlined,
        onTap: () {}
      ),
       DrawerModel(
        title: Strings.privacyPolicies,
        icon: Icons.policy_outlined,
        onTap: () {}
      ),
       DrawerModel(
        title: Strings.contactUs,
        icon: Icons.contact_support_outlined,
        onTap: () {}
      ),
    
      
    ];
    super.onInit();
  }
}
