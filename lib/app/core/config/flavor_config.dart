enum AppFlavor { dev, prod }

class FlavorConfig {
  final AppFlavor flavor;
  final String appName;
  final String baseUrl;
  final String apiPrefix;

  static FlavorConfig? _instance;

  FlavorConfig._internal({
    required this.flavor,
    required this.appName,
    required this.baseUrl,
    required this.apiPrefix,
  });

  static FlavorConfig initialize({
    required AppFlavor flavor,
    required String appName,
    required String baseUrl,
    String apiPrefix = '/api/v1',
  }) {
    _instance = FlavorConfig._internal(
      flavor: flavor,
      appName: appName,
      baseUrl: baseUrl,
      apiPrefix: apiPrefix,
    );
    return _instance!;
  }

  static FlavorConfig get instance {
    assert(
      _instance != null,
      'FlavorConfig has not been initialized. Call FlavorConfig.initialize() before accessing instance.',
    );
    return _instance!;
  }

  static bool get isInitialized => _instance != null;
  static bool get isDev => instance.flavor == AppFlavor.dev;
  static bool get isProd => instance.flavor == AppFlavor.prod;

  String get fullApiUrl => '$baseUrl$apiPrefix';
}
