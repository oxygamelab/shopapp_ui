import 'package:flutter/material.dart';
import 'package:shopapp_ui/core/const.dart';

class ShoeModel {
  final String name;
  final double price;
  final String desc;
  final Color color;
  final String brand;
  final String imgPath;

  ShoeModel({
    this.name,
    this.price,
    this.desc,
    this.color,
    this.brand,
    this.imgPath,
  });

  static List<ShoeModel> list = [
    ShoeModel(
      name: "Nike Air Jordan 1 Retro High",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 184,
      color: AppColors.blueColor,
      brand: "Nike",
      imgPath: "assets/2.png",
    ),
    ShoeModel(
      name: "Converse X OPI Chuck Taylor",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 123,
      color: AppColors.yellowColor,
      brand: "Converse",
      imgPath: "assets/1.png",
    ),
    ShoeModel(
      name: "Nike Air Jordan 1 Retro High",
      desc:
          "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 135,
      color: AppColors.redColor,
      brand: "Converse",
      imgPath: "assets/3.png",
    ),
  ];
}
