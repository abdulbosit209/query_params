import 'package:flutter/material.dart';
import 'package:query_params/ui/tabs/countries_ui.dart';
import 'package:query_params/ui/tabs/county_data_ui.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {

  int currentIndex = 0;

  List<Widget> screens = const [
    CountriesUI(),
    CountryDataUI(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          getItem(icon: Icons.home_filled, labelText: "countries"),
          getItem(icon: Icons.bookmark_border_outlined, labelText: "countriesName"),
        ],
      ),
    );
  }

  BottomNavigationBarItem getItem(
      {required IconData icon, required String labelText}) {
    return BottomNavigationBarItem(
        label: labelText,
        icon: Icon(
          icon,
          color: Colors.grey,
        ),
        activeIcon: Icon(
          icon,
          color: Colors.black,
        ));
  }
}
