import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpos/theme.dart';
import 'package:unicons/unicons.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPress,
      this.endIcon = true,
      this.textcolor})
      : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 15.0,
      ),
      onTap: onPress,
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: primaryBlue.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          size: 24,
          color: primaryBlue,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: textcolor,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: textGrey.withOpacity(0.1),
              ),
              child: Icon(
                UniconsLine.angle_right,
                color: textGrey,
                size: 20,
              ),
            )
          : null,
    );
  }
}
