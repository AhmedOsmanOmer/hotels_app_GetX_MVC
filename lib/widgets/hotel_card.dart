// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotels_app/model/hotel_model.dart';
class HotelInformationWidget extends StatefulWidget {
  final HotelModel hotelData;

  const HotelInformationWidget({
    super.key,
    required this.hotelData,
  });

  @override
  _HotelInformationWidgetState createState() => _HotelInformationWidgetState();
}

class _HotelInformationWidgetState extends State<HotelInformationWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(        
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  image: DecorationImage(
                    filterQuality: FilterQuality.high,
                    image: NetworkImage(widget.hotelData.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RatingBar(
                          itemSize: 20,
                          ignoreGestures: true,
                          initialRating: widget.hotelData.starts.toDouble(),
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: Icon(
                              Icons.star,
                              color: Colors.grey[700],
                            ),
                            half: const Icon(Icons.star_half),
                            empty: const Icon(Icons.star_border),
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        const Text(
                          "Hotel",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    Text(
                      widget.hotelData.name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green[900]),
                          child: Text(widget.hotelData.review_score,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        const SizedBox(width: 4.0),
                        Text(widget.hotelData.review),
                        const Icon(Icons.location_on_outlined),
                        Text(widget.hotelData.address)
                      ],
                    ),
                    const SizedBox(height: 6.0),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromARGB(255, 191, 216, 228)),
                            child: const Text(
                              "Our Lowest Price",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${widget.hotelData.price}",
                                style:  TextStyle(
                                    fontSize: 30,
                                    color: Colors.green[700]!,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                 //FlutterT
                                },
                                child: const Text(
                                  "View Deal >",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          const Text("Renaissance")
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "More Prices",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 40,
          left: MediaQuery.of(context).size.width - 60,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
