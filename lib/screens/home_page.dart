import 'package:first_exam/core/components/size_config.dart';
import 'package:first_exam/core/constants/const.dart';
import 'package:first_exam/data/user_info.dart';
import 'package:first_exam/widgets/listview_builder_item.dart';
import 'package:first_exam/widgets/listviewitem.dart';
import 'package:first_exam/widgets/mytext_widget.dart';
import 'package:first_exam/widgets/sliver_list_item.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _dropDownMenuValue = "San Francisco";
  int _bottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: getH(44)),
                    child: Center(
                      child: MyText(
                        text: "DELIVERY TO",
                        size: getW(16),
                        color: ColorConst.kPrimaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: getW(107)),
                          child: _myDropDown(),
                        ),
                        MyText(
                          text: "Filter",
                          size: 14.0,
                          color: ColorConst.kBlack,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return SliverListItem.sliverListItem(context, index);
                },
                childCount: 3,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(getH(30)),
                child: Row(
                  children: [
                    MyText(
                      text: "Type of Foods",
                      size: getH(27),
                      fontWeight: WeightConst.kBoldWeight,
                    ),
                    const Spacer(),
                    MyText(
                      text: "See all",
                      size: getH(20),
                      color: ColorConst.kTextSecondaryColor,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: getH(15)),
                height: getH(180),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ListViewBuilderItem.listViewBuilderItem(index);
                    }),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(getH(30)),
                child: Row(
                  children: [
                    Text(
                      "New Restaurants",
                      style: TextStyle(
                        fontSize: getH(27),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "See all",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: getH(20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: getH(15)),
                height: getH(272),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ListViewItem.listViewItem(index);
                    }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: Colors.green),
        selectedLabelStyle: const TextStyle(color: Colors.green),
        selectedItemColor: Colors.green,
        currentIndex: _bottomBarIndex,
        items: Datas.bottomBarItems
            .map(
              (e) => BottomNavigationBarItem(
                icon: e['icon'],
                label: e['label'],
              ),
            )
            .toList(),
        onTap: (int index) {
          _bottomBarIndex = index;
          setState(() {});
        },
      ),
    );
  }

  _myDropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: _dropDownMenuValue,
        items: Datas.forDropDown
            .map((e) => DropdownMenuItem(
                  child: MyText(
                      text: e,
                      size: getW(22),
                      fontWeight: WeightConst.kBoldWeight),
                  value: e,
                ))
            .toList(),
        onChanged: (newValue) {
          setState(() {
            _dropDownMenuValue = newValue.toString();
          });
        },
      ),
    );
  }
}
