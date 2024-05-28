import '../../../resources/exports/index.dart';
import '../../../resources/utils/custom_audio_detail.dart';

class AudioDetailIron extends StatelessWidget {
  AudioDetailIron({super.key});
  final IronShowAudioDetailController ironDetailController =
      Get.put(IronShowAudioDetailController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              bottom: Sizes.PADDING_30,
              left: Sizes.PADDING_15,
              right: Sizes.PADDING_15),
          child: Text(
            'Current Up-To-The-Minute Show List - So you know it\'s always fresh!',
            style: CustomTextTheme.bold18,
            textAlign: TextAlign.center,
          ),
        ),
        
        GetBuilder<IronShowAudioDetailController>(
            id: 'AudioDetail',
            builder: (context) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      ironDetailController.getCurrentPageAudioItems().length,
                  itemBuilder: (context, index) {
                    final isPlaying = ironDetailController.isPlaying(index);
                    final audioDetailItem =
                        ironDetailController.getCurrentPageAudioItems()[index];

                    return AudioWithDetail(
                      visitPressed: () async {
                        print('abc');
                        await ironDetailController.launchUrlWeb();
                      },
                      downloadPressed: () {
                          FileDownloader.downloadFile(
                          url:audioDetailItem.audioUrl,
                          name: "Audio", 

                    onDownloadCompleted: (String path) {
                      // print('FILE DOWNLOADED TO PATH: $path');
                     const CustomSnackBar(
                     title: Strings.downloadComplete,
                     message: Strings.fileDownload,
                     ).showSnackBar();
                    },
                    onDownloadError: (String error) {
                      // print('DOWNLOAD ERROR: $error');
                    }
                    );
                      },
                      reversePressed: () async {
                        final newPosition = ironDetailController.audioPlayer[index + 1].position - const Duration(seconds: 10);
                    await ironDetailController.seek(index + 1, newPosition < Duration.zero ? Duration.zero : newPosition);
                      },
                      forwardPressed: () async {
                        await ironDetailController.seek(
                            index,
                            ironDetailController.audioPlayer[index].position +
                                const Duration(seconds: 10));
                      },
                      playPressed: () {
                        if (isPlaying) {
                          ironDetailController.pause(index);
                        } else {
                          ironDetailController.play(index);
                        }
                      },
                      isPlay: isPlaying,
                      audioSlider: StreamBuilder<Duration?>(
                        stream: ironDetailController.durationStream(index),
                        builder: (context, snapshot) {
                          final duration = snapshot.data ?? Duration.zero;
                          return StreamBuilder<Duration?>(
                            stream: ironDetailController.positionStream(index),
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
                                        ironDetailController.seek(index,
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
                      title: audioDetailItem.title,
                      description: audioDetailItem.description,
                    );
                  });
            }),
      ],
    );
  }
}
