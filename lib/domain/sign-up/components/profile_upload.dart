import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gachtaxi_app/common/util/toast_show_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:gachtaxi_app/domain/sign-up/services/image_upload_service.dart';

class ProfileAvatar extends StatefulWidget {
  final Function(String) onImageUploaded;
  final String? initialImageUrl;

  const ProfileAvatar({
    super.key,
    required this.onImageUploaded,
    this.initialImageUrl,
  });

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  String? _selectedImagePath;
  String? _uploadedUrl;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialImageUrl != null &&
          widget.initialImageUrl!.isNotEmpty) {
        setState(() {
          _uploadedUrl = widget.initialImageUrl;
        });
      }
    });
  }

  Future<void> _pickImage() async {
    if (_isUploading) return;

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _isUploading = true;
      });

      try {
        final uploadedUrl = await ImageUploadService.uploadProfileImage(image);

        setState(() {
          _selectedImagePath = image.path;
          _uploadedUrl = uploadedUrl;
        });

        widget.onImageUploaded(uploadedUrl);
      } catch (e) {
        ToastShowUtils(context: context).showSuccess("이미지 업로드에 실패했어요");
      } finally {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImagePath = null;
      _uploadedUrl = null;
    });

    widget.onImageUploaded('');
  }

  @override
  Widget build(BuildContext context) {
    Widget profileImage;

    if (_selectedImagePath != null) {
      profileImage = Image.file(
        File(_selectedImagePath!),
        width: 102,
        height: 102,
        fit: BoxFit.cover,
      );
    } else if (_uploadedUrl != null && _uploadedUrl!.isNotEmpty) {
      profileImage = Image.network(
        _uploadedUrl!,
        width: 102,
        height: 102,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const CircularProgressIndicator();
        },
        errorBuilder: (context, error, stackTrace) {
          return SvgPicture.asset(
            'assets/icons/signup_profile_icon.svg',
            width: 102,
          );
        },
      );
    } else {
      profileImage = SvgPicture.asset(
        'assets/icons/signup_profile_icon.svg',
        width: 102,
      );
    }

    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            ClipOval(child: profileImage),
            Positioned(
              bottom: 5,
              right: 5,
              child: GestureDetector(
                onTap: (_selectedImagePath != null || _uploadedUrl != null)
                    ? _removeImage
                    : _pickImage,
                child: SvgPicture.asset(
                  (_selectedImagePath != null || _uploadedUrl != null)
                      ? 'assets/icons/cancel_image.svg'
                      : 'assets/icons/camera_icon.svg',
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
