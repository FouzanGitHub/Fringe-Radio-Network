import '../exports/index.dart';

class AudioDetailShimmer extends StatelessWidget {
  const AudioDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[50]!,
      child: Padding(
        padding: const EdgeInsets.all(Sizes.PADDING_8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textButton(),
            const SizedBox(
              height: Sizes.HEIGHT_15,
            ),
            textButton(),
            const SizedBox(
              height: Sizes.HEIGHT_10,
            ),
           const Padding(
              padding:  EdgeInsets.only(
                  left: Sizes.PADDING_10, right: Sizes.PADDING_10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShimmerContainerWidget(
                            height: Sizes.HEIGHT_25,
                            width: Sizes.WIDTH_30,
                            radius: 7.0),
                        ShimmerContainerWidget(
                            height: Sizes.HEIGHT_45,
                            width: Sizes.WIDTH_60,
                            radius: 7.0),
                        ShimmerContainerWidget(
                            height: Sizes.HEIGHT_25,
                            width: Sizes.WIDTH_30,
                            radius: 7.0),
                      ],
                    ),
                  ),
                  Flexible(
                      flex: 2,
                      child: Padding(
                        padding:  EdgeInsets.only(
                            bottom: Sizes.PADDING_15, left: Sizes.PADDING_10),
                        child: Column(
                          children: [
                            ShimmerContainerWidget(
                                height: Sizes.HEIGHT_20,
                                width: Sizes.WIDTH_80,
                                radius: 50.0),
                             SizedBox(
                              height: Sizes.HEIGHT_10,
                            ),
                            ShimmerContainerWidget(
                                height: Sizes.HEIGHT_5,
                                width: Sizes.WIDTH_400,
                                radius: 50.0),
                          ],
                        ),
                      )),
                ],
              ),
            ),
           const Padding(
              padding:  EdgeInsets.only(
                  top: Sizes.PADDING_10,
                  left: Sizes.PADDING_10,
                  right: Sizes.PADDING_6),
              child: ShimmerContainerWidget(
                  height: Sizes.HEIGHT_10,
                  width: Sizes.WIDTH_400,
                  radius: 50.0),
            ),
           const Padding(
              padding:  EdgeInsets.only(
                  top: Sizes.PADDING_10,
                  left: Sizes.PADDING_10,
                  right: Sizes.PADDING_6),
              child: ShimmerContainerWidget(
                  height: Sizes.HEIGHT_10, width: Sizes.WIDTH_80, radius: 50.0),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding:  EdgeInsets.only(
                        top: Sizes.PADDING_10,
                        left: Sizes.PADDING_10,
                        right: Sizes.PADDING_6),
                    child: ShimmerContainerWidget(
                        height: Sizes.HEIGHT_10,
                        width: Sizes.WIDTH_400,
                        radius: 50.0),
                  );
                }),
            const SizedBox(
              height: Sizes.HEIGHT_10,
            ),
           const ShimmerContainerWidget(
                height: Sizes.HEIGHT_2, width: Sizes.WIDTH_450, radius: 50.0),
          ],
        ),
      ),
    );
  }

  // Container buildContainer({required height, required width, required radius}) {
  //   return Container(
  //     height: height,
  //     width: width,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(radius),
  //       color: AppColors.primaryColor,
  //     ),
  //   );
  // }

  Padding textButton() {
    return const  Padding(
      padding:  EdgeInsets.only(
          left: Sizes.PADDING_10, right: Sizes.PADDING_10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShimmerContainerWidget(
              height: Sizes.HEIGHT_15, width: Sizes.WIDTH_150, radius: 7.0),
           ShimmerContainerWidget(
              height: Sizes.HEIGHT_32, width: Sizes.WIDTH_120, radius: 7.0),
          
        ],
      ),
    );
  }
}
