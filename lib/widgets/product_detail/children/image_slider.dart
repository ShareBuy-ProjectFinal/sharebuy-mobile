import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_buy/models/product/product_model.dart';
import 'package:share_buy/models/product/product_recommend_model.dart';

class ImageSlider extends StatefulWidget {
  final ProductModel product;
  const ImageSlider({super.key, required this.product});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    // List<Widget> imageSliders = [
    //   CachedNetworkImage(
    //     imageUrl: widget.product.payload?.image ?? '',
    //   ),
    //   CachedNetworkImage(
    //     imageUrl: widget.product.payload?.image ?? '',
    //   ),
    //   CachedNetworkImage(
    //     imageUrl: widget.product.payload?.image ?? '',
    //   ),
    // ];

    List<Widget> imageSliders = widget.product.images!
        .map((e) => CachedNetworkImage(imageUrl: e))
        .toList();

    imageSliders.insert(
        0, CachedNetworkImage(imageUrl: widget.product.image ?? ''));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 200.h,
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageSliders.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.0.w),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.blue)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
