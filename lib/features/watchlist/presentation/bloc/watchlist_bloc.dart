import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/watchlist_repository.dart';
import 'watchlist_event.dart';
import 'watchlist_state.dart';

/// Business Logic Component for managing watchlist state.
///
/// Coordinates events and states for loading, reordering, and saving the watchlist.
class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final WatchlistRepository _repository;

  WatchlistBloc({required WatchlistRepository repository})
      : _repository = repository,
        super(WatchlistInitial()) {
    on<LoadWatchlist>(_onLoadWatchlist);
    on<ToggleEditMode>(_onToggleEditMode);
    on<ReorderWatchlist>(_onReorderWatchlist);
    on<RemoveStock>(_onRemoveStock);
    on<SaveWatchlist>(_onSaveWatchlist);
  }

  Future<void> _onLoadWatchlist(
    LoadWatchlist event,
    Emitter<WatchlistState> emit,
  ) async {
    final stocks = await _repository.getWatchlist();
    emit(WatchlistLoaded(stocks: stocks));
  }

  void _onToggleEditMode(
    ToggleEditMode event,
    Emitter<WatchlistState> emit,
  ) {
    if (state is WatchlistLoaded) {
      final currentState = state as WatchlistLoaded;
      emit(currentState.copyWith(isEditing: !currentState.isEditing));
    }
  }

  void _onReorderWatchlist(
    ReorderWatchlist event,
    Emitter<WatchlistState> emit,
  ) {
    if (state is WatchlistLoaded) {
      final currentState = state as WatchlistLoaded;
      final stocks = List.of(currentState.stocks);

      int newIndex = event.newIndex;
      if (newIndex > event.oldIndex) {
        newIndex -= 1;
      }

      final item = stocks.removeAt(event.oldIndex);
      stocks.insert(newIndex, item);

      emit(currentState.copyWith(stocks: stocks));
    }
  }

  void _onRemoveStock(
    RemoveStock event,
    Emitter<WatchlistState> emit,
  ) {
    if (state is WatchlistLoaded) {
      final currentState = state as WatchlistLoaded;
      final stocks = List.of(currentState.stocks);
      stocks.removeAt(event.index);
      emit(currentState.copyWith(stocks: stocks));
    }
  }

  Future<void> _onSaveWatchlist(
    SaveWatchlist event,
    Emitter<WatchlistState> emit,
  ) async {
    if (state is WatchlistLoaded) {
      final currentState = state as WatchlistLoaded;
      await _repository.saveWatchlist(currentState.stocks);
      emit(currentState.copyWith(isEditing: false));
    }
  }
}
