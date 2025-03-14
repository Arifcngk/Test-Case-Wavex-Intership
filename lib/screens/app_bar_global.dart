import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  const GlobalAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      actions: actions,
      leading: leading,
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: Theme.of(context).appBarTheme.iconTheme,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
