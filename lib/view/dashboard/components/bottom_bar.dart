import '../../../resources/exports/index.dart';


class BottomNavigationBarWidget extends StatelessWidget {
  final RxInt selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigationBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: Sizes.HEIGHT_70,
      child: Obx(
        ()=> BottomNavigationBar(
             type: BottomNavigationBarType.fixed,
              elevation: 0,
              backgroundColor: AppColors.primaryColor,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                
                  icon: Icon(Icons.home_filled),
                  label: Strings.home,
                ),
                BottomNavigationBarItem(
                  
                  icon: Icon(Icons.message),
                  label: Strings.about,
                ),
                BottomNavigationBarItem(
                  
                  icon: Icon(Icons.store_mall_directory_rounded),
                  label: Strings.shop,
                ),
                BottomNavigationBarItem(
                 
                  icon: Icon(Icons.forum_rounded),
                  label: Strings.liveChat,
                ),
                
              ],
              // showSelectedLabels: true,
              showUnselectedLabels: true,
              unselectedLabelStyle: CustomTextTheme.regular14.copyWith(
              color: AppColors.textGrey
              ),
              selectedLabelStyle: CustomTextTheme.regular14.copyWith(
              color: AppColors.whiteColor
              ),
              currentIndex: selectedIndex.value,
              unselectedItemColor: AppColors.whiteColor,
              selectedItemColor: AppColors.whiteColor,
              onTap: onItemTapped,
            ),
      ),
    );
  }
}
