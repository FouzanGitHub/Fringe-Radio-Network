import '../../resources/exports/index.dart';

class ChatLiveScreen extends GetView<ChatLiveController> {
  const ChatLiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatLiveController controller = Get.put(ChatLiveController());
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const TopImageBox(),
            Padding(
              padding: const EdgeInsets.only(
              left:Sizes.PADDING_20,top:Sizes.PADDING_15,
              bottom: Sizes.PADDING_15),
              child: Text(
              Strings.enterScreenName,
              style: CustomTextTheme.bold20.copyWith(
              color: AppColors.textBlack
              ),
              ),
            ),
          CustomLineTextField(
          fieldController: controller.nameController,
          hintText: Strings.screenName,
          isBgDark: false,
          validator: (value){},
          onChanged: (value){},
          ),
          Padding(
            padding: const EdgeInsets.only(right:Sizes.PADDING_20,top:Sizes.PADDING_40),
            child: Align(
              alignment: Alignment.topRight,
              child: CustomButton(
              height: Sizes.HEIGHT_40,
              width: Sizes.WIDTH_120,
              title: Strings.enter, 
              isIcon: false,
              isBackgroundDark: false,
              pressed: (){
              Get.toNamed(Routes.chatting);
              },
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}