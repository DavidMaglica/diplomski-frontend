import 'package:flutter/material.dart';

class ListDivider extends StatelessWidget {
  const ListDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
      child: Divider(
        indent: 36,
        endIndent: 36,
        height: 1,
        thickness: 1.5,
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}
