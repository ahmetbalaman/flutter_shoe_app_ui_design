import 'package:flutter/material.dart';
import 'package:flutter_ayakkabi_uygulama/core/const.dart';
import 'package:flutter_ayakkabi_uygulama/core/context_extension.dart';
import 'package:flutter_ayakkabi_uygulama/core/flutter_icons.dart';
import 'package:flutter_ayakkabi_uygulama/screens/detail_shoe_screen.dart';
import 'package:flutter_ayakkabi_uygulama/widgets/app_clipper.dart';
import '../models/shoe_model.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ShoeModel> shoeList = ShoeModel.list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(FlutterIcons.menu, color: Colors.black),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                const IconButton(
                  onPressed: null,
                  icon: Icon(FlutterIcons.search, color: Colors.black26),
                )
              ],
            ),
          ),
          Container(
              height: 300,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: ListView.builder(
                  itemCount: shoeList.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>
                                DetailPage(shoeModel: shoeList[index])));
                      },
                      child: Container(
                        width: 230,
                        margin: const EdgeInsets.only(right: 16),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: _buildBackground(index, 230),
                            ),
                            Positioned(
                              bottom: 130,
                              right: 10,
                              child: Hero(
                                tag: "hero${shoeList[index].imgPath}",
                                child: Transform.rotate(
                                  angle: -math.pi / 7,
                                  child: Image(
                                    width: 230,
                                    image: AssetImage(
                                        "assets/${shoeList[index].imgPath}"),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "JUST FOR YOU",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
                Text(
                  "WIEW ALL",
                  style: TextStyle(color: AppColors.greenColor, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ...shoeList.map((e) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => DetailPage(shoeModel: e)));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 10,
                      )
                    ]),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage("assets/${e.imgPath}"),
                      width: 100,
                      height: 60,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: context.width * .4,
                            child: Text(e.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Text(e.brand,
                              style: const TextStyle(
                                  color: Colors.black26, height: 1.5)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "${e.price.toInt()}TL",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            );
          })
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 10)
            ]),
        child: BottomNavigationBar(
            selectedItemColor: AppColors.greenColor,
            unselectedItemColor: Colors.black26,
            currentIndex: 1,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(FlutterIcons.compass),
                ),
                label: "data",
              ),
              const BottomNavigationBarItem(
                icon: Icon(FlutterIcons.list),
                label: "data",
              ),
              const BottomNavigationBarItem(
                icon: Icon(FlutterIcons.bag),
                label: "data",
              ),
              const BottomNavigationBarItem(
                icon: Icon(FlutterIcons.person_outline),
                label: "data",
              ),
            ]),
      ),
    );
  }

  Widget _buildBackground(int index, double width) {
    return ClipPath(
      clipper: AppClipper(cornerSize: 25, diagonalHeight: 180),
      child: Container(
        width: width,
        color: shoeList[index].color,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Icon(
                      shoeList[index].brand == "Nike"
                          ? FlutterIcons.nike
                          : FlutterIcons.converse,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    width: 125,
                    child: Text(shoeList[index].name,
                        style: const TextStyle(
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    shoeList[index].price.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(10))),
                child: const Icon(
                  FlutterIcons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
