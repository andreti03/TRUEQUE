import 'package:trueque/Controllers/controller.dart';
import 'package:trueque/Elements/RoundedInput.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trueque/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class AddProducts extends StatefulWidget {
  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final Controller controller = Get.put(Controller());

  final nameController = TextEditingController();

  final priceController = TextEditingController();

  File? imagen;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Producto',
          style: TextStyle(fontSize: 35, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: GetX<Controller>(
        init: controller,
        builder: (Controller widCtrl) {
          return Center(
            child: Column(
              children: [
                Text(widCtrl.name),
                RoundedInput(
                  textController: nameController,
                  hintText: 'Nombre producto',
                  icon: Icons.shopping_basket_outlined,
                  onChanged: (value) {
                    print(nameController);
                  },
                ),
                RoundedInput(
                  textController: priceController,
                  hintText: 'Precio',
                  icon: Icons.price_change,
                  onChanged: (value) {
                    print(priceController);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                // ignore: unnecessary_null_comparison
                imagen == null ? Center() : Image.file(imagen!),
                ElevatedButton(
                  onPressed: () {
                    imagePicker(context, size);
                  },
                  child: Text('Seleccionar Imagen'),
                  style:
                      TextButton.styleFrom(backgroundColor: kPrimaryLigthColor),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future selImagen(op) async {
    var pickedFile;

    if (op == 0) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile);
      } else {
        print('ERROR');
      }
    });
  }

  imagePicker(context, size) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(2),
          content: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    selImagen(1);
                  },
                  child: Container(
                    width: size.width * 0.6,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Elegir imagen',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(
                          Icons.archive_outlined,
                          color: kPrimaryLigthColor,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    selImagen(0);
                  },
                  child: Container(
                    width: size.width * 0.6,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Tomar foto',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(
                          Icons.camera_alt_rounded,
                          color: kPrimaryLigthColor,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red.shade400),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
