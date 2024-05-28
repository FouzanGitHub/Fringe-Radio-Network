import '../exports/index.dart';

class CustomSnackBar extends StatelessWidget {
  final String title;
  final String message;
  final SnackPosition snackPosition;
  final Duration duration;

  const CustomSnackBar({
    super.key,
    required this.title,
    required this.message,
    this.snackPosition = SnackPosition.TOP,
    this.duration = const Duration(seconds: 5),
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }

  void showSnackBar() {
    Get.snackbar(
      '', 
      '',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 5),
        backgroundColor: AppColors.primaryColor.withOpacity(0.4),
        titleText: Text(
          title,
          style: CustomTextTheme.bold20.copyWith(color: AppColors.textWhite),
        ),
        messageText: Text(
          message,
          style: CustomTextTheme.regular16.copyWith(color: AppColors.textWhite),
        ));
  }
}
