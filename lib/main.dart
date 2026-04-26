import 'package:watchlist_app/features/watchlist/presentation/presentation.dart';

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
        create: (context) =>
            WatchlistBloc(repository: context.read<WatchlistRepositoryImpl>()),
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
