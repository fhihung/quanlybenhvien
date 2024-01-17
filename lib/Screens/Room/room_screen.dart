import 'package:flutter/material.dart';
import '/models/room.dart';
import '/constants/color.dart';

class TreatmentRoom extends StatelessWidget {
  final List<Room> room;
  final Function(int) onDelete;
  const TreatmentRoom({super.key, required this.room, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      color: kBackground,
      child: SingleChildScrollView(
        child: Column(
          children: room.map((rm) {
            return Column(
              children: [
                Container(
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: 130,
                        height: 130,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset(
                            rm.imgUrl.toString(),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            rm.name.toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.purple,
                                              fontWeight: FontWeight.bold,
                                              height: 1.5,
                                            ),
                                          ),
                                          SizedBox(width: 120),
                                          const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: 20,
                                          )
                                        ],
                                      ),
                                      Text(
                                        rm.desc.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  side: BorderSide.none,
                                                ),
                                                child: const Icon(
                                                  Icons.edit_rounded,
                                                  size: 20,
                                                )),
                                            const SizedBox(width: 10),
                                            ElevatedButton(
                                                onPressed: () {
                                                  onDelete(rm.id);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  side: BorderSide.none,
                                                ),
                                                child: const Icon(
                                                  Icons.delete_outline,
                                                  size: 20,
                                                )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
