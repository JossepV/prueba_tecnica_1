import 'dart:ui';

import 'package:flutter/material.dart';

class GridItemWidget extends StatelessWidget {
  final String item;
  final bool isDragging;
  final bool isMostLiked;
  final bool isMostViewed;

  const GridItemWidget({
    Key? key,
    required this.item,
    required this.isDragging,
    this.isMostLiked = false,
    this.isMostViewed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: isDragging
            ? ImageFilter.blur(sigmaX: 24, sigmaY: 24)
            : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          decoration: BoxDecoration(
            color: isDragging
                ? const Color(0xff6C6C6C).withOpacity(0.3)
                : Colors.transparent,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width / 2 - 8,
            alignment: Alignment.center,
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: isDragging ? 16 : 0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: isDragging ? 16 : 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        clipBehavior: Clip.antiAlias,
                        child:
                            Image.network("https://placehold.co/190x250.png"),
                      ),
                    ),
                    Visibility(
                      visible: isMostLiked || isMostViewed,
                      child: Positioned(
                          top: 8,
                          left: isDragging ? 24 : 8,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff6C6C6C)
                                        .withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    isMostLiked
                                        ? 'Most Liked'
                                        : isMostViewed
                                            ? 'Most Viewed'
                                            : '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ))),
                    ),
                    Positioned(
                      bottom: 16,
                      left: isDragging ? 24 : 12,
                      right: isDragging ? 24 : 12,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '18/04/2024',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                                size: 16,
                              ),
                              Text(
                                '100.0K',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: isDragging
                    ? const EdgeInsets.only(
                        left: 16, top: 16, right: 16, bottom: 16)
                    : const EdgeInsets.only(
                        left: 0, top: 16, right: 16, bottom: 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "$item This is a long long text with a lot lot lot lot  ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
