import 'package:dio/dio.dart';
import 'package:gachtaxi_app/common/util/api_client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

class ImageUploadService {
  static Future<String> getPresignedUrl(String fileName) async {
    final uri = Uri.parse('/api/images?fileName=$fileName');
    final res = await ApiClient.get(uri);
    return res.data as String;
  }

  static Future<void> uploadImageToS3(String presignedUrl, XFile imageFile) async {
    final bytes = await imageFile.readAsBytes();
    final mimeType = lookupMimeType(imageFile.path);

    final dio = Dio();
    await dio.put(
      presignedUrl,
      data: bytes,
      options: Options(
        headers: {'Content-Type': mimeType ?? 'application/octet-stream'},
      ),
    );
  }

  static Future<String> uploadProfileImage(XFile imageFile) async {
    final fileName = _generateFileNameFromXFile(imageFile);
    final presignedUrl = await getPresignedUrl(fileName);
    await uploadImageToS3(presignedUrl, imageFile);

    return presignedUrl.split('?').first;
  }

  static String _generateFileNameFromXFile(XFile file) {
    final now = DateTime.now();
    final date = "${now.year}${_twoDigits(now.month)}${_twoDigits(now.day)}";
    final unique = now.millisecondsSinceEpoch.toString().substring(9);

    final extension = path.extension(file.path).toLowerCase().replaceAll('.', '');

    return 'profile_${date}_$unique.$extension';
  }

  static String _twoDigits(int n) => n.toString().padLeft(2, '0');
}
