import 'package:flutter/material.dart';
import '../../constants/color.dart';

class FormAddRoom extends StatelessWidget {
  // final Function addRoom;

  final idController = TextEditingController();
  final imgUrlController = TextEditingController();
  final nameController = TextEditingController();
  final descController = TextEditingController();

  // FormAddRoom({required this.addRoom, super.key,});
    final enterIdController = idController.text;
    final enterImgUrlController = imgUrlController.text;
    final enterNameController = nameController.text;
    final enterDescController = descController.text;


  submitData() {
    // if((int.parse(enterIdController) != null) &&
    //     (enterImgUrlController.length != null) &&
    //     (enterDescController != null) &&
    //     (enterNameController != null)) {
    //   addRoom(
    //       enterImgUrlController,
    //       enterNameController,
    //       enterDescController
    //   );
    // } else
    //   return;
  }

  addRoom() {
if((int.parse(enterIdController) != null) &&
        (enterImgUrlController.length != null) &&
        (enterDescController != null) &&
        (enterNameController != null)) {
  }

  showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text("Thêm thành công"),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nhập thông tin phòng"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed("/");
          },
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Id phòng"),
              controller: idController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Hình ảnh phòng"),
              controller: imgUrlController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Tên phòng"),
              controller: nameController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Mô tả phòng"),
              controller: descController,
              onSubmitted: (_) => submitData(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: const Text('Thêm phòng'),
                    onPressed: (){
                      showAlert(context);
                      submitData();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

