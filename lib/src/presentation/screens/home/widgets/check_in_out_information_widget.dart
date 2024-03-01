// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:talent_link/generated/l10n.dart';
// import 'package:talent_link/src/config/theme/color_schemes.dart';
// import 'package:talent_link/src/core/resources/image_paths.dart';
// import 'package:talent_link/src/domain/entities/home/home.dart';
//
// class CheckInOutInformationWidget extends StatelessWidget {
//   final Home home;
//
//   const CheckInOutInformationWidget({Key? key, required this.home})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             SvgPicture.asset(ImagePaths.checkInTime,
//                 fit: BoxFit.scaleDown, matchTextDirection: true),
//             const SizedBox(height: 8),
//             Text(home.checkIn == "" ? "-:-" : home.checkIn,
//                 style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                     fontWeight: FontWeight.bold, color: ColorSchemes.black)),
//             const SizedBox(height: 8),
//             Text(S.of(context).checkIn,
//                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                     fontWeight: FontWeight.normal,
//                     color: ColorSchemes.grayText))
//           ],
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             SvgPicture.asset(ImagePaths.checkOutTime,
//                 fit: BoxFit.scaleDown, matchTextDirection: true),
//             const SizedBox(height: 8),
//             Text(home.checkOut == "" ? "-:-" : home.checkOut,
//                 style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                     fontWeight: FontWeight.bold, color: ColorSchemes.black)),
//             const SizedBox(height: 8),
//             Text(S.of(context).checkOut,
//                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                     fontWeight: FontWeight.normal,
//                     color: ColorSchemes.grayText))
//           ],
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             SvgPicture.asset(ImagePaths.trueMark, fit: BoxFit.scaleDown),
//             const SizedBox(height: 8),
//             Text(home.remainingTime == "" ? "-:-" : home.remainingTime,
//                 style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                     fontWeight: FontWeight.bold, color: ColorSchemes.black)),
//             const SizedBox(height: 8),
//             Text(S.of(context).workHours,
//                 style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                     fontWeight: FontWeight.normal,
//                     color: ColorSchemes.grayText))
//           ],
//         ),
//       ],
//     );
//   }
// }
