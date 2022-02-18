import 'package:first_exam/core/components/size_config.dart';
import 'package:first_exam/data/user_info.dart';
import 'package:flutter/material.dart';

class SliverListItem {
  static sliverListItem(context, index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/add_to_order',
            arguments: UserInfo.data[index]);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getH(30), vertical: getH(10)),
        height: getH(380),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(getH(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: getH(250),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getH(10)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(UserInfo.data[index]['image']),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: getH(16)),
                  child: Text(
                    UserInfo.data[index]['text'],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getH(25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "\$\$ • Chinese • American • Deshi food",
              style: TextStyle(
                color: Colors.grey,
                fontSize: getH(20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: getH(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "4.3",
                      style: TextStyle(fontSize: getH(18)),
                    ),
                    Icon(
                      Icons.star,
                      size: getH(20),
                    ),
                    Text("200+ Ratings", style: TextStyle(fontSize: getH(21))),
                    Icon(
                      Icons.watch_later,
                      size: getH(20),
                    ),
                    Text("25 min", style: TextStyle(fontSize: getH(18))),
                    Icon(
                      Icons.paid,
                      size: getH(21),
                    ),
                    Text("• Free", style: TextStyle(fontSize: getH(18))),
                    SizedBox(
                      width: getW(30),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
