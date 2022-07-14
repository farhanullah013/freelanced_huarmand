import 'package:flutter/material.dart';

class SideDrawerCustomListTile extends StatelessWidget {
  final Icon leadingIcon;
  final Text title;
  final Icon trailingIcon;
  final Function onTap;
  SideDrawerCustomListTile({
    this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: leadingIcon,
          title: title,
          trailing: trailingIcon,
        ),
        SizedBox(
          height: 10,
          child: Divider(
            color: Colors.grey[300],
            thickness: 0.5,
          ),
        ),
      ],
    );
  }
}
