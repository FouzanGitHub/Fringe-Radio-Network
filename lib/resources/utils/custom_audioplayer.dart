import '../exports/index.dart';

class AudioPlayerWidget extends StatelessWidget {
  final dynamic reversePressed;
  final dynamic playPressed;
  final dynamic isPlay;
  final dynamic forwardPressed;
  final dynamic audioSlider;
  const AudioPlayerWidget({super.key,required this.reversePressed,required this.playPressed, required this.isPlay,required  this.forwardPressed,required this.audioSlider});

  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.only(
              left: Sizes.PADDING_10, right: Sizes.PADDING_10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: Sizes.PADDING_10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      audioIcon(
                          pressed: reversePressed,
                          icon: Icons.fast_rewind_rounded),
                      InkWell(
                        onTap: playPressed,
                        child: Container(
                          height: Sizes.HEIGHT_45,
                          width: Sizes.WIDTH_60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: AppColors.whiteColor,
                                  width: Sizes.WIDTH_1)),
                          child: Icon(
                            isPlay ? Icons.pause : Icons.play_arrow,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      audioIcon(
                          pressed: forwardPressed,
                          icon: Icons.fast_forward_rounded)
                    ],
                  ),
                ),
              ),
              Flexible(flex: 2, child: audioSlider),
            ],
          ),
        );
  }
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