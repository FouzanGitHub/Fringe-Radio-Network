import 'package:fringe_radio_network/resources/exports/index.dart';
import '../../../resources/utils/custom_audio_detail.dart';

class AudioDetailListSpirit extends StatelessWidget {
   AudioDetailListSpirit({super.key});
final SpiritWarController controller = Get.put(SpiritWarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpiritWarController>(
        id: 'SpiritAudio',
        builder: (context) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.getCurrentPageAudioItems().length - 1,
              itemBuilder: (context, index) {
                final isPlaying = controller.isPlaying(index + 1);
                final audioItem =
                    controller.getCurrentPageAudioItems()[index + 1];

                return AudioWithDetail(
                  visitPressed: () async {
                    print('abc');
                    await controller.launchUrlWeb();
                  },
                  downloadPressed: () {},
                  reversePressed: () async {
                    await controller.seek(
                      index + 1,
                      controller.audioPlayer[index + 1].position -
                          const Duration(seconds: 10),
                    );
                  },
                  forwardPressed: () async {
                    await controller.seek(
                        index + 1,
                        controller.audioPlayer[index + 1].position +
                            const Duration(seconds: 10));
                  },
                  playPressed: () {
                    if (isPlaying) {
                      controller.pause(index + 1);
                    } else {
                      controller.play(index + 1);
                    }
                  },
                  isPlay: isPlaying,
                  audioSlider: StreamBuilder<Duration?>(
                    stream: controller.durationStream(index + 1),
                    builder: (context, snapshot) {
                      final duration = snapshot.data ?? Duration.zero;
                      return StreamBuilder<Duration?>(
                        stream: controller.positionStream(index + 1),
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
                                    controller.seek(index + 1,
                                        Duration(seconds: value.toInt()));
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
                  title: audioItem.title,
                  description: audioItem.description,
                );
              });
        });
  }
}
