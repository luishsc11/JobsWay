import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pijobsway/data/api2.dart';

import 'package:pijobsway/shared/customimput_widget2.dart';

class CreateAnnouncementPage2 extends StatelessWidget {
  final api = Api2();
  final form1 = TextEditingController();
  final form2 = TextEditingController();
  final form3 = TextEditingController();

  CreateAnnouncementPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('JW - CADASTRO', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          CustomInputWidget2(
              title: "Que tipo de serviço busca:", controller: form1),
          SizedBox(height: 40),
          CustomInputWidget2(
              title: "Descrição do serviço que busca:", controller: form2),
          SizedBox(height: 40),
          CustomInputWidget2(
              title: "Telefone ou e-mail para contato:", controller: form3),
          SizedBox(height: 150),
          CupertinoButton(
            color: Colors.blue,
            child: Text('ENVIAR'),
            onPressed: () async {
              await api
                  .postAnnouncements2(
                      titulo: form1.text,
                      contato: form3.text,
                      descricao: form2.text)
                  .whenComplete(() => Navigator.pop(context));
            },
          ),
        ]),
      ),
    );
  }
}
