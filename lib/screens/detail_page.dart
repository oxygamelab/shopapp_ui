import 'package:flutter/material.dart';
import 'package:shopapp_ui/core/const.dart';
import 'package:shopapp_ui/core/flutter_icons.dart';
import 'package:shopapp_ui/models/shoe_model.dart';
import 'package:shopapp_ui/widgets/app_clipper.dart';
import 'dart:math' as math;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatefulWidget {
  final ShoeModel shoe;

  DetailPage({this.shoe});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  _buildRating() {
    return Row(
      children: [
        RatingBar(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20.0,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(width: 16.0),
        Text(
          '134 Reviews',
          style: TextStyle(color: Colors.black26),
        ),
      ],
    );
  }

  _buildBottom() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1.0,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PRICE',
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
              Text(
                '\$${widget.shoe.price.toInt()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 50.0),
            decoration: BoxDecoration(
              color: AppColors.greenColor,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Text(
              'ADD TO CART',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildColorOption(Color color) {
    return Container(
      width: 20.0,
      height: 20.0,
      margin: EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.shoe.color,
      appBar: AppBar(
        backgroundColor: widget.shoe.color,
        elevation: 0,
        title: Text('Categories'),
        leading: IconButton(
          icon: Icon(
            FlutterIcons.left_open_1,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              bottom: 50.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .82,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: AppClipper(
                        cornerSize: 50,
                        diagonalHeight: 180,
                        roundedBottom: false,
                      ),
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                          top: 180.0,
                          right: 16.0,
                          left: 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 300.0,
                              child: Text(
                                widget.shoe.name,
                                style: TextStyle(
                                  fontSize: 32.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            _buildRating(),
                            SizedBox(height: 24.0),
                            Text(
                              'DETAILS',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              widget.shoe.desc,
                              style: TextStyle(
                                color: Colors.black38,
                              ),
                            ),
                            SizedBox(height: 24.0),
                            Text(
                              'COLOR OPTIONS',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              children: [
                                _buildColorOption(AppColors.blueColor),
                                _buildColorOption(AppColors.greenColor),
                                _buildColorOption(AppColors.orangeColor),
                                _buildColorOption(AppColors.redColor),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: _buildBottom(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 20.0),
              child: Hero(
                tag: widget.shoe.imgPath,
                child: Transform.rotate(
                  angle: -math.pi / 7,
                  child: Image(
                    image: AssetImage(widget.shoe.imgPath),
                    width: MediaQuery.of(context).size.width * .75,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
