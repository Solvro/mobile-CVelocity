import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_navbar_controller.g.dart';

enum BottomNavbarEnum {
  explore(icon: Icons.search, label: "Explore"),
  likes(icon: Icons.favorite_outline, label: "Likes"),
  chats(icon: Icons.chat_bubble_outline, label: "Chats");

  const BottomNavbarEnum({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
}

@riverpod
class BottomNavbarController extends _$BottomNavbarController {
  @override
  BottomNavbarEnum build() {
    return BottomNavbarEnum.explore;
  }

  void setTab(BottomNavbarEnum newTab) {
    state = newTab;
  }
}
