import '../exports/index.dart';

class ShimmerContainerWidget extends StatelessWidget {
  final dynamic height;
  final dynamic width;
  final dynamic radius;
  const ShimmerContainerWidget({super.key,required this.height,required this.width,required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: AppColors.primaryColor,
      ),
    );
  }
}