import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_navbar.g.dart';

enum BottomNavbarEnum { explore, likes, matches }

@riverpod
class BottomNavbar extends _$BottomNavbar {
  @override
  BottomNavbarEnum build() {
    return BottomNavbarEnum.explore;
  }
}
