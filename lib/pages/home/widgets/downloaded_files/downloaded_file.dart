import 'package:flutter/material.dart';

import '../../../../size_config.dart';

class DownloadedFile extends StatefulWidget {
  final Color? selectedColor;
  final Widget title;
  final Color? textColor;
  final Widget? description;
  final void Function()? ontap, onLongPress;
  final Widget leading;
  final IconButton? trailing;

  const DownloadedFile({
    Key? key,
    required this.title,
    this.description,
    this.ontap,
    this.onLongPress,
    required this.leading,
    this.selectedColor,
    this.textColor,
    this.trailing,
  }) : super(key: key);

  @override
  _DownloadedFileState createState() => _DownloadedFileState();
}

class _DownloadedFileState extends State<DownloadedFile> {
  // static const duration = Duration(milliseconds: 300);
  @override
  Widget build(BuildContext context) {
    final Widget child = Container(
      // color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.width(2),
        vertical: Responsive.height(0.6),
      ),
      child: Row(
        children: <Widget>[
          widget.leading,
          _Item(
            description: widget.description,
            title: widget.title,
            titleColor: widget.textColor,
          ),
          widget.trailing ?? const SizedBox.shrink(),
        ],
      ),
    );

    return InkWell(
      onTap: widget.ontap,
      onLongPress: widget.onLongPress,
      child: child,
    );
  }
}

class _Item extends StatelessWidget {
  final Widget? description;
  final Widget title;
  final Color? titleColor;
  const _Item({this.description, required this.title, this.titleColor});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: Responsive.width(4.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title,
            SizedBox(height: Responsive.height(0.5)),
            if (description != null) description!,
          ],
        ),
      ),
    );
  }
}