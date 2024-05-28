
import '../../../resources/exports/index.dart';

class TopSingleAudio extends StatelessWidget {
   TopSingleAudio({super.key});
final IronShowController controller = Get.put(IronShowController());
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const Padding(
            padding:  EdgeInsets.only(top:Sizes.HEIGHT_10,left: Sizes.PADDING_40),
            child: Text('IRON FIVE SHOW',
            style: CustomTextTheme.normal18,
            ),
          ),
          GetBuilder<IronShowController>(
            id: 'Audio',
            builder: (context) {
              return AudioPlayerWidget(
                reversePressed: () async {
                 final newPosition = controller.audioPlayer[0].position - const Duration(seconds: 10);
                 await controller.seek(0, newPosition < Duration.zero ? Duration.zero : newPosition);
                },
                playPressed: () {
                  if (controller.isPlaying(0)) {
                    controller.pause(0);
                  } else {
                    controller.play(0);
                  }
                },
                isPlay: controller.isPlaying(0),
                forwardPressed: () async {
                  await controller.seek(
                      0,
                      controller.audioPlayer[0].position +
                          const Duration(seconds: 10));
                },
                audioSlider: StreamBuilder<Duration?>(
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
              );
            }
          ),
         const SpaceH20(),
         const  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '156 ${Strings.episode}',
                style: CustomTextTheme.bold18,
              ),
              SpaceW4(),
              Text(
                '(308 Hours, 27 Minutes)',
                style: CustomTextTheme.normal18,
              ),
            ],
          ),
          const CustomDivider()
         
        ],
      );
  }
}