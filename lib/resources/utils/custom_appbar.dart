import '../exports/index.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool showImage;
  const AppBarWidget({super.key, required this.showImage});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      leadingWidth: Sizes.WIDTH_80,
      leading: showImage
          ? Padding(
              padding: const EdgeInsets.only(left: Sizes.PADDING_15),
              child: Container(
                height: Sizes.HEIGHT_100,
                width: Sizes.WIDTH_100,
                decoration: const BoxDecoration(
                    color: AppColors.transparent,
                    image: DecorationImage(
                        image: AssetImage(
                          AppImage.logo,
                        ),
                        fit: BoxFit.fill)),
              ),
            )
          : Padding(
            padding: const EdgeInsets.only(
             top:Sizes.PADDING_2,bottom: Sizes.PADDING_2,
             left:Sizes.PADDING_15,right: Sizes.PADDING_10,),
            child: iconButton(
                     context, 
                     pressed: (){Navigator.pop(context);},
                     icon: Icons.keyboard_arrow_left_rounded,
                     ),
          ),
      centerTitle: true,
      title: const Text(
        '',
        style: CustomTextTheme.headingSmall,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: Sizes.PADDING_15),
          child: Builder(builder: (context) {
            return iconButton(
                   context, 
                   pressed: ()=>Scaffold.of(context).openEndDrawer(),
                   icon: Icons.menu,
                   );
          }),
        )
      ],
    );
  }

  Widget iconButton(BuildContext context, {required pressed, required icon}) {
    return Bounce(
      duration: const Duration(milliseconds: 100),
      onPressed: pressed,
      child: Container(
        height: Sizes.HEIGHT_50,
        width: Sizes.WIDTH_50,
        decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              offset:const Offset(0, 3),
              color: AppColors.grey.withOpacity(0.3)
              )
            ]
            ),
        child:  Icon(
          icon,
          color: AppColors.whiteColor,
          size: Sizes.ICON_SIZES_30,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
