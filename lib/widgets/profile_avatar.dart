import 'package:flutter/material.dart';

import '../features/my_profile_view/my_profile.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyProfileView(),
        ));
      },
      icon: const CircleAvatar(
        backgroundImage: NetworkImage(
          'https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4',
        ),
      ),
    );
  }
}
