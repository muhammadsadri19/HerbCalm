import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herbcalm/app/modules/home/views/artikel_deskripsi_view.dart';
import 'package:herbcalm/theme.dart';

class ArtikelKesehatan extends StatefulWidget {
  const ArtikelKesehatan({Key? key}) : super(key: key);

  @override
  _ArtikelKesehatanState createState() => _ArtikelKesehatanState();
}

class _ArtikelKesehatanState extends State<ArtikelKesehatan> {
  final dataArtikelKesehatan =
      FirebaseDatabase.instance.ref('HerbcalmDB/articleHealty');

  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      scrollDirection: Axis.horizontal,
      query: dataArtikelKesehatan,
      itemBuilder: (context, snapshot, animation, index) {
        return InkWell(
          onTap: () {
            Get.to(() => ArtikelDeskripsiView());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: NetworkImage(
                          snapshot.child('imgurl').value.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 0.0, height: 10),
                Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        snapshot.child('title').value.toString(),
                        style:
                            TextStyle(fontSize: 14), // Ganti sesuai kebutuhan
                        maxLines: 2,
                        minFontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            snapshot.child('author').value.toString(),
                            style: textRegularGrey.copyWith(fontSize: 12),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 20,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
