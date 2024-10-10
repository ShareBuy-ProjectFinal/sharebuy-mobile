import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static final apiUrl = dotenv.env['API_BASE_URL'] ?? '';
  static final ssoDomain = dotenv.env['SSO_DOMAIN'] ?? '';
  static final ssoClientId = dotenv.env['SSO_CLIENT_ID'] ?? '';
  static final ssoRedirectUri = dotenv.env['SSO_REDIRECT_URI'] ?? '';
  static const networkMessage = 'Vui lòng kiểm tra lại kết nối mạng';
}
