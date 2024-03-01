import 'package:flutter/material.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';
import 'package:talent_link/src/domain/entities/home/news.dart';

class NewsCardWidget extends StatelessWidget {
  final News news;

  const NewsCardWidget({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorSchemes.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 20,
              spreadRadius: 0,
              color: Color.fromRGBO(23, 43, 77, 0.16),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  news.newsHeader,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ColorSchemes.black, fontWeight: FontWeight.bold),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  news.fromDate,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorSchemes.grayText,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                news.newsBody,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorSchemes.black, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
