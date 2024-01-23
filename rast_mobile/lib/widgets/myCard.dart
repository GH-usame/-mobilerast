import 'package:flutter/material.dart';
//import 'package:rast_mobile/screens/taskDetailsScreen.dart';
import '../consts.dart';
import '../model/model.dart';

myCard(int cardIndex, String type) {
  return InkWell(
    splashColor: Colors.blue, // Tıklama rengi
    child: Card(
      elevation: 5,
      color: Color(getTaskColor(cardIndex, type)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: myHeight / 2.25,
        height: myHeight / 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              // title
              getTaskTitle(cardIndex, type),
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Euclid Circular A',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: myHeight / 14,
              child: Text(
                // desc,
                getTaskdesc(cardIndex, type),
                style: const TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Euclid Circular A',
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            // const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  SizedBox(
                    width: myWidth / 15,
                    height: myHeight / 30,
                    child: Image.asset(
                      "images/Ellipse1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: myWidth / 15,
                    height: myHeight / 30,
                    child: Image.asset(
                      "images/Ellipse4.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_month),
                  Text(
                    // date,
                    getTaskDate(cardIndex, type),
                    // '6 Feb.',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Euclid Circular A',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ]),
          ],
        ),
      ),
    ),
  );
}
