import '../../domain/entities/stock.dart';
import '../../domain/repositories/watchlist_repository.dart';

/// Implementation of [WatchlistRepository] using in-memory storage.
///
/// Handles data operations for the stock watchlist.
class WatchlistRepositoryImpl implements WatchlistRepository {
  List<Stock> _watchlist = [
    const Stock(
      symbol: 'RELIANCE SEP 1370 PE',
      category: 'NSE | Monthly',
      price: 19.20,
      change: 1.00,
      changePercentage: 5.49,
    ),
    const Stock(
      symbol: 'HDFCBANK',
      category: 'NSE | EQ',
      price: 966.85,
      change: 0.85,
      changePercentage: 0.09,
    ),
    const Stock(
      symbol: 'ASIANPAINT',
      category: 'NSE | EQ',
      price: 2537.40,
      change: 6.60,
      changePercentage: 0.26,
    ),
    const Stock(
      symbol: 'RELIANCE SEP 1880 CE',
      category: 'NSE | Monthly',
      price: 0.00,
      change: 0.00,
      changePercentage: 0.00,
    ),
    const Stock(
      symbol: 'RELIANCE',
      category: 'NSE | EQ',
      price: 1374.00,
      change: -4.50,
      changePercentage: -0.33,
    ),
    const Stock(
      symbol: 'NIFTY IT',
      category: 'IDX',
      price: 35181.95,
      change: 871.51,
      changePercentage: 2.54,
    ),
    const Stock(
      symbol: 'MRF',
      category: 'NSE | EQ',
      price: 147625.00,
      change: 550.00,
      changePercentage: 0.37,
    ),
    const Stock(
      symbol: 'MRF',
      category: 'BSE | EQ',
      price: 147439.45,
      change: 463.80,
      changePercentage: 0.32,
    ),
  ];

  @override
  Future<List<Stock>> getWatchlist() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_watchlist);
  }

  @override
  Future<void> saveWatchlist(List<Stock> stocks) async {
    _watchlist = List.from(stocks);
  }
}
