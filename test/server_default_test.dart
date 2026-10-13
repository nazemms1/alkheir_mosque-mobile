import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/core/config/server_config.dart';

void main() {
  test('default server is the production site', () {
    expect(ServerConfig.defaultBaseUrl, 'https://www.alkheir-mosque.com');
  });

  test('API base URL is the production /api/v1 root by default', () {
    expect(
      ServerConfig.defaultBaseUrl + '/api/v1',
      'https://www.alkheir-mosque.com/api/v1',
    );
  });

  test('a pasted /api/v1 address is reduced to the site root', () {
    expect(
      ServerConfig.normalize('https://www.alkheir-mosque.com/api/v1/'),
      'https://www.alkheir-mosque.com',
    );
    expect(
      ServerConfig.normalize('http://10.0.2.2:8000/api'),
      'http://10.0.2.2:8000',
    );
  });
}
