import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class facts extends StatefulWidget {
  const facts({super.key});
  
  @override
  State<facts> createState() => _factsState();
}

class _factsState extends State<facts> {
  // List<ListTile> cards =[
  //   FirebaseAnimatedList(query: query, itemBuilder: itemBuilder)
  // ]
   List<Container> cards = [
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: CupertinoColors.activeBlue,
      ),
      alignment: Alignment.center,
      child: const Text('1'),

    ),
    Container(
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: CupertinoColors.activeBlue,
      ),
      alignment: Alignment.center,
      child: const Text('1'),
    ),
    Container(
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: CupertinoColors.activeBlue,
      ),
      alignment: Alignment.center,
      child: const Text('1'),
    )
  ];
  final ref = FirebaseDatabase.instance.ref('facts');
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: AppinioSwiper(
            cards: cards
            ),
          ),
        ),
      );
  }
}
