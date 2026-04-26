import 'package:equatable/equatable.dart';

/// Represents a financial instrument in the watchlist.
///
/// Contains basic information required to display the stock
/// details in the list.
class Stock extends Equatable {
  const Stock({
    required this.symbol,
    required this.category,
    required this.price,
    required this.change,
    required this.changePercentage,
  });

  final String symbol;
  final String category;
  final double price;
  final double change;
  final double changePercentage;

  @override
  List<Object?> get props => [
    symbol,
    category,
    price,
    change,
    changePercentage,
  ];
}
