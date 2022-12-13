import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pijobsway/view/announcement_detailspage.dart';
import 'package:pijobsway/view/create_announcementpage.dart';
import 'package:pijobsway/view/home_page2.dart';

import '../data/api.dart';
import '../shared/custom_card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:
              Text('JW - CONTRATANTES', style: TextStyle(color: Colors.black)),
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
            future: api.getAnnouncements(),
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
                                    builder: (_) => AnnouncementDetailsPage(
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
                      child: Text('CRIAR ANÚNCIO - CONTRATANTE'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CreateAnnouncementPage()));
                      },
                    ),
                    SizedBox(height: 12),
                    CupertinoButton(
                      color: Colors.blue,
                      child: Text('IR A ABA - BUSCANDO'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage2()));
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
