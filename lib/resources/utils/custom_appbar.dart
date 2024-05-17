
import '../exports/index.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
        leadingWidth: Sizes.WIDTH_80,
         leading: Padding(
           padding: const EdgeInsets.only(left:Sizes.PADDING_15),
           child: Container(
            height: Sizes.HEIGHT_100,
            width: Sizes.WIDTH_100,
            
            decoration:const BoxDecoration(
              color: AppColors.transparent,
              image: DecorationImage(image: AssetImage(AppImage.logo,),
              fit: BoxFit.fill
              )
            ),
             
           ),
         ),
         centerTitle: true,
         title: const Text('',
         style: CustomTextTheme.headingSmall,
         ),
         actions: [
           Padding(
             padding: const EdgeInsets.only(right:Sizes.PADDING_15),
             child: Builder(
               builder: (context) {
                 return InkWell(
                        onTap: () => Scaffold.of(context).openEndDrawer(),
                        child: Container(
                          height: Sizes.HEIGHT_50,
                          width: Sizes.WIDTH_50,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Icon(
                            Icons.menu,
                            color: AppColors.whiteColor,
                            size: Sizes.ICON_SIZES_30,
                          ),
                        ),
                      );
               }
             ),
           )
         ],
      );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}