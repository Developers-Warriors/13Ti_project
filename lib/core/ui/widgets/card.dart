import 'package:abstracts/core/ui/_ui.dart';
import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  const Card({
    super.key,
    required this.child,
    this.padding,
    this.height,
    this.width,
    this.onTap,
    this.decoration,
    this.bgColor,
    this.boxShadow,
  });

  final Widget child;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final void Function()? onTap;
  final BoxDecoration? decoration;
  final Color? bgColor;
  final BoxShadow? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(ASizes.r12),
            // boxShadow: [boxShadow ??   ],
          ),
      child: Material(
        color: bgColor ?? AColors.secondary,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ASizes.r12),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(ASizes.r12),
          onTap: onTap,
          splashFactory: InkSparkle.splashFactory,
          child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: ASizes.p12,
                  vertical: ASizes.p16,
                ),
            child: child,
          ),
        ),
      ),
    );
  }
}

