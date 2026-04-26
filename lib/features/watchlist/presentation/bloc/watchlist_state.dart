import 'package:equatable/equatable.dart';
import '../../domain/entities/stock.dart';

/// Base class for all watchlist states.
abstract class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List<Object?> get props => [];
}

/// Initial state before data is loaded.
class WatchlistInitial extends WatchlistState {}

/// State representing a loaded watchlist.
class WatchlistLoaded extends WatchlistState {
  final List<Stock> stocks;
  final bool isEditing;

  const WatchlistLoaded({
    required this.stocks,
    this.isEditing = false,
  });

  WatchlistLoaded copyWith({
    List<Stock>? stocks,
    bool? isEditing,
  }) {
    return WatchlistLoaded(
      stocks: stocks ?? this.stocks,
      isEditing: isEditing ?? this.isEditing,
    );
  }

  @override
  List<Object?> get props => [stocks, isEditing];
}
