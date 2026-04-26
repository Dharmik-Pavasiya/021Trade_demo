import 'package:watchlist_app/features/watchlist/presentation/bloc/bloc.dart';

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
  const WatchlistLoaded({required this.stocks, this.isEditing = false});

  final List<Stock> stocks;
  final bool isEditing;

  WatchlistLoaded copyWith({List<Stock>? stocks, bool? isEditing}) {
    return WatchlistLoaded(
      stocks: stocks ?? this.stocks,
      isEditing: isEditing ?? this.isEditing,
    );
  }

  @override
  List<Object?> get props => [stocks, isEditing];
}
