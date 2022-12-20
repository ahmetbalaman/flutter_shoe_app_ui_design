// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../core/const.dart';

class ShoeModel {
  final String name;
  final double price;
  final String desc;
  final Color color;
  final String brand;
  final String imgPath;

  ShoeModel({
    required this.name,
    required this.price,
    required this.desc,
    required this.color,
    required this.brand,
    required this.imgPath,
  });


  static List<ShoeModel> list=[
    ShoeModel(
      name: "Nike Air Jordan 1 Retro High",
      desc:
"Tanıdık ama her zaman taze olan ikonik Air Jordan 1, günümüzün spor ayakkabı kültürü için yeniden düzenlendi. Bu Retro High OG versiyonu, sırçalı deri, rahat yastıklama ve klasik tasarım ayrıntılarıyla bir araya geliyor.",      price: 184,
      color: AppColors.blueColor,
      brand: "Nike",
      imgPath: "2.png",
    ),
    ShoeModel(
      name: "Converse X OPI Chuck Taylor",
      desc:
"Tanıdık ama her zaman taze olan ikonik Air Jordan 1, günümüzün spor ayakkabı kültürü için yeniden düzenlendi. Bu Retro High OG versiyonu, sırçalı deri, rahat yastıklama ve klasik tasarım ayrıntılarıyla bir araya geliyor.",      price: 123,
      color: AppColors.yellowColor,
      brand: "Converse",
      imgPath: "1.png",
    ),
    ShoeModel(
      name: "Nike Air Jordan 1 Retro High",
      desc:
"Tanıdık ama her zaman taze olan ikonik Air Jordan 1, günümüzün spor ayakkabı kültürü için yeniden düzenlendi. Bu Retro High OG versiyonu, sırçalı deri, rahat yastıklama ve klasik tasarım ayrıntılarıyla bir araya geliyor.",      price: 135,
      color: AppColors.redColor,
      brand: "Nike",
      imgPath: "3.png",
    ),
  ];
}
