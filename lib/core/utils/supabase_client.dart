import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;
class SupabaseService {
  static final url =  dotenv.env['SUPABASE_URL'] ?? '';
  static final anonKey =  dotenv.env['SUPABASE_API_KEY'] ?? '';
}
