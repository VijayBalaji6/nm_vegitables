import 'package:get_it/get_it.dart';
import 'package:shopping_app/network/repository/auth_repository.dart';
import 'package:shopping_app/network/services/auth_services.dart';
import 'package:shopping_app/utils/config/api_base/supabase_manager.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  final SupabaseManager supabaseManager = await SupabaseManager.initialize();

  sl.registerSingleton<SupabaseManager>(supabaseManager);
  sl.registerSingleton<AuthServiceRepository>(AuthServiceImp());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
}
