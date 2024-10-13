import 'package:flutter/material.dart';

import '../features/my_profile_view/my_profile.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar( {
    super.key,
    this.imageUrl = "https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4'"
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyProfileView(),
        ));
      },
      icon: CircleAvatar(
        backgroundImage: NetworkImage(
          imageUrl,
        ),
      ),
    );
  }
}
