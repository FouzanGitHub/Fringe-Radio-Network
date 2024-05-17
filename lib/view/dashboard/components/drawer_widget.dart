import '../../../resources/exports/index.dart';


class MyDrawer extends StatelessWidget {
  final List<DrawerModel> items;

  const MyDrawer({Key? key, required this.items}) : super(key: key);

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
          itemCount: items.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(Sizes.PADDING_4),
              child: GestureDetector(
                onTap: () => items[index].onTap(),
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
