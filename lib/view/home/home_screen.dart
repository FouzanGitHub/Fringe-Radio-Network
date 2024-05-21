import '../../resources/utils/custom_audio_detail.dart';
import '../../resources/exports/index.dart';


class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});
  @override
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
          id: 'Audio',
          builder: (context) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // FutureBuilder(
                        //     future: controller.audioPlayer[0]
                        //         .setUrl( controller.getCurrentPageAudioItems()[0].audioUrl),
                        //     builder: (context, snapshot) {
                        //       if (snapshot.connectionState ==
                        //           ConnectionState.waiting) {
                        //         return const AudioTitleShimmer();
                        //       } else {
                        //         return Column(
                        //           children: [
                             
                        // const  Padding(
                        //   padding:  EdgeInsets.only(
                        //   top: Sizes.PADDING_20,  
                        //   left: Sizes.PADDING_10, right: Sizes.PADDING_10),
                        //   child: Text(
                        //     'Lynz Piper Loomis: Aliens, Shapeshifting and Church - Discovering Truth with Dan Duval',
                        //     style: CustomTextTheme.regular16
                                
                        //   ),
                        // ),
                        //             AudioPlayerWidget(
                        //               reversePressed: () async {
                        //                await controller.seek( 0,
                        //                       controller.audioPlayer[0].position -
                        //                       const Duration(seconds: 10),
                        //                       );
                        //                     },
                        //               playPressed: () {
                        //                   if (controller.isPlaying(0)) {
                        //                     controller.pause(0);
                        //                   } else {
                        //                     controller.play(0);
                        //                   }
                        //                 },
                        //               isPlay:controller.isPlaying(0),
                        //               forwardPressed:() async {
                        //               await controller.seek(0,
                        //                     controller.audioPlayer[0].position +
                        //                     const Duration(seconds: 10));
                        //                     },
                        //               audioSlider: StreamBuilder<Duration?>(
                        //                       stream:
                        //                           controller.durationStream(0),
                        //                       builder: (context, snapshot) {
                        //                         final duration =
                        //                             snapshot.data ?? Duration.zero;
                        //                         return StreamBuilder<Duration?>(
                        //                           stream: controller
                        //                               .positionStream(0),
                        //                           builder: (context, snapshot) {
                        //                             var position = snapshot.data ??
                        //                                 Duration.zero;
                        //                             if (position > duration) {
                        //                               position = duration;
                        //                             }
                        //                             return Padding(
                        //                               padding:
                        //                                   const EdgeInsets.all(8.0),
                        //                               child: Column(
                        //                                 mainAxisAlignment:
                        //                                     MainAxisAlignment.start,
                        //                                 children: [
                        //                                   Text(
                        //                                     '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / ${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
                        //                                     style: CustomTextTheme
                        //                                         .normal16
                        //                                         .copyWith(
                        //                                             color: AppColors
                        //                                                 .textWhite),
                        //                                   ),
                        //                                   Slider(
                        //                                     activeColor: AppColors
                        //                                         .primaryColor,
                        //                                     value: position
                        //                                         .inSeconds
                        //                                         .toDouble(),
                        //                                     onChanged:
                        //                                         (double value) {
                        //                                       controller.seek(
                        //                                           0,
                        //                                           Duration(
                        //                                               seconds: value
                        //                                                   .toInt()));
                        //                                     },
                        //                                     min: 0.0,
                        //                                     max: duration.inSeconds
                        //                                         .toDouble(),
                        //                                   ),
                        //                                 ],
                        //                               ),
                        //                             );
                        //                           },
                        //                         );
                        //                       },
                        //                     ),
                        //             ),
                        //              Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: Sizes.PADDING_10, right: Sizes.PADDING_6),
                        //   child: Text(
                        //     Strings.showList,
                        //     style: CustomTextTheme.regular18
                        //         .copyWith(color: AppColors.primaryColor),
                        //   ),
                        // ),
                        // const Padding(
                        //   padding: EdgeInsets.only(
                        //       top: Sizes.PADDING_10,
                        //       bottom: Sizes.PADDING_10,
                        //       left: Sizes.PADDING_15,
                        //       right: Sizes.PADDING_15),
                        //   child: Text(
                        //     'Current Up-To-The-Minute Show List - So you know it\'s always fresh!',
                        //     style: CustomTextTheme.bold18,
                        //     textAlign: TextAlign.center,
                        //   ),
                        // ),
                        //           ],
                        //         );
                        //       }
                        //     }),
                       
                        const CustomDivider(),
                        const SizedBox(
                          height: Sizes.HEIGHT_10,
                        ),
                        GetBuilder<HomeController>(
                          id: 'Audio',
                          builder: (context) {
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:  controller.getCurrentPageAudioItems().length,
                                itemBuilder: (context, index) {
                                  final isPlaying = controller.isPlaying(index);
                                  final audioItem = controller.getCurrentPageAudioItems()[index];
                            
                                  return AudioWithDetail(
                                            visitPressed: () {},
                                            downloadPressed: () {},
                                            reversePressed: () async {
                                              await controller.seek(
                                                index,
                                                controller.audioPlayer[index].position -const Duration(seconds: 10),
                                              );
                                            },
                                            forwardPressed: () async {
                                              await controller.seek(
                                                  index,
                                                  controller.audioPlayer[index].position +const Duration(seconds: 10));
                                            },
                                            playPressed: () {
                                              if (isPlaying) {
                                                controller.pause(index);
                                              } else {
                                                controller.play(index);
                                              }
                                            },
                                            isPlay: isPlaying,
                                            audioSlider: StreamBuilder<Duration?>(
                                              stream:
                                                  controller.durationStream(index),
                                              builder: (context, snapshot) {
                                                final duration =
                                                    snapshot.data ?? Duration.zero;
                                                return StreamBuilder<Duration?>(
                                                  stream: controller
                                                      .positionStream(index),
                                                  builder: (context, snapshot) {
                                                    var position = snapshot.data ??
                                                        Duration.zero;
                                                    if (position > duration) {
                                                      position = duration;
                                                    }
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / ${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
                                                            style: CustomTextTheme
                                                                .normal16
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .textWhite),
                                                          ),
                                                          Slider(
                                                            activeColor: AppColors
                                                                .primaryColor,
                                                            value: position
                                                                .inSeconds
                                                                .toDouble(),
                                                            onChanged:
                                                                (double value) {
                                                              controller.seek(
                                                                  index,
                                                                  Duration(
                                                                      seconds: value
                                                                          .toInt()));
                                                            },
                                                            min: 0.0,
                                                            max: duration.inSeconds
                                                                .toDouble(),
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
                          }
                        ),
                      ],
                    ),
                  ),
                ),
                NumberPaginatorHome(),
              ],
            );
          }),
    );
  }

}
