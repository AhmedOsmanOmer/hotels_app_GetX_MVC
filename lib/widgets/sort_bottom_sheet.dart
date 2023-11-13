// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SortButtomSheet extends StatefulWidget {
  const SortButtomSheet({super.key});

  @override
  _SortButtomSheetState createState() => _SortButtomSheetState();
}

class _SortButtomSheetState extends State<SortButtomSheet> {
  List<String> data = [
    "Our recommendation",
    "Rating & Recommended",
    "Price & Recommended",
    "Distance & Recommended",
    "Rating Only",
    "Price Only",
    "Distance Only"
  ];

  int selectedSortIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          color: Colors.white,
          height: MediaQuery.of(context).size.height - 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Material(
                color: Colors.white,
                shadowColor: const Color.fromARGB(255, 248, 234, 234),
                elevation: 5.0,
                child: ListTile(
                  trailing: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close),
                  ),
                  title: const Text(
                    "Sort By",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  titleTextStyle: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(data[index]),
                      onTap: () {
                        setState(() {
                          selectedSortIndex = index;
                        });
                        //Navigator.pop(context);
                      },
                      trailing: selectedSortIndex == index
                          ? const Icon(Icons.check)
                          : null,
                    );
                  },
                ),
              ),
            ],
          ),
        );
  }
}
