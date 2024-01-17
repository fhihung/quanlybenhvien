import 'package:flutter/material.dart';
import 'formAdd_room.dart';
import '../../models/room.dart';
import './room_screen.dart';


class RoomManage extends StatefulWidget {
  const RoomManage({super.key});

  @override
  State<RoomManage> createState() => _RoomManageState();
}

class _RoomManageState extends State<RoomManage> {
  final List<Room> ListRoom = [
      Room(
          id: 1,
          imgUrl: 'assets/images/phong1.jpg',
          name: 'A1-105',
          desc: 'Phòng cấp cứu'
      ),
      Room(
          id: 2,
          imgUrl: 'assets/images/phong2.jpg',
          name: 'A1-105',
          desc: 'Phòng cấp cứu'
      ),
      Room(
          id: 3,
          imgUrl: 'assets/images/phong3.jpg',
          name: 'A1-105',
          desc: 'Phòng cấp cứu'
      ),
      // Room(
      //     id: 4,
      //     imgUrl: 'assets/images/phong4.jpg',
      //     name: 'A1-105',
      //     desc: 'Phòng cấp cứu'
      // ),
      // Room(
      //     id: 5,
      //     imgUrl: 'assets/images/phong4.jpg',
      //     name: 'A1-105',
      //     desc: 'Phòng cấp cứu'
      // ),
    ];


  // Add
  addRoom(int id, String imgUrl, String name, String desc) {
    final newRoom = Room(
      id: id,
      imgUrl: imgUrl,
      name: name,
      desc: desc,
    );
    setState(() {
      ListRoom.add(newRoom);
    });
  }

  // Delete
  deleteRoom(int id) {
    setState(() {
      _showDeleteConfirmationDialog(id);
    });
  }

  Future<void> _showDeleteConfirmationDialog(int id) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button to close dialog.
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bạn có chắc chắn muốn xóa phòng này không?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Xóa'),
              onPressed: () {
                // Perform delete operation here
                _deleteRoom(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Function to delete room
  void _deleteRoom(int id) {
    setState(() {
      ListRoom.removeWhere((rm) => rm.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // FormAddRoom(addRoom),
        TreatmentRoom(
          room: ListRoom,
          onDelete: deleteRoom,
        )
      ],
    );
  }
}
