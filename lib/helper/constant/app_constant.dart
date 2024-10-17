import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:share_buy/models/user/user_model.dart';

class AppConstants {
  static final apiUrl = dotenv.env['API_BASE_URL'] ?? '';
  static final ssoDomain = dotenv.env['SSO_DOMAIN'] ?? '';
  static final ssoClientId = dotenv.env['SSO_CLIENT_ID'] ?? '';
  static final ssoRedirectUri = dotenv.env['SSO_REDIRECT_URI'] ?? '';
  static const networkMessage = 'Vui lòng kiểm tra lại kết nối mạng';
  static var getMe = UserModel.fromJson({
    "_id": "66e9534da46697001266a095",
    "state": "ACTIVE",
    "categories": [11036132],
    "user_name": "Cửa hàng bán Tai Nghe 🎧",
    "full_name": "Cửa hàng bán Tai Nghe 🎧",
    "email": "hatdecuoi881@gmail.com",
    "phone_number": null,
    "role": "SHOP",
    "image":
        "https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lz8xje4qyd714f",
    "firebase_id": "YE41XnWozERcJyhIFbtB0uelc8L2",
    "createdAt": "2024-09-23T05:49:02.189Z",
    "updatedAt": "2024-09-29T18:35:43.830Z",
    "__v": 0
  });
}
