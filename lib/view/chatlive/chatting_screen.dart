import '../../resources/exports/index.dart';



class ChattingScreen extends GetView<ChatLiveController> {
   ChattingScreen({super.key});
final DashboardController dashboardController = DashboardController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:const AppBarWidget(
      showImage: false,
      ),
      endDrawer: MyDrawer(),
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       const SpaceH10(),
        const TopImageBox(), 
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(left:Sizes.PADDING_35,right: Sizes.PADDING_25),
          child: Text(
            'John ${Strings.userJoinChat}',
            style: CustomTextTheme.bold18.copyWith(
            color: AppColors.primaryColor
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        CustomChatField(
        hintText: Strings.typeHere,
        fieldController: controller.chatController,
        iconPressed: (){},
        validator: (value){},
        onChanged: (value){},
        ),
        ],
      ),
    );
  }
}
