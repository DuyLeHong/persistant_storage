import 'package:shared_preferences/shared_preferences.dart';

class CounterStorage {
  final count_key = 'count';

  Future save(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(count_key, value);
  }

  Future<int> readCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(count_key) ?? 0;
  }
}
