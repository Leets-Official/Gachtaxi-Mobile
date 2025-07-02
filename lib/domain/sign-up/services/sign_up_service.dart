import 'package:dio/dio.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';

Future<Response> submitSupplement({
  required String profilePicture,
  required String nickname,
  required String realName,
  required int studentNumber,
  required String gender,
}) async {
  const path = '/auth/supplement';
  final uri = Uri.parse(path);

  final response = await ApiClient.signup(uri, body: {
    "profilePicture": profilePicture,
    "nickname": nickname,
    "realName": realName,
    "studentNumber": studentNumber,
    "gender": gender,
  });

  return response;
}
