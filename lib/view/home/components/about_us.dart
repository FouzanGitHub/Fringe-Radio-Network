import 'package:fringe_radio_network/view/home/components/about_us_readmore.dart';

import '../../../resources/exports/index.dart';

class HomeAboutUs extends StatelessWidget {
  const HomeAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.aboutUs,
          style:
              CustomTextTheme.regular20.copyWith(color: AppColors.textPrimary),
        ),
        const Text(Strings.fringeRadioNetwork, style: CustomTextTheme.bold24),
        const SpaceH20(),
        Padding(
          padding: const EdgeInsets.only(
              left: Sizes.PADDING_20, right: Sizes.PADDING_20),
          child: Container(
            height: Sizes.HEIGHT_250,
            width: Sizes.WIDTH_450,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    image: AssetImage(AppImage.aboutImage), fit: BoxFit.fill),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.blackColor.withOpacity(0.5),
                      blurRadius: 3,
                      spreadRadius: 3,
                      offset: const Offset(0, 3))
                ]),
          ),
        ),
        const SpaceH20(),
        const Padding(
          padding:
              EdgeInsets.only(left: Sizes.PADDING_20, right: Sizes.PADDING_20),
          child: Text(
            Strings.homeAboutUsDummy1,
            style: CustomTextTheme.normal16,
            textAlign: TextAlign.justify,
          ),
        ),
        const SpaceH20(),
         CustomButton(
          height: Sizes.HEIGHT_50,
          width: Sizes.WIDTH_130,
          isIcon: true,
          icon: Icons.north_east_rounded,
          title: Strings.readMore,
          pressed: (){Get.to( HomeAboutUsReadMore());},
        ),
      ],
    );
  }
}
