import '../../insight.dart';
import '../../community.dart';
import '../../home/home.dart';
import '../../profile.dart';
import '../../shop.dart';
import '../../theme/theme.dart';

class CommonBnb extends StatelessWidget {
  const CommonBnb({super.key, required this.selectedIndex, this.onTap,});
 final int selectedIndex;
  final void  Function(int)? onTap;

 /* int _selectedIndex = 0;

  static const List<Widget>  widgetList = <Widget>[
    Home(),
    ShopPage(),
    Community(),
    Insight(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }*/
  @override
  Widget build(BuildContext context) {
    return /*Scaffold(
      //  body: widgetList[_selectedIndex],
        bottomNavigationBar:*/ BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon:Icon(Icons.home_rounded),label: "Home",),
        BottomNavigationBarItem(icon:Icon(Icons.shopping_bag_rounded),label: "Shop"),
        BottomNavigationBarItem(icon:Icon(Icons.people_alt_rounded),label: "Community"),
        BottomNavigationBarItem(icon:Icon(Icons.bar_chart_outlined),label: "Insights"),
        BottomNavigationBarItem(icon:Icon(Icons.person_3_outlined),label: "Profile"),

      ],
      selectedItemColor: Color(0xFFB12A1C),
      unselectedItemColor: Color(0XFF898A8D),
      unselectedLabelStyle: TextStyle(color: Color(0XFF898A8D)),
      showUnselectedLabels: true,
      currentIndex: selectedIndex,
      onTap:onTap,
    );
  }
}
