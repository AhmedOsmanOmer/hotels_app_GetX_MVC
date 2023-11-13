import 'package:flutter/material.dart';
import 'package:hotels_app/widgets/filter_bottom_sheet.dart';
import 'package:hotels_app/widgets/sort_bottom_sheet.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3))
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MaterialButton(
              onPressed: () {
                FilterBottomSheet sort = FilterBottomSheet();
                sort.showBottomSheet(context);
              },
              child: const Row(children: [
                ImageIcon(AssetImage("assets/filter.png"),
                    color: Colors.blue, size: 40),
                Text(
                  "Filter",
                  style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                )
              ])),
          MaterialButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return const SortButtomSheet();
                  },
                );
              },
              child: const Row(children: [
                ImageIcon(AssetImage("assets/sort.png"),
                    color: Colors.blue, size: 40),
                Text("Sort",
                    style: TextStyle(fontSize: 20, color: Colors.lightBlue))
              ]))
        ],
      ),
    );
  }
}
