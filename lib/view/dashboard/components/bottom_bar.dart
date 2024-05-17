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
      child: BottomNavigationBar(
           
            elevation: 0,
            backgroundColor: AppColors.transparent,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
              
                backgroundColor: AppColors.primaryColor,
                icon: Icon(Icons.home_filled),
                label: Strings.home,
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.primaryColor,
                icon: Icon(Icons.message),
                label: Strings.about,
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.primaryColor,
                icon: Icon(Icons.store_mall_directory_rounded),
                label: Strings.shop,
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.primaryColor,
                icon: Icon(Icons.forum_rounded),
                label: Strings.liveChat,
              ),
              
            ],
      
            showUnselectedLabels: true,
            unselectedLabelStyle: CustomTextTheme.regular14.copyWith(
            color: AppColors.whiteColor
            ),
            selectedLabelStyle: CustomTextTheme.regular14.copyWith(
            color: AppColors.whiteColor
            ),
            currentIndex: selectedIndex.value,
            unselectedItemColor: AppColors.whiteColor,
            selectedItemColor: AppColors.whiteColor,
            onTap: onItemTapped,
          ),
    );
  }
}
