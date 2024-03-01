import 'package:flutter/material.dart';
import 'package:talent_link/flavour_enum.dart';
import 'package:talent_link/init_app.dart';
import 'package:talent_link/main.dart';

import 'src/presentation/widgets/restart_widget.dart';

void main() async {
  Flavor.appFlavor = FlavorEnum.PRODUCTION;
  await initApp();
  runApp(const RestartWidget(MyApp()));
}
