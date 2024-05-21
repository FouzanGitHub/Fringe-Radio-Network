
import '../exports/index.dart';

class AudioTitleShimmer extends StatelessWidget {
  const AudioTitleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
          baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[50]!,
      child: const Padding(
        padding:  EdgeInsets.all(Sizes.PADDING_10),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Sizes.HEIGHT_10,),
            ShimmerContainerWidget(height: Sizes.HEIGHT_8, width: Sizes.WIDTH_400, radius: 50.0),
            SizedBox(height: Sizes.HEIGHT_5,),
            ShimmerContainerWidget(height: Sizes.HEIGHT_8, width: Sizes.WIDTH_100, radius: 50.0),
            SizedBox(
              height: Sizes.HEIGHT_10,
            ),
            AudioPlayerShimmer(),
              Center(child: ShimmerContainerWidget(height: Sizes.HEIGHT_10, width: Sizes.WIDTH_40, radius: 15.0)),
             Padding(
              padding: EdgeInsets.only(
                  top: Sizes.PADDING_10,
                  bottom: Sizes.PADDING_10,
                  left: Sizes.PADDING_15,
                  right: Sizes.PADDING_15),
              child: ShimmerContainerWidget(height: Sizes.HEIGHT_8, width: Sizes.WIDTH_400, radius: 15.0),
            ),
             Center(child: ShimmerContainerWidget(height: Sizes.HEIGHT_8, width: Sizes.WIDTH_80, radius: 15.0)),
          ],
        ),
      ),
    );
  }
}
