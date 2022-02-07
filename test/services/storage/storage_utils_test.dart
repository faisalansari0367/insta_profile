// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:insta_profile/models/insta_user.dart';
import 'package:insta_profile/services/storage/storage_utils.dart';
import 'package:test/test.dart';

import 'test_data.dart';

void main() {
  group('storage hive tests', () {
    test('should save user when not exist', () {
      final map =
          List.generate(TestData.recentUsers.length, (index) => InstaUser.fromJson(TestData.recentUsers[index]));
      final faisalEhaz = InstaUser.fromJson(TestData.faisalEhazMap);
      final result = StorageUtils().updateRecentUsers(map, faisalEhaz);
      expect(3, result.length);
    });

    test('should update user exists in the list', () {
      const updatedList = TestData.udpateRecentUsersData;
      final map = List.generate(updatedList.length, (index) => InstaUser.fromJson(updatedList[index]));
      final faisalEhaz = InstaUser.fromJson(TestData.udpatedFaisalEhazData);
      final result = StorageUtils().updateRecentUsers(map, faisalEhaz);
      expect(true, isNot(equals(result)));
    });
  });
}
