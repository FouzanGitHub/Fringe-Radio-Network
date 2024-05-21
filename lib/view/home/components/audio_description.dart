// import '../../../resources/exports/index.dart';


// class AudioDescription extends StatelessWidget {
//   final dynamic visitPressed;
//   final dynamic downloadPressed;
//   final dynamic forwardPressed;
//   final dynamic reversePressed;
//   final dynamic playPressed;
//   final dynamic isPlay;
//   final dynamic audioSlider;
//   final dynamic title;
//   final dynamic description;
//   AudioDescription(
//       {super.key,
//       this.visitPressed,
//       this.downloadPressed,
//       this.forwardPressed,
//       this.reversePressed,
//       this.playPressed,
//       this.isPlay,
//       this.audioSlider,
//       this.title,
//       this.description});
//   final HomeController controller = HomeController();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         textButton(
//             title: Strings.epPageFor,
//             buttonTitle: Strings.visitNow,
//             icon: Icons.arrow_outward_rounded,
//             pressed: visitPressed),
//         const SizedBox(
//           height: Sizes.HEIGHT_15,
//         ),
//         textButton(
//             title: Strings.directLink,
//             buttonTitle: Strings.download,
//             icon: Icons.file_download_outlined,
//             pressed: downloadPressed),
//        AudioPlayerWidget(
//        reversePressed: reversePressed,
//       playPressed: playPressed, 
//       isPlay: isPlay, 
//       forwardPressed: forwardPressed, 
//       audioSlider: audioSlider,
//       ),
//         Padding(
//           padding: const EdgeInsets.only(
//               left: Sizes.PADDING_10, right: Sizes.PADDING_6),
//           child: Text(
            
//             title,
//             style: CustomTextTheme.regular14,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(
//               left: Sizes.PADDING_10, right: Sizes.PADDING_6),
//           child: Text(
//             Strings.epNotes,
//             style: CustomTextTheme.regular16
//                 .copyWith(color: AppColors.primaryColor),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(
//               left: Sizes.PADDING_10, right: Sizes.PADDING_6),
//           child: Text(description,
             
//               style: CustomTextTheme.normal14),
//         ),
//         const SizedBox(
//           height: Sizes.HEIGHT_10,
//         ),
//         const CustomDivider(),
//         const SizedBox(
//           height: Sizes.HEIGHT_10,
//         )
//       ],
//     );
//   }
// }

// Widget textButton(
//     {required title, required buttonTitle, required icon, required pressed}) {
//   return Padding(
//     padding:
//         const EdgeInsets.only(left: Sizes.PADDING_10, right: Sizes.PADDING_10),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: CustomTextTheme.normal18,
//         ),
//         const SizedBox(
//           width: Sizes.WIDTH_12,
//         ),
//         CustomButton(
//           title: buttonTitle,
//           isIcon: true,
//           icon: icon,
//           pressed: pressed,
//         ),
//       ],
//     ),
//   );
// }

// InkWell audioIcon({required pressed, required icon}) {
//   return InkWell(
//     onTap: pressed,
//     child: Icon(
//       icon,
//       color: AppColors.whiteColor,
//       size: Sizes.ICON_SIZES_30,
//     ),
//   );
// }
//  ListView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount:
//                                 controller.getCurrentPageAudioItems().length,
//                             itemBuilder: (context, index) {
//                               final isPlaying = controller.isPlaying(index);
//                               final audioItem =
//                                   controller.getCurrentPageAudioItems()[index];

