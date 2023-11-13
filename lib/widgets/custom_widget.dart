import 'package:flutter/material.dart';

Widget showStars(String path, double padding,context) {
  return Container(
    padding: EdgeInsets.all(padding),
    height: MediaQuery.of(context).size.width * 0.15, 
    width: MediaQuery.of(context).size.width * 0.15, 
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.yellow[700]!),
    ),
    child: ImageIcon(
      size: MediaQuery.of(context).size.width * 0.05, 
      color: Colors.yellow[700]!,
      AssetImage(path),
    ),
  );
}

Widget showReview(String review, Color color,context) {
  return Container(
    alignment: Alignment.center,
    height: MediaQuery.of(context).size.width * 0.15,
    width: MediaQuery.of(context).size.width * 0.15, 
    padding: EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width * 0.025, 
      vertical: MediaQuery.of(context).size.width * 0.025, 
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: color,
    ),
    child: Text(
      review,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
