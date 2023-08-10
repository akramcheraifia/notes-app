import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(.08),
        ),
        child: IconButton(
            hoverColor: Colors.white,
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 28,
            )));
  }
}
