import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/core/config/server_config.dart';
import 'package:alkheir_mosque/core/rbac/app_role.dart';

void main() {
  group('ServerConfig.normalize', () {
    test('accepts http and https and strips surrounding space and slashes', () {
      expect(
        ServerConfig.normalize(' http://10.0.2.2:8000/ '),
        'http://10.0.2.2:8000',
      );
      expect(
        ServerConfig.normalize('https://example.com//'),
        'https://example.com',
      );
    });

    test('rejects addresses without a valid http scheme', () {
      expect(ServerConfig.normalize(''), isNull);
      expect(ServerConfig.normalize('localhost:8000'), isNull);
      expect(ServerConfig.normalize('ftp://example.com'), isNull);
    });
  });

  group('AppRole.fromApiStrings', () {
    test('maps API role names to app roles', () {
      expect(AppRole.fromApiStrings(['manager']), {AppRole.admin});
      expect(AppRole.fromApiStrings(['parent']), {AppRole.parent});
    });

    test('ignores unknown role names instead of failing', () {
      expect(
        AppRole.fromApiStrings(['teacher', 'unknown_role']),
        {AppRole.teacher},
      );
    });
  });
}
