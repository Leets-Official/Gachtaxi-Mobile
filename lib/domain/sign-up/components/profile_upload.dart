import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  String? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = image.path;
      });
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          _selectedImage != null
              ? ClipOval(
                  child: Image.asset(
                    _selectedImage!,
                    width: 102,
                    height: 102,
                    fit: BoxFit.cover,
                  ),
                )
              : SvgPicture.asset(
                  'assets/icons/signup_profile_icon.svg',
                  width: 102,
                ),
          Positioned(
            bottom: 5,
            right: 5,
            child: GestureDetector(
              onTap: _selectedImage != null ? _removeImage : _pickImage,
              child: SvgPicture.asset(
                _selectedImage != null
                    ? 'assets/icons/cancel_image.svg'
                    : 'assets/icons/camera_icon.svg',
                width: 30,
                height: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
