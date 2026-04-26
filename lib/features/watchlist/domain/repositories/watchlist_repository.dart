import 'package:watchlist_app/features/watchlist/domain/entities/stock.dart';

/// Repository interface for watchlist data management.
///
/// Defines the contract for fetching and updating the stock watchlist.
abstract class WatchlistRepository {
  /// Fetches the current list of stocks in the watchlist.
  Future<List<Stock>> getWatchlist();

  /// Persists the updated order of stocks.
  Future<void> saveWatchlist(List<Stock> stocks);
}
