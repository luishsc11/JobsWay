import 'package:flutter/material.dart';

class CustomInputWidget2 extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  CustomInputWidget2(
      {super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFE5D9D9)),
          padding: EdgeInsets.only(top: 9, bottom: 10, left: 10, right: 10),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
