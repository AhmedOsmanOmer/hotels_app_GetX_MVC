import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotels_app/controllers/home_controller.dart';
import 'package:hotels_app/widgets/floating_button.dart';
import 'package:hotels_app/widgets/hotel_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop, 
      backgroundColor: const Color.fromARGB(255, 235, 231, 231),
      body: Column(
        children: [
         
          const SizedBox(height: 50),
          Expanded(
            child: FutureBuilder(
              future: controller.getData(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                      child: Text("There is no available data"));
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return HotelInformationWidget(
                        hotelData: snapshot.data![index],
                      );
                    }),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
          
        ],
      ),
    );
  }
}
