
import 'package:pet_app/ui/profile.dart';
import 'package:pet_app/ui/shop.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/widget/common_bnb.dart';
import 'package:pet_app/ui/insight.dart';
import 'package:pet_app/ui/community.dart';
import 'home1.dart';


class Bnb extends StatefulWidget {
  const Bnb({super.key,});


  @override
  State<Bnb> createState() => _BnbState();
}

class _BnbState extends State<Bnb> {
  int _selectedIndex = 0;

  late final  List<Widget>  widgetList = <Widget>[
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
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: widgetList[_selectedIndex],
        bottomNavigationBar: CommonBnb(selectedIndex: _selectedIndex,onTap: _onItemTapped,));
  }
}