//                               return FutureBuilder(
//                                   future: controller.audioPlayer[index]
//                                       .setUrl(audioItem.audioUrl),
//                                   builder: (context, snapshot) {
//                                     if (snapshot.connectionState ==
//                                         ConnectionState.waiting) {
//                                       return const AudioListShimmer();
//                                     } else {
//                                       return AudioDescription(
//                                         visitPressed: () {},
//                                         downloadPressed: () {},
//                                         reversePressed: () async {
//                                           await controller.seek(
//                                             index,
//                                             controller.audioPlayer[index]
//                                                     .position -
//                                                 const Duration(seconds: 10),
//                                           );
//                                         },
//                                         forwardPressed: () async {
//                                           await controller.seek(
//                                               index,
//                                               controller.audioPlayer[index]
//                                                       .position +
//                                                   const Duration(seconds: 10));
//                                         },
//                                         playPressed: () {
//                                           if (isPlaying) {
//                                             controller.pause(index);
//                                           } else {
//                                             controller.play(index);
//                                           }
//                                         },
//                                         isPlay: isPlaying,
//                                         audioSlider: StreamBuilder<Duration?>(
//                                           stream:
//                                               controller.durationStream(index),
//                                           builder: (context, snapshot) {
//                                             final duration =
//                                                 snapshot.data ?? Duration.zero;
//                                             return StreamBuilder<Duration?>(
//                                               stream: controller
//                                                   .positionStream(index),
//                                               builder: (context, snapshot) {
//                                                 var position = snapshot.data ??
//                                                     Duration.zero;
//                                                 if (position > duration) {
//                                                   position = duration;
//                                                 }
//                                                 return Padding(
//                                                   padding:
//                                                       const EdgeInsets.all(8.0),
//                                                   child: Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment.start,
//                                                     children: [
//                                                       Text(
//                                                         '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / ${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
//                                                         style: CustomTextTheme
//                                                             .normal16
//                                                             .copyWith(
//                                                                 color: AppColors
//                                                                     .textWhite),
//                                                       ),
//                                                       Slider(
//                                                         activeColor: AppColors
//                                                             .primaryColor,
//                                                         value: position
//                                                             .inSeconds
//                                                             .toDouble(),
//                                                         onChanged:
//                                                             (double value) {
//                                                           controller.seek(
//                                                               index,
//                                                               Duration(
//                                                                   seconds: value
//                                                                       .toInt()));
//                                                         },
//                                                         min: 0.0,
//                                                         max: duration.inSeconds
//                                                             .toDouble(),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 );
//                                               },
//                                             );
//                                           },
//                                         ),
//                                         title: audioItem.title,
//                                         description: audioItem.description,
//                                       );
//                                       Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           textButton(
//                                               title: Strings.epPageFor,
//                                               buttonTitle: Strings.visitNow,
//                                               icon: Icons.arrow_outward_rounded,
//                                               pressed: () {}),
//                                           const SizedBox(
//                                             height: Sizes.HEIGHT_15,
//                                           ),
//                                           textButton(
//                                               title: Strings.directLink,
//                                               buttonTitle: Strings.download,
//                                               icon:
//                                                   Icons.file_download_outlined,
//                                               pressed: () {}),
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                                 left: Sizes.PADDING_10,
//                                                 right: Sizes.PADDING_10),
//                                             child: Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.end,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Flexible(
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             bottom: Sizes
//                                                                 .PADDING_10),
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         audioIcon(index,
//                                                             pressed: () async {
//                                                           await controller.seek(
//                                                             index,
//                                                             controller
//                                                                     .audioPlayer[
//                                                                         index]
//                                                                     .position -
//                                                                 const Duration(
//                                                                     seconds:
//                                                                         10),
//                                                           );
//                                                         },
//                                                             icon: Icons
//                                                                 .fast_rewind_rounded),
//                                                         InkWell(
//                                                           onTap: () async {
//                                                             if (isPlaying) {
//                                                               controller
//                                                                   .pause(index);
//                                                             } else {
//                                                               controller
//                                                                   .play(index);
//                                                             }
//                                                           },
//                                                           child: Container(
//                                                             height:
//                                                                 Sizes.HEIGHT_45,
//                                                             width:
//                                                                 Sizes.WIDTH_60,
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             7),
//                                                                 border: Border.all(
//                                                                     color: AppColors
//                                                                         .whiteColor,
//                                                                     width: Sizes
//                                                                         .WIDTH_1)),
//                                                             child: Icon(
//                                                               isPlaying
//                                                                   ? Icons.pause
//                                                                   : Icons
//                                                                       .play_arrow,
//                                                               color: AppColors
//                                                                   .whiteColor,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         audioIcon(index,
//                                                             pressed: () async {
//                                                           await controller.seek(
//                                                               index,
//                                                               controller
//                                                                       .audioPlayer[
//                                                                           index]
//                                                                       .position +
//                                                                   const Duration(
//                                                                       seconds:
//                                                                           10));
//                                                         },
//                                                             icon: Icons
//                                                                 .fast_forward_rounded)
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Flexible(
//                                                   flex: 2,
//                                                   child:
//                                                       StreamBuilder<Duration?>(
//                                                     stream: controller
//                                                         .durationStream(index),
//                                                     builder:
//                                                         (context, snapshot) {
//                                                       final duration =
//                                                           snapshot.data ??
//                                                               Duration.zero;
//                                                       return StreamBuilder<
//                                                           Duration?>(
//                                                         stream: controller
//                                                             .positionStream(
//                                                                 index),
//                                                         builder: (context,
//                                                             snapshot) {
//                                                           var position =
//                                                               snapshot.data ??
//                                                                   Duration.zero;
//                                                           if (position >
//                                                               duration) {
//                                                             position = duration;
//                                                           }
//                                                           return Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                     .all(8.0),
//                                                             child: Column(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Text(
//                                                                   '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / ${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
//                                                                   style: CustomTextTheme
//                                                                       .normal16
//                                                                       .copyWith(
//                                                                           color:
//                                                                               AppColors.textWhite),
//                                                                 ),
//                                                                 Slider(
//                                                                   activeColor:
//                                                                       AppColors
//                                                                           .primaryColor,
//                                                                   value: position
//                                                                       .inSeconds
//                                                                       .toDouble(),
//                                                                   onChanged:
//                                                                       (double
//                                                                           value) {
//                                                                     controller.seek(
//                                                                         index,
//                                                                         Duration(
//                                                                             seconds:
//                                                                                 value.toInt()));
//                                                                   },
//                                                                   min: 0.0,
//                                                                   max: duration
//                                                                       .inSeconds
//                                                                       .toDouble(),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           );
//                                                         },
//                                                       );
//                                                     },
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                                 left: Sizes.PADDING_10,
//                                                 right: Sizes.PADDING_6),
//                                             child: Text(
//                                               // 'Lynz Piper Loomis: Aliens, Shapeshifting and Church - Discovering Truth with Dan Duval',
//                                               audioItem.title,
//                                               style: CustomTextTheme.regular14,
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                                 left: Sizes.PADDING_10,
//                                                 right: Sizes.PADDING_6),
//                                             child: Text(
//                                               Strings.epNotes,
//                                               style: CustomTextTheme.regular16
//                                                   .copyWith(
//                                                       color: AppColors
//                                                           .primaryColor),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                                 left: Sizes.PADDING_10,
//                                                 right: Sizes.PADDING_6),
//                                             child: Text(
//                                                 controller.audioItems[index]
//                                                     .description,
//                                                 // 'This episode of Lindsay Piper Loomis podcast features guest Dan Duval discussing topics related to aliens, UFOs, and the spiritual realm. Dan shares his nuanced perspective on aliens and argues that the subject is complex rather than simplistic.  They discuss personal supernatural experiences and the reality of spiritual attacks. Dan connects biblical scriptures like Genesis 6 to modern concepts like genetic engineering and hybridization efforts by governments, military operations, and cult groups.',
//                                                 style:
//                                                     CustomTextTheme.normal14),
//                                           ),
//                                           const SizedBox(
//                                             height: Sizes.HEIGHT_10,
//                                           ),
//                                           const CustomDivider(),
//                                           const SizedBox(
//                                             height: Sizes.HEIGHT_10,
//                                           )
//                                         ],
//                                       );
//                                     }
//                                   });
//                             }),