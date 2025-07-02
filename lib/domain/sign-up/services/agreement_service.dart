import 'package:gachtaxi_app/common/util/api_client.dart';

Future<void> sendAgreement({
  required bool terms,
  required bool privacy,
  bool marketing = false,
}) async {
  const path = '/auth/agreement';
  final uri = Uri.parse(path);

  await ApiClient.patch(uri, body: {
    "termsAgreement": terms,
    "privacyAgreement": privacy,
    "marketingAgreement": marketing,
  });
}
