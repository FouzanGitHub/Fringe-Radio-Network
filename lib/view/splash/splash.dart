import '../../resources/exports/index.dart';

class SplashScreen extends GetView<SplashController>{
   SplashScreen({super.key});
@override
  final SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
     
      children: [
        Center(
          child: Image.asset(AppImage.logo,
          scale: Sizes.SIZE_3,
          ),
        )
      ],
    ),
  );
  }
  
}