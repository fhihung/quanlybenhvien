import 'package:flutter/material.dart';
import './constants/color.dart';
import 'Screens/Room/formAdd_room.dart';
import 'Screens/Room/room_manage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quan ly benh vien',
      home: MyHomePage(),

      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const MyHomePage(),
      //   '/formAdd_room': (context) => FormAddRoom(),
      // },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const IconTitleWidget(),
          backgroundColor: kPrimaryColor,
        ),
        body: const SingleChildScrollView(child: RoomManage()),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 4.0,
          icon: const Icon(Icons.add),
          label: const Text('Thêm phòng'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FormAddRoom()));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.email),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}

class IconTitleWidget extends StatelessWidget {
  const IconTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.local_hospital, size: 30),
        SizedBox(
          width: 5,
        ),
        Text(
          "Quản Lý bệnh viện",
        )
      ],
    );
  }
}
