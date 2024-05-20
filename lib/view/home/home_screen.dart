import 'package:just_audio/just_audio.dart';
import 'package:number_paginator/number_paginator.dart';
import '../../resources/exports/index.dart';
import '../../resources/utils/custom_divider.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});
  @override
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final AudioPlayer audioPlayer = AudioPlayer();
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
                        const Padding(
                          padding: EdgeInsets.only(top: Sizes.PADDING_20,
                              left: Sizes.PADDING_10, right: Sizes.PADDING_6),
                          child: Text(
                            'Lynz Piper Loomis: Aliens, Shapeshifting and Church - Discovering Truth with Dan Duval',
                            style: CustomTextTheme.regular14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: Sizes.PADDING_10, right: Sizes.PADDING_10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: Sizes.PADDING_10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                              borderRadius:
                                                  BorderRadius.circular(7),
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
                                    final duration =
                                        snapshot.data ?? Duration.zero;
                                    return StreamBuilder<Duration?>(
                                      stream: controller.positionStream(0),
                                      builder: (context, snapshot) {
                                        var position =
                                            snapshot.data ?? Duration.zero;
                                        if (position > duration) {
                                          position = duration;
                                        }
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / ${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
                                                style: CustomTextTheme.normal16
                                                    .copyWith(
                                                        color:
                                                            AppColors.textWhite),
                                              ),
                                              Slider(
                                                activeColor:
                                                    AppColors.primaryColor,
                                                value:
                                                    position.inSeconds.toDouble(),
                                                onChanged: (double value) {
                                                  controller.seek(
                                                      0,
                                                      Duration(
                                                          seconds:
                                                              value.toInt()));
                                                },
                                                min: 0.0,
                                                max:
                                                    duration.inSeconds.toDouble(),
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
                        ),
                         Padding(
                          padding: const EdgeInsets.only(
                              left: Sizes.PADDING_10, right: Sizes.PADDING_6),
                          child: Text(
                            Strings.showList,
                            style: CustomTextTheme.regular18.copyWith(
                            color: AppColors.primaryColor
                            ),
                          ),
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(top: Sizes.PADDING_10,bottom: Sizes.PADDING_10,
                              left: Sizes.PADDING_15, right: Sizes.PADDING_15),
                          child: Text(
                            'Current Up-To-The-Minute Show List - So you know it\'s always fresh!',
                            style: CustomTextTheme.bold18,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      const  CustomDivider(),
                      const SizedBox(height: Sizes.HEIGHT_10,)
,                        ListView.builder(
                            shrinkWrap: true,
                            physics:const NeverScrollableScrollPhysics(),
                            itemCount:
                                controller.getCurrentPageAudioUrls().length - 1,
                            itemBuilder: (context, index) {
                              final isPlaying = controller.isPlaying(index);
                              final audioUrl =
                                  controller.getCurrentPageAudioUrls()[index];
                        
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textButton(
                                      title: Strings.epPageFor,
                                      buttonTitle: Strings.visitNow,
                                      icon: Icons.arrow_outward_rounded,
                                      pressed: () {}),
                                  const SizedBox(
                                    height: Sizes.HEIGHT_15,
                                  ),
                                  textButton(
                                      title: Strings.directLink,
                                      buttonTitle: Strings.download,
                                      icon: Icons.file_download_outlined,
                                      pressed: () {}),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: Sizes.PADDING_10,
                                        right: Sizes.PADDING_10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: Sizes.PADDING_10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                audioIcon(index,
                                                    pressed: () async {
                                                  await controller.seek(
                                                    index,
                                                    controller
                                                            .audioPlayer[index]
                                                            .position -
                                                        const Duration(
                                                            seconds: 10),
                                                  );
                                                },
                                                    icon: Icons
                                                        .fast_rewind_rounded),
                                                InkWell(
                                                  onTap: () async {
                                                    if (isPlaying) {
                                                      controller.pause(index);
                                                    } else {
                                                      controller.play(index);
                                                    }
                                                  },
                                                  child: Container(
                                                    height: Sizes.HEIGHT_45,
                                                    width: Sizes.WIDTH_60,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                        border: Border.all(
                                                            color: AppColors
                                                                .whiteColor,
                                                            width:
                                                                Sizes.WIDTH_1)),
                                                    child: Icon(
                                                      isPlaying
                                                          ? Icons.pause
                                                          : Icons.play_arrow,
                                                      color:
                                                          AppColors.whiteColor,
                                                    ),
                                                  ),
                                                ),
                                                audioIcon(index,
                                                    pressed: () async {
                                                  await controller.seek(
                                                      index,
                                                      controller
                                                              .audioPlayer[
                                                                  index]
                                                              .position +
                                                          const Duration(
                                                              seconds: 10));
                                                },
                                                    icon: Icons
                                                        .fast_forward_rounded)
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: StreamBuilder<Duration?>(
                                            stream: controller
                                                .durationStream(index),
                                            builder: (context, snapshot) {
                                              final duration = snapshot.data ??
                                                  Duration.zero;
                                              return StreamBuilder<Duration?>(
                                                stream: controller
                                                    .positionStream(index),
                                                builder: (context, snapshot) {
                                                  var position =
                                                      snapshot.data ??
                                                          Duration.zero;
                                                  if (position > duration) {
                                                    position = duration;
                                                  }
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                          max: duration
                                                              .inSeconds
                                                              .toDouble(),
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
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: Sizes.PADDING_10,
                                        right: Sizes.PADDING_6),
                                    child: Text(
                                      'Lynz Piper Loomis: Aliens, Shapeshifting and Church - Discovering Truth with Dan Duval',
                                      style: CustomTextTheme.regular14,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: Sizes.PADDING_10,
                                        right: Sizes.PADDING_6),
                                    child: Text(
                                      Strings.epNotes,
                                      style: CustomTextTheme.regular16.copyWith(
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: Sizes.PADDING_10,
                                        right: Sizes.PADDING_6),
                                    child: Text(
                                        'This episode of Lindsay Piper Loomis podcast features guest Dan Duval discussing topics related to aliens, UFOs, and the spiritual realm. Dan shares his nuanced perspective on aliens and argues that the subject is complex rather than simplistic.  They discuss personal supernatural experiences and the reality of spiritual attacks. Dan connects biblical scriptures like Genesis 6 to modern concepts like genetic engineering and hybridization efforts by governments, military operations, and cult groups.',
                                        style: CustomTextTheme.normal14),
                                  ),
                                   const SizedBox(height: Sizes.HEIGHT_10,),
                                  const  CustomDivider(),
                                 const SizedBox(height: Sizes.HEIGHT_10,)
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: GetBuilder<HomeController>(
                    id: 'Audio',
                    builder: (context) {
                      final totalPages = (controller.audioUrls.length /
                              controller.itemsPerPage)
                          .ceil();
                      return NumberPaginator(
                        initialPage: 0,
                        onPageChange: (int index) {
                          controller.setCurrentPage(index);
                        },
                        numberPages: totalPages,
                        config: NumberPaginatorUIConfig(
                          // default height is 48
                          height: 64,

                          buttonShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: const BorderSide(
                                  color: AppColors.whiteColor, width: 1)),
                          buttonSelectedForegroundColor: AppColors.textWhite,
                          buttonUnselectedForegroundColor: AppColors.textWhite,
                          buttonUnselectedBackgroundColor:
                              AppColors.secondaryColor,
                          buttonSelectedBackgroundColor: AppColors.primaryColor,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget textButton(
      {required title, required buttonTitle, required icon, required pressed}) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Sizes.PADDING_10, right: Sizes.PADDING_10),
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
