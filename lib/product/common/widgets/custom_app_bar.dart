import 'dart:ui';

import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar.page({
    required final String title,
    super.key,
    final bool centerTitle = false,
    final Widget? actions,
  }) : super(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: CustomPageAppBar(
                title: title,
                centerTitle: centerTitle,
                actions: actions,
              ),
            ),
          ),
        );
}

class CustomPageAppBar extends StatelessWidget {
  const CustomPageAppBar({
    required this.title,
    super.key,
    this.centerTitle = false,
    this.actions,
  });

  final String title;
  final bool centerTitle;
  final Widget? actions;

  @override
  Widget build(final BuildContext context) => AppBar(
        toolbarHeight: kToolbarHeight,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(title, maxLines: 2),
        actions: [actions ?? const SizedBox.shrink()],
      );
}
