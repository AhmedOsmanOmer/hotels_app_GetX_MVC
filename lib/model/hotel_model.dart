// ignore_for_file: non_constant_identifier_names

class HotelModel {
  final String image;
  final String name;
  final String currency;
  final String address;
  final String price;
  final String review;
  final String review_score;
  final int starts;
  

  HotelModel({
    required this.image,
    required this.address,
    required this.currency, 
    required this.name, 
    required this.price, 
    required this.review, 
    required this.review_score,
    required this.starts,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      image: json['image'],
      address:json['address'],
      currency: json['currency'],
      name: json['name'],
      price: json['price'].toString(),
      review: json['review'],
      review_score: json['review_score'].toString(),
      starts: json['starts'],
    );
  }
}
