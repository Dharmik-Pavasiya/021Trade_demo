import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'features/watchlist/data/repositories/watchlist_repository_impl.dart';
import 'features/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'features/watchlist/presentation/screens/watchlist_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WatchlistApp());
}

/// Root widget of the application.
class WatchlistApp extends StatelessWidget {
  const WatchlistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WatchlistRepositoryImpl(),
      child: BlocProvider(
        create: (context) => WatchlistBloc(
          repository: context.read<WatchlistRepositoryImpl>(),
        ),
        child: MaterialApp(
          title: 'Watchlist App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          home: const WatchlistScreen(),
        ),
      ),
    );
  }
}
