import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool centerTitle;
  final Widget? leading;
  final Widget? titleLeading;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final ValueNotifier<bool>? elevation;
  final Color? backgroundColor;
  final CrossAxisAlignment crossAxisAlignment;

  const PageHeader({
    Key? key,
    this.titleWidget,
    this.titleLeading,
    this.centerTitle = true,
    this.leading,
    this.actions,
    this.bottom,
    this.elevation,
    this.backgroundColor,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.preferredSize = const Size.fromHeight(44),
  }) : super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
        valueListenable: elevation ?? ValueNotifier(false),
        builder: (_, state, __) => AppBar(
          backgroundColor: backgroundColor ?? Colors.white,
          automaticallyImplyLeading: false,
          leading: leading,
          title: titleLeading != null
              ? Row(
                  crossAxisAlignment: crossAxisAlignment,
                  children: <Widget>[
                    titleLeading!,
                    if (titleWidget != null) titleWidget!
                  ],
                )
              : titleWidget,
          centerTitle: centerTitle,
          actions: actions,
          bottom: bottom,
          elevation: state ? 100 : 0,
          toolbarHeight: preferredSize.height,
        ),
      );
}
