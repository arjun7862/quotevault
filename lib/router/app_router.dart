import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/utils/supabase_client.dart';
import '../features/data/impl/collections_repository_impl.dart';
import '../features/data/impl/favorites_repository_impl.dart';
import '../features/data/impl/profile_repository_impl.dart';
import '../features/data/impl/quotes_repository_impl.dart';
import '../features/domain/usecases/get_favorites_usecase.dart';
import '../features/domain/usecases/get_profile_usecase.dart';
import '../features/domain/usecases/get_quotes_usecase.dart';
import '../features/domain/usecases/toggle_favorite_usecase.dart';
import '../features/domain/usecases/update_profile_usecase.dart';
import '../features/presentation/bloc/collection/collections_bloc.dart';
import '../features/presentation/bloc/collection/collections_event.dart';
import '../features/presentation/bloc/favorites/favorites_bloc.dart';
import '../features/presentation/bloc/favorites/favorites_event.dart';
import '../features/presentation/bloc/profile/profile_bloc.dart';
import '../features/presentation/bloc/profile/profile_event.dart';
import '../features/presentation/bloc/quotes/quotes_bloc.dart';
import '../features/presentation/bloc/quotes/quotes_event.dart';
import '../features/presentation/ui/collections_page.dart';
import '../features/presentation/ui/favorites_page.dart';
import '../features/presentation/ui/home_page.dart';
import '../features/presentation/ui/login_page.dart';
import '../features/presentation/ui/notification_settings_page.dart';
import '../features/presentation/ui/profile_page.dart';
import '../features/presentation/ui/settings_page.dart';
import '../features/presentation/ui/signup_page.dart';
import '../features/presentation/ui/reset_password_page.dart';
import 'go_router_refresh_stream.dart';


class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',

    refreshListenable: GoRouterRefreshStream(
      supabase.auth.onAuthStateChange,
    ),

    redirect: (context, state) {
      final isLoggedIn = supabase.auth.currentSession != null;
      final isAuthRoute = state.matchedLocation == '/login' ||
          state.matchedLocation == '/signup' ||
          state.matchedLocation == '/reset';

      if (!isLoggedIn && !isAuthRoute) return '/login';
      if (isLoggedIn && isAuthRoute) return '/home';

      return null;
    },

    routes: [
      GoRoute(path: '/', redirect: (_, __) => '/home'),

      GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
      GoRoute(path: '/signup', builder: (_, __) => const SignupPage()),
      GoRoute(path: '/reset', builder: (_, __) => const ResetPasswordPage()),

      /// 🧠 APP SHELL (SHARED BLOCS LIVE HERE)
      ShellRoute(
        builder: (context, state, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => QuotesBloc(
                  GetQuotesUseCase(
                    QuotesRepositoryImpl(),
                  ),
                )..add(const QuotesEvent.fetch()),
              ),

              BlocProvider(
                create: (_) => FavoritesBloc(
                  getFavorites: GetFavoritesUseCase(
                    FavoritesRepositoryImpl(),
                  ),
                  toggleFavorite: ToggleFavoriteUseCase(
                    FavoritesRepositoryImpl(),
                  ),
                )..add(const FavoritesEvent.load()),
              ),

              BlocProvider(
                create: (_) => CollectionsBloc(
                  CollectionsRepositoryImpl(),
                )..add(const CollectionsEvent.load()),
              ),
            ],
            child: child,
          );
        },

        routes: [
          GoRoute(
            path: '/home',
            builder: (_, __) => const HomePage(),
          ),

          GoRoute(
            path: '/favorite',
            builder: (_, __) => const FavoritesPage(),
          ),

          GoRoute(
            path: '/collections',
            builder: (_, __) => const CollectionsPage(),
          ),

          GoRoute(
            path: '/notification',
            builder: (_, __) => const NotificationSettingsPage(),
          ),

          GoRoute(
            path: '/settings',
            builder: (_, __) => const SettingsPage(),
          ),
        ],
      ),

      /// 👤 PROFILE (SHORT-LIVED)
      GoRoute(
        path: '/profile',
        builder: (_, __) => BlocProvider(
          create: (_) => ProfileBloc(
            getProfile: GetProfileUseCase(
              ProfileRepositoryImpl(),
            ),
            updateProfile: UpdateProfileUseCase(
              ProfileRepositoryImpl(),
            ),
          )..add(const ProfileEvent.load()),
          child: const ProfilePage(),
        ),
      ),
    ],
  );
}
