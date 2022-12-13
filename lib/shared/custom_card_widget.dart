import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String contact;
  bool showDescription = false;

  CustomCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.contact,
  });

  CustomCardWidget.showDescription(
      {super.key,
      required this.title,
      required this.description,
      required this.contact})
      : showDescription = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xFFE5D9D9)),
      padding: EdgeInsets.only(top: 9, bottom: 10, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: showDescription
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          if (showDescription)
            Column(
              children: [
                SizedBox(height: 9),
                Text(
                  description,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          SizedBox(height: 9),
          Text(
            'Contato: $contact',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
