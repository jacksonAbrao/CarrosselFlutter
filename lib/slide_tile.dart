import 'package:flutter/material.dart';

class SlideTitle extends StatelessWidget {
  final String image;
  final bool activePage;

  const SlideTitle({Key? key, required this.image, required this.activePage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double top = activePage ? 50 : 70;
    final double blur = activePage ? 30 : 0;
    final double offset = activePage ? 10 : 0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              blurRadius: blur,
              offset: Offset(offset, offset),
            )
          ]),
    );
  }
}
