import 'package:cashier_system/controller/items/items_view_controller.dart';
import 'package:cashier_system/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ItemsViewController controller = Get.put(ItemsViewController());
List<DataRow> generateDataRows(List<ItemsModel> data,
    {List<ItemsModel>? searchData}) {
  return List<DataRow>.generate(
    searchData != null ? searchData.length : data.length,
    (index) {
      final item = searchData != null ? searchData[index] : data[index];
      return DataRow(cells: [
        DataCell(SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(item.itemsId.toString()))),
        DataCell(SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(item.itemsBarcode.toString()))),
        DataCell(SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(item.itemsName ?? ''))),
        DataCell(SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(item.itemsCount.toString()))),
        DataCell(SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('${item.itemsSellingprice.toString()} IQ'))),
        DataCell(SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('${item.itemsBuingprice.toString()} IQ'))),
        DataCell(SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text('${item.itemsCostprice.toString()} IQ'))),
        DataCell(SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(item.itemsType.toString()))),
        DataCell(SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(item.itemsDesc.toString()))),
      ]);
    },
  );
}

// Usage:
List<DataRow> customItemsRows = generateDataRows(controller.data,
    searchData: controller.isSearch ? controller.listdataSearch : null);
