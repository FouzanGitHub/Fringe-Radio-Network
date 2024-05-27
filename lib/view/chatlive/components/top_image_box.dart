import '../../../resources/exports/index.dart';

class TopImageBox extends StatelessWidget {
  const TopImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.HEIGHT_250,
      width: double.maxFinite,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImage.chatImage), fit: BoxFit.fill)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Strings.fringeRadioNetwork,
            style: CustomTextTheme.bold24,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Text(
              Strings.chatTagLine,
              style: CustomTextTheme.normal14,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
