import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quotevault/core/constants/app_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/theme/app_theme_mode.dart';
import 'core/utils/notification_service.dart';
import 'core/utils/timezone_initializer.dart';
import 'features/data/impl/daily_quote_repository_impl.dart';
import 'features/data/impl/quotes_repository_impl.dart';
import 'features/data/impl/settings_repository_impl.dart';
import 'features/domain/usecases/get_quotes_usecase.dart';
import 'features/presentation/bloc/daily_quotes/daily_quote_bloc.dart';
import 'features/presentation/bloc/daily_quotes/daily_quote_event.dart';
import 'features/presentation/bloc/quotes/quotes_bloc.dart';
import 'features/presentation/bloc/quotes/quotes_event.dart';
import 'features/presentation/bloc/settings/settings_cubit.dart';
import 'features/presentation/bloc/settings/settings_state.dart';
import 'router/app_router.dart';
import 'core/constants/app_strings.dart';
import 'core/utils/supabase_client.dart';
import 'core/theme/app_theme.dart';
import 'features/data/impl/auth_repository_impl.dart';
import 'features/domain/usecases/auth_use_cases.dart';
import 'features/presentation/bloc/auth/auth_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: SupabaseService.url,
    anonKey: SupabaseService.anonKey,
  );

  await TimezoneInitializer.init();
  await NotificationService.init();

  runApp(
    MultiBlocProvider(
      providers: [
        /// 🔐 AUTH (GLOBAL)
        BlocProvider(
          create: (_) => AuthBloc(
            authUseCases: AuthUseCases(
              AuthRepositoryImpl(),
            ),
          ),
        ),

        /// 🎨 SETTINGS (GLOBAL)
        BlocProvider(
          create: (_) => SettingsCubit(
            SettingsRepositoryImpl(),
          )..load(),
        ),

        /// 🌟 DAILY QUOTE (GLOBAL)
        BlocProvider(
          create: (_) => DailyQuoteBloc(
            DailyQuoteRepositoryImpl(),
          )..add(const DailyQuoteEvent.load()),
        ),
      ],
      child: const QuoteVaultApp(),
    ),
  );
}

class QuoteVaultApp extends StatelessWidget {
  const QuoteVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, settings) {
        final rawScale = settings.fontScale
            .clamp(
          AppConstants.minFontScale,
          AppConstants.maxFontScale,
        )
            .toDouble();

        /// 👇 SOFTEN SCALE TO PREVENT OVERFLOW
        final layoutSafeScale = rawScale > 0.9
            ? 0.9 + (rawScale - 0.9) * 0
            : rawScale;

        return MaterialApp.router(
          title: AppStrings.appName,

          theme: AppTheme.light(
            accent: settings.accentColor,
          ),
          darkTheme: AppTheme.dark(
            accent: settings.accentColor,
          ),

          /// ✅ CORRECT MAPPING
          themeMode: settings.themeMode.toFlutterThemeMode(),

          routerConfig: AppRouter.router,

          builder: (context, child) {
            final mediaQuery = MediaQuery.of(context);
            return MediaQuery(
              data: mediaQuery.copyWith(
                textScaler: TextScaler.linear(layoutSafeScale),
              ),
              child: child!,
            );
          },
        );
      },
    );
  }
}
