import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      leading: FlutterFlowIconButton(
        borderColor: Colors.transparent,
        borderRadius: 30,
        borderWidth: 1,
        buttonSize: 60,
        icon: const Icon(
          CupertinoIcons.chevron_back,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () async {
          Navigator.of(context).pop();
        },
      ),
      centerTitle: false,
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
