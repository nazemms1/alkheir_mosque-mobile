import 'package:alkheir_mosque/app/core/config/flavor_config.dart';

import 'main.dart';

Future<void> main() async {
  FlavorConfig.initialize(
    flavor: AppFlavor.prod,
    appName: 'مسجد الخير',
    baseUrl: 'https://alkheir.saas.alkheir-platform.com',
    apiPrefix: '/api/v1',
  );
  await bootstrap();
}
