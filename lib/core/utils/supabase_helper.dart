import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/core/config/constants.dart';

class SupabaseHelper {
  static final SupabaseClient _supabase = Supabase.instance.client;

  /// DataBase intialize (Supabbase)
  static Future<void> initializeSupabase() async {
    await Supabase.initialize(
      url: ClassSupaBaseConst.url,
      anonKey: ClassSupaBaseConst.anonKey,
    );
  }

  /// **Jadvaldan model bo‘yicha ma'lumot olish**
  static Future<List<T>> getData<T>({
    required String tableName,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _supabase.from(tableName).select();
      return response.map<T>((json) => fromJson(json)).toList();
    } catch (error) {
      throw Exception('$tableName dan  olishda xatolik: $error');
    }
  }

  /// **Jadvaldan model bo‘yicha saralab olish ma'lumot olish**
  static Future<List<T>> getSortData<T>({
    required String tableName,
    required String columnName,
    required String columnValue,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response =
          await _supabase.from(tableName).select().eq(columnName, columnValue);
      return response.map<T>((json) => fromJson(json)).toList();
    } catch (error) {
      throw Exception('$tableName dan  olishda xatolik: $error');
    }
  }

  /// Single data olish
  static Future<T?> getSingleData<T>({
    required String tableName,
    required String columnName,
    required dynamic value,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final response = await _supabase
        .from(tableName)
        .select()
        .eq(columnName, value)
        .maybeSingle(); // Agar topilmasa, null qaytaradi.
    print('Supabase response: $response'); // Log uchun

    if (response != null) {
      return fromJson(response);
    }
    return null;
  }



  static Future<void> upgradeData<T>({
    required String tableName,
    required T model,
    required Map<String, dynamic> Function(T) toJson,
  }) async {
    try {
      await _supabase.from(tableName).insert(toJson(model));
    } catch (error) {
      throw Exception('$tableName ga malumot yangilashda xatolik: $error');
    }
  }

  /// **Jadvalga model orqali ma’lumot qo‘shish**
  static Future<void> insertData<T>({
    required String tableName,
    required T model,
    required Map<String, dynamic> Function(T) toJson,
  }) async {
    try {
      await _supabase.from(tableName).insert(toJson(model));
    } catch (error) {
      throw Exception('$tableName ga qo‘shishda xatolik: $error');
    }
  }

  /// **Jadvaldan ma’lumot o‘chirish**
  static Future<void> deleteData({
    required String tableName,
    required String column,
    required dynamic value,
  }) async {
    try {
      await _supabase.from(tableName).delete().eq(column, value);
    } catch (error) {
      throw Exception('$tableName dan o‘chirishda xatolik: $error');
    }
  }
}
