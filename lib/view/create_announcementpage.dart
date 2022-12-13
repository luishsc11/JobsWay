import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pijobsway/data/api.dart';
import 'package:pijobsway/shared/customimput_widget.dart';

class CreateAnnouncementPage extends StatelessWidget {
  final api = Api();
  final form1 = TextEditingController();
  final form2 = TextEditingController();
  final form3 = TextEditingController();

  CreateAnnouncementPage({super.key});

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
          CustomInputWidget(
              title: "Para o que está contratando:", controller: form1),
          SizedBox(height: 40),
          CustomInputWidget(title: "Descrição da vaga:", controller: form2),
          SizedBox(height: 40),
          CustomInputWidget(
              title: "Telefone ou e-mail para contato:", controller: form3),
          SizedBox(height: 150),
          CupertinoButton(
            color: Colors.blue,
            child: Text('ENVIAR'),
            onPressed: () async {
              await api
                  .postAnnouncements(
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
