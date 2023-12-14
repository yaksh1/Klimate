import 'package:flutter/material.dart';
import 'package:klimate/models/city.dart';
import 'package:klimate/utils/color_string.dart';
import 'package:klimate/utils/image_strings.dart';
import 'package:klimate/utils/route_strings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<City> cities =
        City.citiesList.where((city) => city.isDefault == false).toList();
    List<City> selectedCities = City.getSelectedCities();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, weatherPageRoute, (route) => false);
          },
          backgroundColor: AppColors.secondaryColor,
          child: Icon(Icons.pin_drop),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: size.height * 0.08,
            width: size.width,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              border: cities[index].isSelected == true
                  ? Border.all(color: AppColors.secondaryColor!, width: 2)
                  : Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cities[index].isSelected = !cities[index].isSelected;
                    });
                  },
                  child: Image.asset(
                      cities[index].isSelected == true
                          ? ImageStrings.checkedBox
                          : ImageStrings.uncheckedBox,
                      width: 25),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  cities[index].city,
                  style: TextStyle(
                    fontSize: 16,
                    color: cities[index].isSelected == true
                        ? AppColors.secondaryColor
                        : Colors.black87,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
