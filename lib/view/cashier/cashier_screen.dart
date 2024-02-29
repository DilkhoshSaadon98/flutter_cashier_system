import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cashier_system/view/cashier/components/right_side/cashier_right_side.dart';
import 'package:flutter/material.dart';

class CashierScreen extends StatelessWidget {
  const CashierScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: primaryColor,
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                  color: thirdColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListView.builder(
                                  itemCount: 6,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          border: Border.all(color: white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      width: 50,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${index + 1}",
                                        style: titleStyle.copyWith(
                                            color: white, fontSize: 30),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: thirdColor,
                                borderRadius: BorderRadius.circular(10)),
                          ))
                        ],
                      ),
                    )),
                    Expanded(
                        flex: 6,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: white,
                          ),
                          child: DataTable(
                            dataRowColor: MaterialStatePropertyAll(
                                white.withOpacity(.08)),
                            border: TableBorder(
                                bottom: const BorderSide(color: white),
                                top: const BorderSide(color: white),
                                left: const BorderSide(color: white),
                                right: const BorderSide(color: white),
                                horizontalInside:
                                    const BorderSide(width: 1, color: white),
                                verticalInside:
                                    const BorderSide(width: 1, color: white),
                                borderRadius: BorderRadius.circular(5)),
                            dataTextStyle: bodyStyle.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: white),
                            dividerThickness: 1,
                            headingRowColor:
                                const MaterialStatePropertyAll(thirdColor),
                            headingTextStyle: titleStyle.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: white),
                            dataRowHeight: 100,
                            columnSpacing: 95,
                            columns: const [
                              DataColumn(label: Text('Item Code')),
                              DataColumn(label: Text('Item Name')),
                              DataColumn(label: Text('Type')),
                              DataColumn(label: Text('Price')),
                              DataColumn(label: Text('Stack')),
                              DataColumn(label: Text('Total')),
                              DataColumn(label: Text('Quantity')),
                            ],
                            rows: [],
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: secondColor,
                        )),
                  ],
                ),
              ),
            ),
            const CashierRightSideScreen(),
          ],
        ),
      ),
    );
  }
}
