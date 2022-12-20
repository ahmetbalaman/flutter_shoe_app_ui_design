import 'package:flutter/material.dart';
import 'package:flutter_ayakkabi_uygulama/core/context_extension.dart';
import 'package:flutter_ayakkabi_uygulama/core/flutter_icons.dart';
import 'package:flutter_ayakkabi_uygulama/models/shoe_model.dart';
import 'package:flutter_ayakkabi_uygulama/widgets/app_clipper.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'dart:math' as math;
import '../core/const.dart';

class DetailPage extends StatefulWidget {
  final ShoeModel shoeModel;
  const DetailPage({Key? key, required this.shoeModel}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.shoeModel.color,
      appBar: AppBar(
        backgroundColor: widget.shoeModel.color,
        elevation: 0,
        title: const Text("Kategori"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(FlutterIcons.left_open_1)),
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(children: [
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: context.width,
              height: context.height * .8,
              child: ClipPath(
                clipper: AppClipper(
                    cornerSize: 50, diagonalHeight: 150, roundedBottom: false),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 180, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          widget.shoeModel.name,
                          style: const TextStyle(fontSize: 32),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _buildRatingBar(),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Detaylar:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        widget.shoeModel.desc,
                        style: const TextStyle(color: Colors.black38),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Renk Seçeneği:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          _buildColorOption(AppColors.blueColor),
                          _buildColorOption(AppColors.greenColor),
                          _buildColorOption(AppColors.orangeColor),
                          _buildColorOption(AppColors.redColor),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(bottom: 0, child: _buildBottom()),
          Positioned(
            right: context.width/10,
            top: 0,
            child: Padding(
                padding:  EdgeInsets.only(top: 30),
                child: Hero(
                  tag: "hero${widget.shoeModel.imgPath}",
                  child: Transform.rotate(
                      angle: -math.pi / 7,
                      child: Image(
                          width: context.width * .85,
                          image:
                              AssetImage("assets/${widget.shoeModel.imgPath}"))),
                )),
          )
        ]),
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      width: context.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 10)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fiyat:",
                style: TextStyle(color: Colors.black26),
              ),
              Text(
                widget.shoeModel.price.toString() + "TL",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
              decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Text(
                "Sepete Ekle!",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  Widget _buildColorOption(Color renk) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color: renk,
          borderRadius: const BorderRadius.all(Radius.circular(50))),
    );
  }

  Widget _buildRatingBar() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                "134 Yorum Yapıldı",
                style: const TextStyle(color: Colors.black26),
              )
            ],
          ),
        ),
      ],
    );
  }
}
