import 'package:elevate_task/core/constant/color.dart';
import 'package:elevate_task/core/constant/imageAssets.dart';
import 'package:elevate_task/data/model/ProductModel.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double currentPrice;
  final Rating rating;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.currentPrice,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColor.cardBorderColor,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Image.network(
                  imageUrl,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColor.white),
                    shape: MaterialStateProperty.all(CircleBorder()),
                  ),
                  icon: Image.asset(
                    'assets/icons/heart.png',
                    width: 24,
                    height: 24,
                    color: AppColor.mainColor,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'EGP $currentPrice',
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 18,
                ),
              ),
              Text(
                'EGP 2000',
                style: TextStyle(
                  color: AppColor.lineThroughColor,
                  decoration: TextDecoration.lineThrough,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 8),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Review (${rating.rate ?? 0.0})',
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.star, size: 24, color: AppColor.amberColor),
                  ],
                ),
              ),
              IconButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColor.mainColor),
                  shape: MaterialStateProperty.all(CircleBorder()),
                ),
                icon: Image.asset(
                  AppImageassets.addIcon,
                  width: 20,
                  height: 20,
                  color: AppColor.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
