import 'package:flutter/material.dart';

import '../../widgets/profile_avatar.dart';
import '../profile-preview-view/models/cv.dart';
import '../profile-preview-view/profile_preview_view.dart';
import '../skills/skill_model.dart';
import '../tags/tag_model.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 2; i++)
          Dismissible(
            key: Key(i.toString()),
            secondaryBackground: const ColoredBox(
              color: Colors.red,
              child: Icon(
                Icons.cancel,
                size: 100,
                color: Colors.white,
              ),
            ),
            background: const ColoredBox(
              color: Colors.green,
              child: Icon(
                Icons.favorite,
                size: 100,
                color: Colors.white,
              ),
            ),
            child: ProfilePreviewView(
                actions: const [ProfileAvatar()],
                Cv(
                  id: 1,
                  title: "Software Engineer",
                  phoneNumber: "+1234567890",
                  fullName: "John Doe",
                  tags: [
                    const Tag(tag: "Mobile Development"),
                    const Tag(tag: "Backend"),
                  ],
                  skills: [
                    const Skill(skill: "Flutter"),
                    const Skill(skill: "Dart"),
                    const Skill(skill: "Node.js"),
                  ],
                  experience: [
                    const Experience(
                        company: "Tech Solutions Inc.",
                        position: "Flutter Developer",
                        duration: "24"),
                    const Experience(
                        company: "Web Innovations",
                        position: "Backend Developer",
                        duration: "36"),
                  ],
                  education: [
                    const Education(
                        institution: "State University",
                        degree: "BSc Computer Science",
                        year: "2016"),
                    const Education(
                        institution: "Tech Academy",
                        degree: "Diploma in Mobile Development",
                        year: "2018"),
                  ],
                  description:
                      "Passionate software engineer with over 5 years of experience in mobile and backend development. Strong skills in Flutter and Node.js.",
                  photo:
                      "https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/124599?v=4",
                  isRemote: true,
                  searchRange: 50,
                  createdAt: DateTime.parse("2024-10-01T12:00:00Z"),
                  updatedAt: DateTime.parse("2024-10-10T08:30:00Z"),
                )),
          )
      ],
    );
  }
}
