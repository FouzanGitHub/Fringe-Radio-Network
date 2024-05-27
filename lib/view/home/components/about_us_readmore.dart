import 'package:fringe_radio_network/dummy/home_about_us.dart';

import '../../../resources/exports/index.dart';

class HomeAboutUsReadMore extends StatelessWidget {
   const HomeAboutUsReadMore({super.key});
 
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar:const AppBarWidget(
      showImage: false,
      ),
      endDrawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SpaceH20(),
            const AboutUsImageBox(isHomeAboutUs: true),
            const SpaceH20(),
            ListView.builder(
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              itemCount: homeAboutUsList.length,
              itemBuilder: (context,index) {
                return  Padding(
                  padding:const EdgeInsets.only(
                      top: Sizes.PADDING_10,bottom: Sizes.PADDING_10,
                      left: Sizes.PADDING_20, right: Sizes.PADDING_20),
                  child: Text(
                    homeAboutUsList[index].title,
                    style: CustomTextTheme.normal16,
                    textAlign: TextAlign.justify,
                  ),
                );
              }
            ),
            
          ],
        ),
      ),
    );
  }
}
