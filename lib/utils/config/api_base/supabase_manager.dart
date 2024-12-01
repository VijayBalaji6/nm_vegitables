import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:convert';

class SupabaseManager {
  final SupabaseClient supabaseClient;

  SupabaseManager._(this.supabaseClient);

  static Future<SupabaseManager> initialize() async {
    final String configData =
        await rootBundle.loadString('assets/supa_base_key/supa_base_key.json');
    final Map<String, dynamic> config = json.decode(configData);

    final SupabaseClient client = SupabaseClient(
      config['apiUrl'] as String,
      config['apiKey'] as String,
    );

    return SupabaseManager._(client);
  }
}
