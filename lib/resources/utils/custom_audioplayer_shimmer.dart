import '../exports/index.dart';

class AudioPlayerShimmer extends StatelessWidget {
  const AudioPlayerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[50]!,
      child: Padding(
        padding: const EdgeInsets.only(
            left: Sizes.PADDING_10, right: Sizes.PADDING_10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildContainer(
                      height: Sizes.HEIGHT_25,
                      width: Sizes.WIDTH_30,
                      radius: 7.0),
                  buildContainer(
                      height: Sizes.HEIGHT_45,
                      width: Sizes.WIDTH_60,
                      radius: 7.0),
                  buildContainer(
                      height: Sizes.HEIGHT_25,
                      width: Sizes.WIDTH_30,
                      radius: 7.0),
                ],
              ),
            ),
            Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: Sizes.PADDING_15, left: Sizes.PADDING_10),
                  child: Column(
                    children: [
                      buildContainer(
                          height: Sizes.HEIGHT_20,
                          width: Sizes.WIDTH_80,
                          radius: 50.0),
                      const SizedBox(
                        height: Sizes.HEIGHT_10,
                      ),
                      buildContainer(
                          height: Sizes.HEIGHT_5,
                          width: Sizes.WIDTH_400,
                          radius: 50.0),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Container buildContainer({required height, required width, required radius}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: AppColors.primaryColor,
      ),
    );
  }
}
