enum FlavorEnum {
  DEVELOPMENT,
  PRODUCTION,
}

class Flavor {
  static FlavorEnum? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get baseUrl {
    switch (appFlavor) {
      case FlavorEnum.DEVELOPMENT:
        return 'http://108.181.167.130:8765/HRSYSTEM_TEST/api/';
      case FlavorEnum.PRODUCTION:
        return 'http://213.239.197.242/IleadCom_HR_API/api/';
      default:
        return 'http://108.181.167.130:8765/HRSYSTEM_TEST/api/';
    }
  }
}