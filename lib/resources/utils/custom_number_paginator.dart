import '../exports/index.dart';

class CustomNumberPaginatorWidget extends StatelessWidget {
  final dynamic initialPage;
  final dynamic onPageChanged;
  final dynamic totalPages;

  const CustomNumberPaginatorWidget({super.key,required this.initialPage, required this.onPageChanged,required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return NumberPaginator(
      initialPage: initialPage,
      onPageChange: onPageChanged,
      numberPages: totalPages,
      config: NumberPaginatorUIConfig(
        height: 64,
        buttonShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: const BorderSide(color: AppColors.whiteColor, width: 1)),
        buttonSelectedForegroundColor: AppColors.textWhite,
        buttonUnselectedForegroundColor: AppColors.textWhite,
        buttonUnselectedBackgroundColor: AppColors.secondaryColor,
        buttonSelectedBackgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
