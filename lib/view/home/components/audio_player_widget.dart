// import '../../../resources/exports/index.dart';
// import '../../../resources/utils/custom_audio_detail.dart';

// class AudioPlayerWidget2 extends StatelessWidget {
//   final int index;

//   const AudioPlayerWidget2({Key? key, required this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final HomeController controller = Get.find<HomeController>();
//     final isPlaying = controller.isPlaying(index);
//     final audioItem = controller.getCurrentPageAudioItems()[index];

//     return GetBuilder<HomeController>(
//       id: 'PlayAudio',
//       builder: (context) {
//         return AudioWithDetail(
//           visitPressed: () {},
//           downloadPressed: () {},
//           reversePressed: () async {
//             await controller.seek(
//               index,
//               controller.audioPlayer[index].position - const Duration(seconds: 10),
//             );
//           },
//           forwardPressed: () async {
//             await controller.seek(
//               index,
//               controller.audioPlayer[index].position + const Duration(seconds: 10),
//             );
//           },
//           playPressed: () {
//             if (isPlaying) {
//               controller.pause(index);
//             } else {
//               controller.play(index);
//             }
//           },
//           isPlay: isPlaying,
//           audioSlider: StreamBuilder<Duration?>(
//             stream: controller.durationStream(index),
//             builder: (context, snapshot) {
//               final duration = snapshot.data ?? Duration.zero;
//               return StreamBuilder<Duration?>(
//                 stream: controller.positionStream(index),
//                 builder: (context, snapshot) {
//                   var position = snapshot.data ?? Duration.zero;
//                   if (position > duration) {
//                     position = duration;
//                   }
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / ${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
//                           style: CustomTextTheme.normal16.copyWith(
//                             color: AppColors.textWhite,
//                           ),
//                         ),
//                         Slider(
//                           activeColor: AppColors.primaryColor,
//                           value: position.inSeconds.toDouble(),
//                           onChanged: (double value) {
//                             controller.seek(index, Duration(seconds: value.toInt()));
//                           },
//                           min: 0.0,
//                           max: duration.inSeconds.toDouble(),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//           title: audioItem.title,
//           description: audioItem.description,
//         );
//       }
//     );
//   }
// }