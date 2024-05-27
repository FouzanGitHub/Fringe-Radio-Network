import '../exports/index.dart';

class CustomChatField extends StatelessWidget {
  final dynamic fieldController;
  final dynamic hintText;
  final dynamic validator;
  final dynamic onChanged;
  final dynamic iconPressed;
  
  const CustomChatField({super.key, this.fieldController, this.hintText, this.validator, this.onChanged, this.iconPressed});

  @override
  Widget build(BuildContext context) {
    return    Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
            decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
              color: AppColors.grey.withOpacity(0.3),
              blurRadius: 3,
              spreadRadius: 3,
              offset:const Offset(0, 3),
              )
            ]
            ),
            child: TextFormField(
            controller: fieldController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
            
            fillColor: AppColors.whiteColor,
            filled: true,
            hintText: Strings.typeHere,
            hintStyle: CustomTextTheme.normal14.copyWith(
            color: AppColors.textGrey
            ),
            enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide:const BorderSide(
            color: AppColors.whiteColor
            )
            ),
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide:const BorderSide(
            color: AppColors.whiteColor
            )
            ),
          
            suffixIcon:Bounce(
              duration:const Duration(milliseconds: 100),
              onPressed: iconPressed,
              child: Padding(
                padding: const EdgeInsets.only(right:10),
                child: Container(
                         
                decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondaryColor,
                boxShadow: [
                  BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset:const Offset(0, 3),
                  color: AppColors.grey.withOpacity(0.5)
                  )
                ]
                ),
                child:Transform.rotate(
                  angle: 30.5,
                  child: const Icon(Icons.send,
                  color: AppColors.primaryColor,
                  size: Sizes.ICON_SIZES_18,
                  ),
                ),
                ),
              ),
            ),
            ),
            ),
          ),
        );
  }
}