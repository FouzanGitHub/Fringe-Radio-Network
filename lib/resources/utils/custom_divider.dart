
import '../exports/index.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Divider(
      thickness: Sizes.HEIGHT_1,
      color: AppColors.grey.withOpacity(0.6),
    );
  }
}
