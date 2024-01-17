import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:herbcalm/theme.dart';

class ResepobatView extends GetView {
  const ResepobatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  height: 46,
                  width: 46,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: greysColor),
                  child: Center(
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              SizedBox(
                width: 9,
              ),
              Expanded(
                child: Container(
                  width: 100,
                  height: 46,
                  decoration: BoxDecoration(
                    color: greysColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Cari resep obat herbal...',
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: GridView.count(
          physics: ClampingScrollPhysics(),
          crossAxisCount: 2,
          children: List.generate(10, (index) {
            return Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x34090F13),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/obatJamu/lancarhaid.png',
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lancar Haid',
                                style: textBoldBlack.copyWith(fontSize: 16),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Jamu Tradisional'),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 16,
                                  )
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            );
          }),
        )),
      ],
    )));
  }
}
