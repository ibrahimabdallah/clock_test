import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.text,
    required this.iconPath,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String iconPath;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: MaterialButton(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        onPressed: () {},
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Image.asset(
              iconPath,
              scale: 1.5,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(text,
                style:const TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: 'Avenir')),
          ],
        ),
      ),
    );
  }
}
