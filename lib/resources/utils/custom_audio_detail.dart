
import '../exports/index.dart';

class AudioWithDetail extends StatelessWidget {
  final dynamic visitPressed;
  final dynamic downloadPressed;
  final dynamic forwardPressed;
  final dynamic reversePressed;
  final dynamic playPressed;
  final dynamic isPlay;
  final dynamic audioSlider;
  final dynamic title;
  final dynamic description;
  AudioWithDetail(
      {super.key,
      this.visitPressed,
      this.downloadPressed,
      this.forwardPressed,
      this.reversePressed,
      this.playPressed,
      this.isPlay,
      this.audioSlider,
      this.title,
      this.description});
  final HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textButton(
            title: Strings.epPageFor,
            buttonTitle: Strings.visitNow,
            icon: Icons.arrow_outward_rounded,
            pressed: visitPressed),
        const SizedBox(
          height: Sizes.HEIGHT_15,
        ),
        textButton(
            title: Strings.directLink,
            buttonTitle: Strings.download,
            icon: Icons.file_download_outlined,
            pressed: downloadPressed),
       AudioPlayerWidget(
       reversePressed: reversePressed,
      playPressed: playPressed, 
      isPlay: isPlay, 
      forwardPressed: forwardPressed, 
      audioSlider: audioSlider,
      ),
        Padding(
          padding: const EdgeInsets.only(
              left: Sizes.PADDING_10, right: Sizes.PADDING_6),
          child: Text(
            
            title,
            style: CustomTextTheme.regular14,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: Sizes.PADDING_10, right: Sizes.PADDING_6),
          child: Text(
            Strings.epNotes,
            style: CustomTextTheme.regular16
                .copyWith(color: AppColors.primaryColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: Sizes.PADDING_10, right: Sizes.PADDING_6),
          child: Text(description,
             
              style: CustomTextTheme.normal14),
        ),
        const SizedBox(
          height: Sizes.HEIGHT_10,
        ),
        const CustomDivider(),
        const SizedBox(
          height: Sizes.HEIGHT_10,
        )
      ],
    );
  }
}

Widget textButton(
    {required title, required buttonTitle, required icon, required pressed}) {
  return Padding(
    padding:
        const EdgeInsets.only(left: Sizes.PADDING_10, right: Sizes.PADDING_10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: CustomTextTheme.normal18,
        ),
        const SizedBox(
          width: Sizes.WIDTH_12,
        ),
        CustomButton(
          title: buttonTitle,
          isIcon: true,
          icon: icon,
          pressed: pressed,
        ),
      ],
    ),
  );
}

InkWell audioIcon({required pressed, required icon}) {
  return InkWell(
    onTap: pressed,
    child: Icon(
      icon,
      color: AppColors.whiteColor,
      size: Sizes.ICON_SIZES_30,
    ),
  );
}