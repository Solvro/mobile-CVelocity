import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const CircleAvatar(
        backgroundImage: NetworkImage(
          'https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4',
        ),
      ),
    );
  }
}
