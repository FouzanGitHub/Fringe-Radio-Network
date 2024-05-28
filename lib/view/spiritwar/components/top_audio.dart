import '../../../resources/exports/index.dart';

class TopAudioSpirt extends StatelessWidget {
  TopAudioSpirt({super.key});
  final SpiritWarController controller = Get.put(SpiritWarController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
              top: Sizes.PADDING_20,
              left: Sizes.PADDING_10,
              right: Sizes.PADDING_10),
          child: Text(
              'Lynz Piper Loomis: Aliens, Shapeshifting and Church - Discovering Truth with Dan Duval',
              style: CustomTextTheme.regular16),
        ),
        GetBuilder<SpiritWarController>(
          id: "SpiritAudio",
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
        Padding(
          padding: const EdgeInsets.only(
              left: Sizes.PADDING_10, right: Sizes.PADDING_6),
          child: Text(
            Strings.showList,
            style: CustomTextTheme.regular18
                .copyWith(color: AppColors.primaryColor),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
              top: Sizes.PADDING_10,
              bottom: Sizes.PADDING_10,
              left: Sizes.PADDING_15,
              right: Sizes.PADDING_15),
          child: Text(
            'Current Up-To-The-Minute Show List - So you know it\'s always fresh!',
            style: CustomTextTheme.bold18,
            textAlign: TextAlign.center,
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}
