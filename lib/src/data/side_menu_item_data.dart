import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/utils/constants.dart';

/// Signature for the `builder` function provide which provide solution to
/// use as badge child
/// is responsible for returning a widget which is to be rendered.
typedef SideMenuItemBadgeBuilder = Widget? Function(Widget tile);
typedef SideMenuItemTooltipBuilder = Widget? Function(Widget tile);

abstract class SideMenuItemData {
  const SideMenuItemData();
}

class SideMenuItemDataTile extends SideMenuItemData {
  const SideMenuItemDataTile({
    required this.isSelected,
    required this.onTap,
    this.icon,
    this.title,
    this.titleStyle,
    this.selectedTitleStyle,
    this.trailing,
    this.selectedTrailing,
    this.tooltip,
    this.tooltipBuilder,
    this.hasSelectedLine = true,
    this.selectedLineSize = const Size(
      Constants.itemSelectedLineWidth,
      Constants.itemSelectedLineHeight,
    ),
    this.itemHeight = Constants.itemHeight,
    this.margin = Constants.itemMargin,
    this.borderRadius,
    this.selectedIcon,
    this.highlightSelectedColor,
    this.hoverColor,
    this.badgeBuilder,
    this.decoration,
    this.shape,
    this.clipBehavior = Clip.hardEdge,
  })  : assert(itemHeight >= 0.0),
        assert(icon != null || title != null),
        assert((highlightSelectedColor == null && decoration == null) ||
            (highlightSelectedColor != null
                ? decoration == null
                : decoration != null
                    ? highlightSelectedColor == null
                    : true)),
        super();

  final bool isSelected, hasSelectedLine;
  final void Function() onTap;
  final Size selectedLineSize;
  final String? title;
  final TextStyle? titleStyle;
  final TextStyle? selectedTitleStyle;
  final String? tooltip;
  final SideMenuItemTooltipBuilder? tooltipBuilder;
  final SideMenuItemBadgeBuilder? badgeBuilder;
  final Widget? trailing;
  final Widget? selectedTrailing;
  final Widget? icon;
  final Widget? selectedIcon;
  final double itemHeight;
  final EdgeInsetsDirectional margin;
  final BorderRadiusGeometry? borderRadius;
  final Color? hoverColor, highlightSelectedColor;
  final Decoration? decoration;
  final ShapeBorder? shape;
  final Clip clipBehavior;

  SideMenuItemDataTile resolveWith({
    final SideMenuItemTileDefaults? g,
  }) {
    return SideMenuItemDataTile(
      titleStyle: titleStyle ?? g?.titleStyle,
      selectedTitleStyle: selectedTitleStyle ?? g?.selectedTitleStyle,
      borderRadius: borderRadius ?? g?.borderRadius,
      highlightSelectedColor:
          highlightSelectedColor ?? g?.highlightSelectedColor,
      hoverColor: hoverColor ?? g?.hoverColor,
      decoration:
          decoration ?? (isSelected ? g?.selectedDecoration : g?.decoration),
      shape: shape ?? g?.shape,
      hasSelectedLine: hasSelectedLine,
      selectedLineSize: selectedLineSize,
      itemHeight: itemHeight,
      margin: margin,
      clipBehavior: clipBehavior,
      isSelected: isSelected,
      onTap: onTap,
      icon: icon,
      title: title,
      trailing: trailing,
      badgeBuilder: badgeBuilder,
      selectedIcon: selectedIcon,
      tooltipBuilder: tooltipBuilder,
      tooltip: tooltip,
    );
  }
}

class SideMenuItemTileDefaults {
  const SideMenuItemTileDefaults({
    this.titleStyle,
    this.selectedTitleStyle,
    this.borderRadius,
    this.highlightSelectedColor,
    this.hoverColor,
    this.decoration,
    this.selectedDecoration,
    this.shape,
  });

  final TextStyle? titleStyle;
  final TextStyle? selectedTitleStyle;
  final BorderRadiusGeometry? borderRadius;
  final Color? highlightSelectedColor;
  final Color? hoverColor;
  final Decoration? decoration;
  final Decoration? selectedDecoration;
  final ShapeBorder? shape;
}

class SideMenuItemDataTitle extends SideMenuItemData {
  const SideMenuItemDataTitle({
    required this.title,
    this.titleStyle,
    this.textAlign,
    this.padding = Constants.itemMargin,
  }) : super();

  final String title;
  final TextStyle? titleStyle;
  final TextAlign? textAlign;
  final EdgeInsetsDirectional padding;
}

class SideMenuItemDataDivider extends SideMenuItemData {
  const SideMenuItemDataDivider({
    required this.divider,
    this.padding = Constants.itemMargin,
  }) : super();

  final Widget divider;
  final EdgeInsetsDirectional padding;
}
