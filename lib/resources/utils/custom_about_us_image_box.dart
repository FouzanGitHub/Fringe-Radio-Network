import '../exports/index.dart';

class AboutUsImageBox extends StatelessWidget {
  final bool isHomeAboutUs;
   const AboutUsImageBox({super.key,
   required this.isHomeAboutUs
   
   });

  @override
  Widget build(BuildContext context) {
    return Container(
              height: Sizes.HEIGHT_250,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  
                  image:  DecorationImage(
                  colorFilter: ColorFilter.mode(AppColors.blackColor.withOpacity(0.8), BlendMode.dstATop),
                      image:const  AssetImage(AppImage.aboutImage), fit: BoxFit.fill),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: const Offset(0, 3))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Strings.aboutUs,
                    style: CustomTextTheme.normal18.copyWith(
                    color: isHomeAboutUs
                    ? AppColors.textWhite
                    : AppColors.textPrimary
                    )
                        
                  ),
                 const  Text(Strings.fringeRadioNetwork,
                      style: CustomTextTheme.bold24),
                ],
              ),
            );
  }
}