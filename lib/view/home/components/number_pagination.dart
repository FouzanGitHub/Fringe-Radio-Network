import '../../../resources/exports/index.dart';


class NumberPaginatorHome extends StatelessWidget {
  NumberPaginatorHome({super.key});
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: GetBuilder<HomeController>(
        id: 'Audio',
        builder: (context) {
          final totalPages =
              (controller.audioItems.length / controller.itemsPerPage).ceil();

          return CustomNumberPaginatorWidget(
            initialPage: 0,
            onPageChanged:(int index) {
               controller.setCurrentPage(index);
           }, 
            totalPages:totalPages,
          );
          // NumberPaginator(
          //   initialPage: 0,
          //   onPageChange: (int index) {
          //     controller.setCurrentPage(index);
          //   },
          //   numberPages: totalPages,
          //   config: NumberPaginatorUIConfig(
          //     height: 64,
          //     buttonShape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(7),
          //     side: const BorderSide(color: AppColors.whiteColor, width: 1)),
          //     buttonSelectedForegroundColor: AppColors.textWhite,
          //     buttonUnselectedForegroundColor: AppColors.textWhite,
          //     buttonUnselectedBackgroundColor: AppColors.secondaryColor,
          //     buttonSelectedBackgroundColor: AppColors.primaryColor,
          //   ),
          // );
        },
      ),
    );
  }
}
