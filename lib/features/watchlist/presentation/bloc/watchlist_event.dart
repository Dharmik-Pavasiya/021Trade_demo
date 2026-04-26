import 'package:watchlist_app/features/watchlist/presentation/bloc/bloc.dart';

/// Base class for all watchlist events.
abstract class WatchlistEvent extends Equatable {
  const WatchlistEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load the watchlist data.
class LoadWatchlist extends WatchlistEvent {}

/// Event to toggle the edit mode of the watchlist.
class ToggleEditMode extends WatchlistEvent {}

/// Event to handle reordering of stocks in the list.
class ReorderWatchlist extends WatchlistEvent {
  const ReorderWatchlist(this.oldIndex, this.newIndex);

  final int oldIndex;
  final int newIndex;

  @override
  List<Object?> get props => [oldIndex, newIndex];
}

/// Event to remove a stock from the watchlist.
class RemoveStock extends WatchlistEvent {
  const RemoveStock(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

/// Event to save the current state of the watchlist.
class SaveWatchlist extends WatchlistEvent {}
