import 'package:flutter/material.dart';

class HelperTheme {
  static const String fontAdvent = 'AdventPro';
  static const String fontSource = 'SourceSansPro';

  static const Color black = Color(0xFF212121);
  static const Color ultraBlack = Color(0xFF0D0D0D);
  static const Color white = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF212121);
  static const Color blue = Color(0XFF007BFF);
  static const Color secondary = Color(0xFF424242);
  static const Color danger = Color(0xFFdc3545);
  static const Color success = Color(0XFF36842A);
  static const Color warning = Color(0XFFFD7E14);
  static const Color info = Color(0XFF34BCD4);
  static const Color gray = Color(0XFFA8A8A8);

  static const Color gray100 = Color(0XFFf4f4f4);
  static const Color gray300 = Color(0XFFe2e2e2);

  static const TextStyle title = TextStyle(
    fontFamily: fontAdvent,
    fontWeight: FontWeight.w700,
    fontSize: 40,
    color: info,
  );

  static const TextStyle subTitle = TextStyle(
    color: white,
    fontFamily: fontSource,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle buttonText = TextStyle(
    fontFamily: fontSource,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    letterSpacing: 0.18,
    color: white,
  );

  static const TextStyle bodyLink = TextStyle(
    color: info,
    fontFamily: fontSource,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyLinkLg = TextStyle(
    color: info,
    fontFamily: fontSource,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle titleAppBar = TextStyle(
    color: white,
    fontFamily: fontSource,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyAppBar = TextStyle(
    color: info,
    fontFamily: fontSource,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle head = TextStyle(
    color: white,
    fontFamily: fontSource,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headBlack = TextStyle(
    color: black,
    fontFamily: fontSource,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headGreen = TextStyle(
    color: success,
    fontFamily: fontSource,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headInfo = TextStyle(
    color: info,
    fontFamily: fontSource,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body = TextStyle(
    color: white,
    fontFamily: fontSource,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyBold = TextStyle(
    color: white,
    fontFamily: fontSource,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyBlack = TextStyle(
    color: black,
    fontFamily: fontSource,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyBlackBold = TextStyle(
    color: black,
    fontFamily: fontSource,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyMini = TextStyle(
    color: white,
    fontFamily: fontSource,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyMiniBold = TextStyle(
    color: white,
    fontFamily: fontSource,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyMiniBlackBold = TextStyle(
    color: black,
    fontFamily: fontSource,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle bodyDetail = TextStyle(
    color: black,
    fontFamily: fontSource,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyDetailBold = TextStyle(
    color: black,
    fontFamily: fontSource,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle bodyDetailInfoBold = TextStyle(
    color: info,
    fontFamily: fontSource,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle bodyLgMenu = TextStyle(
    color: white,
    fontFamily: fontSource,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyMenu = TextStyle(
    color: white,
    fontFamily: fontSource,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyGray = TextStyle(
    color: gray,
    fontFamily: fontSource,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle termBody = TextStyle(
    color: HelperTheme.white,
    fontFamily: HelperTheme.fontSource,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle termTitle = TextStyle(
    color: HelperTheme.white,
    fontFamily: HelperTheme.fontSource,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  InputDecoration textInputDecoration(
      [String hintText = "", bool showIcon = false, IconData? icon]) {
    return InputDecoration(
      hintText: hintText,
      fillColor: white,
      filled: true,
      suffixIcon: showIcon ? Icon(icon) : null,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: danger,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: danger,
          )),
    );
  }

  BoxDecoration buttonBoxDecoration() {
    return BoxDecoration(
      boxShadow: const [
        BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
      ],
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 1.0],
        colors: [
          success,
          secondary,
        ],
      ),
      color: white,
      borderRadius: BorderRadius.circular(10),
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(const Size(50, 50)),
      backgroundColor: MaterialStateProperty.all(success),
    );
  }

  BoxDecoration buttonBoxDecorationMd(Color color) {
    return BoxDecoration(
      boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(1, 2))],
      color: color,
      borderRadius: BorderRadius.circular(10),
    );
  }

  ButtonStyle buttonStyleMd(Color color) {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(const Size(50, 45)),
      backgroundColor: MaterialStateProperty.all(color),
      shadowColor: MaterialStateProperty.all(color),
    );
  }

  ButtonStyle buttonStyleLg(Color color) {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(const Size(50, 60)),
      backgroundColor: MaterialStateProperty.all(color),
      shadowColor: MaterialStateProperty.all(color),
    );
  }
}
