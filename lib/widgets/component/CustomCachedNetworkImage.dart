import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final String? fallbackImageUrl;
  final Widget Function(BuildContext context, String url)? placeholder;
  final BoxFit? fit;
  final Widget Function(BuildContext context, String url, dynamic error)?
      errorWidget;
  final double? width;
  final double? height;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fallbackImageUrl,
    this.placeholder,
    this.fit,
    this.errorWidget,
    this.width,
    this.height,
  });

  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => placeholder != null
          ? placeholder!(context, url)
          : const CircularProgressIndicator(),
      fit: fit == null ? BoxFit.contain : fit!,
      errorWidget: (context, url, error) => fallbackImageUrl != null
          ? CachedNetworkImage(
              imageUrl: fallbackImageUrl!,
              fit: fit == null ? BoxFit.contain : fit!,
              errorWidget: (context, url, error) => errorWidget != null
                  ? errorWidget!(context, url, error)
                  : const Icon(Icons.error),
            )
          : errorWidget != null
              ? errorWidget!(context, url, error)
              : const Icon(Icons.error),
      width: width,
      height: height,
    );
  }
}
