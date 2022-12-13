import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pijobsway/shared/custom_card_widget2.dart';
import 'package:share_plus/share_plus.dart';

class AnnouncementDetailsPage2 extends StatelessWidget {
  final String title;
  final String contact;
  final String description;

  AnnouncementDetailsPage2({
    super.key,
    required this.title,
    required this.contact,
    required this.description,
  });

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
        title: Text('JW - DETALHES', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          CustomCardWidget2.showDescription(
            title: title,
            contact: contact,
            description: description,
          ),
          SizedBox(
            height: 105,
          ),
          CupertinoButton(
            color: Colors.blue,
            child: Text('COMPARTILHAR'),
            onPressed: () async {
              await Share.share('PROCURO VAGA DE SERVIÇO, VEJA EM JOBSWAY.\n\n'
                      'VAGA: $title \n\n' +
                  'DESCRIÇÃO: $description \n\n' +
                  'CONTATO: $contact \n\n');
            },
          )
        ]),
      ),
    );
  }
}
