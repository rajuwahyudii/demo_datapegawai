import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/constants/style/color.dart';
import 'package:demo/constants/style/text_style.dart';
import 'package:demo/featured/diagnosa/state/diagnosa_provider.dart';
import 'package:demo/featured/diagnosa/view_model/diagnosa_view_model.dart';
import 'package:demo/packages/get_it.dart';
import 'package:demo/router/routes.dart';
import 'package:demo/shared/screen_size.dart';
import 'package:demo/shared/widget/alert.dart';
import 'package:demo/shared/widget/arrow_back.dart';
import 'package:demo/shared/widget/button_widget.dart';
import 'package:demo/shared/widget/empty_page.dart';
import 'package:flutter/material.dart';

class DiagnosaView extends StatelessWidget {
  const DiagnosaView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> listGejala = DiagnosaProvider.watch(context).listGejala;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.greenColor,
        elevation: 0,
        leading: ArrowBackWidget(color: MyColor.mainColor),
        title: const Text(
          'Diagnosa',
          style: MyTextStyle.headerWhiteBold18,
        ),
      ),
      body: SizedBox(
        height: getHeight(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Pilih Gejala",
                style: MyTextStyle.headerGreenBold14,
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('gejala')
                    .orderBy('kode')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return const EmptyPage();
                  }
                  final data = snapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          listGejala.contains(data[index]['kode'])
                              ? DiagnosaProvider.read(context)
                                  .removeGejala(data[index]['kode'])
                              : DiagnosaProvider.read(context)
                                  .addListGejala(data[index]['kode']);
                        },
                        title: Row(
                          children: [
                            listGejala.contains(data[index]['kode'])
                                ? const Icon(
                                    Icons.check_box,
                                    color: MyColor.greenColor,
                                  )
                                : const Icon(
                                    Icons.check_box_outline_blank_rounded,
                                    color: MyColor.grayColor,
                                  ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                '(${data[index]['kode']}) ${data[index]['gejala']}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: MyTextStyle.subHeaderSemibold14,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        color: MyColor.mainColor,
        height: getHeight(context) * 0.1,
        width: getWidth(context),
        child: ButtonWidget(
          color: MyColor.greenColor,
          textColor: MyColor.mainColor,
          label: 'Diagnosa',
          function: () async {
            if (listGejala.isEmpty) {
              failedAlert(context, 'Minimal pilih 1 gejala');
            } else {
              String kode = await getIt<DiagnosaViewModel>()
                  .doDiagnose(context, listGejala);
              Routes.goHasilDiagnosa(kode);

              // getIt<DiagnosaViewModel>()
              //     .doAddHistory(context, listGejala.toString());
            }
          },
        ),
      ),
    );
  }
}
