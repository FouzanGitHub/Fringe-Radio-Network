import '../../resources/exports/index.dart';

class IronShowScreen extends StatelessWidget {
   IronShowScreen({super.key});
final  IronShowController controller = Get.put(IronShowController());
final  IronShowAudioDetailController ironDetailController = Get.put(IronShowAudioDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const AppBarWidget(showImage: true),
      body:SingleChildScrollView(
        child: Column(
        children: [
          TopSingleAudio(),
          TopAudioListIron(),
          const SpaceH10(),
          NumberPaginatorIron(), 
          const SpaceH4(),  
          const CustomDivider(),
          const SpaceH10(),
          AudioDetailIron(),
           
          NumberPaginatorIronDetail(),
          const SpaceH10(),
        ],
        ),
      ) 
    );
  }
}
