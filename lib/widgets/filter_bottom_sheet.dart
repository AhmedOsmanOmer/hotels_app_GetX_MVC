import 'package:flutter/material.dart';
import 'package:hotels_app/widgets/custom_widget.dart';

class FilterBottomSheet {
  double _pricePerNight = 0.5;
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.9,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.zero,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: ListTile(
                          leading: InkWell(
                            onTap: () {
                              setState(() {
                                _pricePerNight = 0;
                              });
                            },
                            child: const Text("Reset",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    decoration: TextDecoration.underline)),
                          ),
                          trailing: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.close)),
                          title: const Text(
                            "Filters",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          titleTextStyle: const TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "PRICE PER NIGHT",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.grey)),
                            child: Text(
                              "${_pricePerNight.toInt().toString()}+ \$",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey[700]!),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: MediaQuery.of(context).size.width * 0.02,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                        ),
                        child: Slider(
                          min: 0,
                          max: 540,
                          value: _pricePerNight,
                          onChanged: (val) {
                            setState(() {
                              _pricePerNight = val;
                            });
                          },
                          thumbColor: Colors.white,
                          activeColor: Colors.blue,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("20\$"), Text("540+\$")],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "RATING",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          showReview("0+", Colors.red, context),
                          showReview("7+", Colors.yellow[700]!, context),
                          showReview("7.5+", Colors.lightGreen, context),
                          showReview("8+", Colors.green, context),
                          showReview("8.5+", Colors.green[700]!, context),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "HOTEL CLASS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          showStars("assets/star.png", 20, context),
                          showStars("assets/2-stars.png", 10, context),
                          showStars("assets/3-stars.png", 10, context),
                          showStars("assets/4-stars.png", 10, context),
                          showStars("assets/5-stars.png", 5, context),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "DISTANCE FROM",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Location"),
                          Text(
                            "City Center >",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Show Results",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ]),
              ),
            );
          },
        );
      },
    );
  }
}
