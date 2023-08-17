// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../Helpers/Constants/assets.dart';

class FeaturedModel {
  final String name;
  final int price;
  final double rate;
  final dynamic image;
  FeaturedModel({
    required this.name,
    required this.price,
    required this.image,
    required this.rate,
  });
}

List<FeaturedModel> featuredList = [
  FeaturedModel(
      image: Assets.imagesFeaturedHeadPhone1,
      name: 'TMA-2 HD Wireless',
      price: 320,
      rate: 4.5),
  FeaturedModel(
      image: Assets.imagesFeaturedHeadPhone2,
      name: 'C02 - Cable',
      price: 25,
      rate: 3.5),
  FeaturedModel(
      image: Assets.imagesFeaturedHeadPhone1,
      name: 'TMA-2 SD Wireless',
      price: 210  ,
      rate: 2.8),
];
