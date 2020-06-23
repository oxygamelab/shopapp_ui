import 'package:flutter/material.dart';
import 'package:shopapp_ui/core/const.dart';
import 'package:shopapp_ui/core/flutter_icons.dart';
import 'package:shopapp_ui/models/shoe_model.dart';
import 'package:shopapp_ui/screens/detail_page.dart';
import 'package:shopapp_ui/widgets/app_clipper.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ShoeModel> shoeList = ShoeModel.list;

  Widget _buildShoeCard(ShoeModel shoe) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailPage(
            shoe: shoe,
          ),
        ),
      ),
      child: Container(
        width: 230.0,
        margin: EdgeInsets.only(right: 16.0),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: ClipPath(
                clipper: AppClipper(
                  cornerSize: 25,
                  diagonalHeight: 100,
                  roundedBottom: true,
                ),
                child: Container(
                  width: 230.0,
                  color: shoe.color,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Icon(
                                shoe.brand == 'Nike'
                                    ? FlutterIcons.nike
                                    : FlutterIcons.converse,
                                size: 30.0,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Container(
                              width: 125.0,
                              child: Text(
                                '${shoe.name}',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              '${shoe.price}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16.0),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0)),
                          ),
                          child: Center(
                            child: Icon(
                              FlutterIcons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10.0,
              top: 50.0,
              child: Hero(
                tag: shoe.imgPath,
                child: Transform.rotate(
                  angle: -math.pi / 7,
                  child: Image(
                    image: AssetImage(shoe.imgPath),
                    width: 230.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Icon(
          FlutterIcons.menu,
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    FlutterIcons.search,
                    color: Colors.black26,
                  ),
                  onPressed: () => print('Search..'),
                ),
              ],
            ),
          ),
          Container(
            height: 310.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: shoeList.length,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (BuildContext context, int index) {
                return _buildShoeCard(shoeList[index]);
              },
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'JUST FOR YOU',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'VIEW ALL',
                  style: TextStyle(
                    color: AppColors.greenColor,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),
          ...shoeList.map((shoe) {
            return Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 14.0),
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1.0,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(shoe.imgPath),
                    width: 100.0,
                    height: 60.0,
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Text(
                            shoe.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          shoe.brand,
                          style: TextStyle(color: Colors.black26, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\$${shoe.price.toInt()}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.greenColor,
          unselectedItemColor: Colors.black12,
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(FlutterIcons.compass),
              ),
              title: Text('data'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.list),
              title: Text('data'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.bag),
              title: Text('data'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.person_outline),
              title: Text('data'),
            ),
          ],
        ),
      ),
    );
  }
}
