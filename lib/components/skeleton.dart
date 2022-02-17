import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todobooks/color.dart';

class SkeletonBox extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;
  const SkeletonBox({
    Key? key,
    this.width,
    this.height,
    this.borderRadius,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Shimmer.fromColors(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: ColorMap().black.withOpacity(0.3),
          ),
        ),
        baseColor: ColorMap().black.withOpacity(0.3),
        highlightColor: Colors.white,
      ),
    );
  }
}
