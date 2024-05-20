import '../../../resources/exports/index.dart';

class AudioWidget extends StatelessWidget {
  AudioWidget({super.key});
  final HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'Audio',
      builder: (context) {
        return Padding(
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
                      audioIcon(0, pressed: () async {
                        await controller.seek(
                          0,
                          controller.audioPlayer[0].position -
                              const Duration(seconds: 10),
                        );
                      }, icon: Icons.fast_rewind_rounded),
                      InkWell(
                        onTap: () async {
                          if (controller.isPlaying(0)) {
                            controller.pause(0);
                          } else {
                            controller.play(0);
                          }
                        },
                        child: Container(
                          height: Sizes.HEIGHT_45,
                          width: Sizes.WIDTH_60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: AppColors.whiteColor,
                                  width: Sizes.WIDTH_1)),
                          child: Icon(
                            controller.isPlaying(0)
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      audioIcon(01, pressed: () async {
                        await controller.seek(
                            0,
                            controller.audioPlayer[0].position +
                                const Duration(seconds: 10));
                      }, icon: Icons.fast_forward_rounded)
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: StreamBuilder<Duration?>(
                  stream: controller.durationStream(0),
                  builder: (context, snapshot) {
                    final duration = snapshot.data ?? Duration.zero;
                    return StreamBuilder<Duration?>(
                      stream: controller.positionStream(0),
                      builder: (context, snapshot) {
                        var position = snapshot.data ?? Duration.zero;
                        if (position > duration) {
                          position = duration;
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / ${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
                                style: CustomTextTheme.normal16
                                    .copyWith(color: AppColors.textWhite),
                              ),
                              Slider(
                                activeColor: AppColors.primaryColor,
                                value: position.inSeconds.toDouble(),
                                onChanged: (double value) {
                                  controller.seek(
                                      0, Duration(seconds: value.toInt()));
                                },
                                min: 0.0,
                                max: duration.inSeconds.toDouble(),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
    InkWell audioIcon(int index, {required pressed, required icon}) {
    return InkWell(
      onTap: pressed,
      child: Icon(
        icon,
        color: AppColors.whiteColor,
        size: Sizes.ICON_SIZES_30,
      ),
    );
  }
}
