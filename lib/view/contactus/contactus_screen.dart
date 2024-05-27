import '../../resources/exports/index.dart';

class ContactUsScreen extends GetView<ContactUsController> {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(showImage: true),
      endDrawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SpaceH20(),
          Text(
            Strings.contactUS,
            style: CustomTextTheme.normal16
                .copyWith(color: AppColors.primaryColor),
          ),
          Text(
            Strings.sendMessage,
            style: CustomTextTheme.bold24.copyWith(color: AppColors.textWhite),
          ),
          Center(
            child: Text(
              Strings.theFringeRadioNetwork,
              style:
                  CustomTextTheme.bold24.copyWith(color: AppColors.textWhite),
            ),
          ),
          const SpaceH20(),
          Container(
            height: Sizes.HEIGHT_400,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImage.contactImage),
                    fit: BoxFit.fill)),
          ),
          CustomLineTextField(
            fieldController: controller.nameController,
            hintText: Strings.yourName,
            isBgDark: true,
            validator: (value) {},
            onChanged: (value) {},
          ),
          const SpaceH15(),
          CustomLineTextField(
            fieldController: controller.emailController,
            hintText: Strings.emailAddress,
            isBgDark: true,
            validator: (value) {},
            onChanged: (value) {},
          ),
          const SpaceH15(),
          CustomLineTextField(
            maxLine: 5,
            fieldController: controller.messageController,
            hintText: Strings.yourMesage,
            isBgDark: true,
            validator: (value) {},
            onChanged: (value) {},
          ),
          const SpaceH30(),
          CustomButton(
              height: Sizes.HEIGHT_45,
              width: Sizes.WIDTH_160,
              title: Strings.submit,
              isIcon: false,
              pressed: (){},
              isBackgroundDark: true,
              ),
        const SpaceH30(),
        ]),
      ),
    );
  }
}
