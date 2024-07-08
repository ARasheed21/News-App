import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListview extends StatelessWidget {
  const ShimmerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            width: MediaQuery.of(context).size.width,
            height: 128,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),

            ),
          ),
        );
      },
    );
  }
}
