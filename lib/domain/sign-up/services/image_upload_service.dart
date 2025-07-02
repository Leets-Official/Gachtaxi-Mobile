import 'package:dio/dio.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadService {
  static Future<String> getPresignedUrl(String fileName) async {
    final uri = Uri.parse('/api/images?fileName=$fileName');
    final res = await ApiClient.get(uri);
    return res.data as String;
  }

  static Future<void> uploadImageToS3(String presignedUrl, XFile imageFile) async {
    final bytes = await imageFile.readAsBytes();

    final dio = Dio();
    await dio.put(
      presignedUrl,
      data: bytes,
      options: Options(
        headers: {'Content-Type': 'image/png'},
      ),
    );
  }

  static Future<String> uploadProfileImage(XFile imageFile) async {
    final fileName = _generateFileName();
    final presignedUrl = await getPresignedUrl(fileName);
    await uploadImageToS3(presignedUrl, imageFile);

    return presignedUrl.split('?').first;
  }

  static String _generateFileName() {
    final now = DateTime.now();
    final date = "${now.year}${_twoDigits(now.month)}${_twoDigits(now.day)}";
    final unique = DateTime.now().millisecondsSinceEpoch.toString().substring(9);
    return 'profile_${date}_$unique.png';
  }

  static String _twoDigits(int n) => n.toString().padLeft(2, '0');
}
