import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:lumainar/core/constants/colors.dart';
import 'package:lumainar/core/theme/app_text_style.dart';
import 'package:lumainar/repository/drop_down_helper/models/common_dropdown_model.dart';

class CommonModelDropDownButton extends StatefulWidget {
  final String hint;
  final double width1ratio;
  final CommonDropDownModel? value;
  final List<CommonDropDownModel> dropdownItems;
  final ValueChanged<CommonDropDownModel?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;
  final hintStyle;
  final TextStyle? dropdownItemTextStyle;

  const CommonModelDropDownButton({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    required this.width1ratio,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    this.hintStyle,
    this.dropdownItemTextStyle,
    Key? key,
  }) : super(key: key);

  @override
  State<CommonModelDropDownButton> createState() =>
      _CommonModelDropDownButtonState();
}

class _CommonModelDropDownButtonState extends State<CommonModelDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<CommonDropDownModel>(
        //To avoid long text overflowing.
        isExpanded: true,
        hint: Container(
          alignment: widget.hintAlignment,
          child: Text(
            widget.hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: widget.hintStyle ??
                AppStyle.plusJakartaSans.copyWith(
                    fontSize: 14,
                    color: ColorConstant.mainBlack.withOpacity(0.5)),
          ),
        ),
        value: widget.value,
        items: widget.dropdownItems
            .map((item) => DropdownMenuItem<CommonDropDownModel>(
                  value: item,
                  child: Container(
                    color: Colors.transparent,
                    alignment: widget.valueAlignment,
                    child: Text(
                      item.text!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: widget.dropdownItemTextStyle ??
                          AppStyle.plusJakartaSans.copyWith(
                              fontSize: 14,
                              color: ColorConstant.mainBlack,
                              fontWeight: FontWeight.w700),
                    ),
                  ),
                ))
            .toList(),
        onChanged: widget.onChanged,
        selectedItemBuilder: widget.selectedItemBuilder,
        icon: widget.icon ?? const Icon(Icons.arrow_forward_ios_outlined),
        iconSize: widget.iconSize ?? 12,
        iconEnabledColor: widget.iconEnabledColor,
        iconDisabledColor: widget.iconDisabledColor,
        buttonHeight: widget.buttonHeight,
        buttonWidth: widget.buttonWidth ?? 140,
        buttonPadding:
            widget.buttonPadding ?? const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: widget.buttonDecoration ??
            BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8 * widget.width1ratio),
            ),
        buttonElevation: widget.buttonElevation,
        itemHeight: widget.itemHeight ?? 40,
        itemPadding:
            widget.itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
        //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
        dropdownMaxHeight: widget.dropdownHeight ?? 200,
        dropdownWidth: widget.dropdownWidth ?? 140,
        dropdownPadding: widget.dropdownPadding,
        dropdownDecoration: widget.dropdownDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(10 * widget.width1ratio),
            ),
        dropdownElevation: widget.dropdownElevation ?? 8,
        scrollbarRadius: widget.scrollbarRadius ?? const Radius.circular(40),
        scrollbarThickness: widget.scrollbarThickness,
        scrollbarAlwaysShow: widget.scrollbarAlwaysShow,
        //Null or Offset(0, 0) will open just under the button. You can edit as you want.
        offset: widget.offset,
        dropdownOverButton: false, //Default is false to show menu below button
      ),
    );
  }
}
