import 'package:flutter/material.dart';

import 'package:skeletons/skeletons.dart';

import 'package:talent_link/src/config/theme/color_schemes.dart';

class PayslipShimmerWidget extends StatefulWidget {
  const PayslipShimmerWidget({super.key});

  @override
  State<PayslipShimmerWidget> createState() => _PayslipShimmerWidgetState();
}

class _PayslipShimmerWidgetState extends State<PayslipShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          _payslipDateWidget(),
          _payslipSalaryWidget(),
          _payslipContentWidget(context)
        ],
      ),
    );
  }

  Widget _payslipDateWidget() {
    return Container(
      decoration: const BoxDecoration(
        color: ColorSchemes.white,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SkeletonLine(
                    style: SkeletonLineStyle(
                        width: 24,
                        height: 18,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                  SkeletonLine(
                    style: SkeletonLineStyle(
                        width: 120,
                        height: 24,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                  SkeletonLine(
                    style: SkeletonLineStyle(
                        width: 24,
                        height: 18,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _payslipSalaryWidget() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Container(
              height: 105,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: ColorSchemes.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const SkeletonLine(
                style: SkeletonLineStyle(
                  height: double.infinity,
                  width: double.infinity,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _payslipItemShimmer() {
    return const Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Row(
          children: [
            SkeletonLine(
              style: SkeletonLineStyle(
                  width: 24,
                  height: 24,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
            ),
            SizedBox(
              width: 10,
            ),
            SkeletonLine(
              style: SkeletonLineStyle(
                  width: 79,
                  height: 20,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
            ),
            Spacer(),
            SkeletonLine(
              style: SkeletonLineStyle(
                  width: 64,
                  height: 21,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 8,
      ),
    ]);
  }

  Widget _payslipContentWidget(context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      color: ColorSchemes.white,
      child: Container(
        height: MediaQuery.sizeOf(context).height,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          color: ColorSchemes.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34),
            topRight: Radius.circular(34),
          ),
        ),
        child: Card(
          elevation: 10.0,
          shadowColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _payslipItemShimmer(),
              _payslipItemShimmer(),
              _payslipItemShimmer(),
              _payslipItemShimmer(),
            ],
          ),
        ),
      ),
    );
  }
}
