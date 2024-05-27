import '../../../resources/exports/index.dart';

class TopAudioListIron extends StatelessWidget {
 TopAudioListIron({super.key});
  final IronShowController controller = Get.put(IronShowController());
  @override
  Widget build(BuildContext context) {
    return      GetBuilder<IronShowController>(
                  id: "Audio",
                  builder: (context) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics:const NeverScrollableScrollPhysics(),
                      itemCount:  controller.getCurrentPageAudioItems().length-1,
                      itemBuilder: (context,index) {
                         final ironAudioItem = controller.getCurrentPageAudioItems()[index +1];
                        return StreamBuilder<Duration?>(
                              stream: controller.durationStream(index+1),
                              builder: (context, snapshot) {
                                final duration = snapshot.data ?? Duration.zero;
                                return StreamBuilder<Duration?>(
                                  stream: controller.positionStream(index+1),
                                  builder: (context, snapshot) {
                                    var position = snapshot.data ?? Duration.zero;
                                    if (position > duration) {
                                      position = duration;
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Padding(
                            padding:  EdgeInsets.only(left:Sizes.PADDING_15,right:Sizes.PADDING_15),
                            child: Text(ironAudioItem.title,
                            style: CustomTextTheme.normal16,
                            ),
                          ),
                           InkWell(
                                          onTap: () {
                                if (controller.isPlaying(index+1)) {
                                  controller.pause(index+1);
                                } else {
                                  controller.play(index+1);
                                }
                              },
                                          child: Container(
                                            height: Sizes.HEIGHT_45,
                                            width: Sizes.WIDTH_60,
                                            decoration: BoxDecoration(
                                            color:controller.isPlaying(index+1) 
                                            ? AppColors.primaryColor
                                            : AppColors.secondaryColor, 
                                                borderRadius: BorderRadius.circular(7),
                                                border: Border.all(
                                                    color: AppColors.primaryColor,
                                                    width: Sizes.WIDTH_1)),
                                            child: Icon(
                                              controller.isPlaying(index+1) ? Icons.pause : Icons.play_arrow,
                                              color: AppColors.whiteColor,
                                            ),
                                          ),
                                        ),
                          ],
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
                                           Text(
                                            '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / ${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
                                            style: CustomTextTheme.normal14
                                                .copyWith(color: AppColors.textWhite),
                                          ),
                                       const CustomDivider(),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                      }
                    );
                  }
                );
  }
}