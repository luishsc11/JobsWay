import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pijobsway/data/api2.dart';
import 'package:pijobsway/view/announcement_detailspage2.dart';
import 'package:pijobsway/view/create_announcementpage2.dart';
import 'package:pijobsway/view/home_page.dart';

import '../shared/custom_card_widget.dart';

class HomePage2 extends StatefulWidget {
  HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePageState2();
}

class _HomePageState2 extends State<HomePage2> {
  final api = Api2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:
              Text('JW - BUSCA PESSOAL', style: TextStyle(color: Colors.black)),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh),
              color: Colors.black,
            ),
          ],
        ),
        body: FutureBuilder(
            future: api.getAnnouncements2(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 32,
                            );
                          },
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => AnnouncementDetailsPage2(
                                      title: snapshot.data![index]['titulo']!,
                                      contact: snapshot.data![index]
                                          ['contato']!,
                                      description: snapshot.data![index]
                                          ['descricao']!,
                                    ),
                                  ),
                                );
                              },
                              child: CustomCardWidget(
                                title: snapshot.data![index]['titulo']!,
                                description: snapshot.data![index]
                                    ['descricao']!,
                                contact: snapshot.data![index]['contato']!,
                              ),
                            );
                          }),
                    ),
                    CupertinoButton(
                      color: Colors.blue,
                      child: Text('CRIAR ANÚNCIO - BUSCANDO'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CreateAnnouncementPage2()));
                      },
                    ),
                    SizedBox(height: 12),
                    CupertinoButton(
                      color: Colors.blue,
                      child: Text('IR A ABA - CONTRATANTE'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
