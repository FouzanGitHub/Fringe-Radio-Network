import '../exports/index.dart';

class CustomLineTextField extends StatelessWidget {
  final dynamic fieldController;
  final dynamic isBgDark;
  final String hintText;
  final dynamic maxLine;
  final dynamic validator;
  final dynamic onChanged;
  
  const CustomLineTextField({super.key, 
  required this.fieldController,
  required this.isBgDark,
  required this.hintText, 
   this.maxLine,
  this.validator, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        style: TextStyle(
        color: isBgDark
        ?AppColors.textWhite
        :AppColors.textBlack
        ),
        maxLines: maxLine,
        controller: fieldController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            
            hintText: hintText,
            hintStyle:
                CustomTextTheme.normal14.copyWith(color: AppColors.textGrey),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondaryColor)),
            errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.errorColor))),
        validator: validator,
        onChanged: onChanged
      ),
    );
  }
}
