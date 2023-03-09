import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class facts extends StatefulWidget {
  const facts({super.key});

  @override
  State<facts> createState() => _factsState();
}

class _factsState extends State<facts> {
  List<ListView> cards = [];

  final ref = FirebaseDatabase.instance.ref('facts');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
              ],
            ),
          ),
          Flexible(
            child: FirebaseAnimatedList(
              defaultChild: Text('Loading...'),
                query: ref,
                itemBuilder: ((context, snapshot, animation, index) {
                  return Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Card(
                      color: Colors.blue,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Image.network(
                              snapshot.child('image').value.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                child: Center(
                                    child: Text(
                                  snapshot.child('text').value.toString(),
                                  textAlign : TextAlign.center,
                                  overflow: TextOverflow.fade,
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                )),
                              ))
                        ],
                      ),
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }

  void readData() async {
    final event = await ref.once(DatabaseEventType.value);
    print('Data : ${event.snapshot.value}');
  }
}
