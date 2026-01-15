import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_strings.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.format_quote, size: 48),
                  SizedBox(height: 12),
                  Text(
                    AppStrings.appName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            _DrawerItem(
              icon: Icons.home,
              label: AppStrings.home,
              onTap: () => context.go('/home'),
            ),

            _DrawerItem(
              icon: Icons.person,
              label: AppStrings.profile,
              onTap: () => context.push('/profile'),
            ),

            _DrawerItem(
              icon: Icons.favorite,
              label: AppStrings.favorites,
              onTap: () => context.push('/favorite'),
            ),

            _DrawerItem(
              icon: Icons.collections_bookmark,
              label: AppStrings.collections,
              onTap: () => context.push('/collections'),
            ),

            _DrawerItem(
              icon: Icons.notifications,
              label: AppStrings.notifications,
              onTap: () => context.push('/notification'),
            ),

            _DrawerItem(
              icon: Icons.settings,
              label: AppStrings.settings,
              onTap: () => context.push('/settings'),
            ),

            const Spacer(),

            _DrawerItem(
              icon: Icons.logout,
              label: AppStrings.logout,
              onTap: () {
                context.pop();
                context.read<AuthBloc>().add(const LogoutRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: onTap,
    );
  }
}