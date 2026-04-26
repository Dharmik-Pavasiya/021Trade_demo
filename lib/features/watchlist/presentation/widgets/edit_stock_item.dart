import 'package:watchlist_app/features/watchlist/presentation/widgets/widgets.dart';

/// Individual stock item widget for the edit mode.
///
/// Includes drag handle and delete button as per the UI design.
class EditStockItem extends StatelessWidget {
  const EditStockItem({super.key, required this.stock, required this.onDelete});

  final Stock stock;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
      ),
      child: Row(
        children: [
          // Drag Handle
          const Icon(Icons.menu, color: Colors.black, size: 20),
          const SizedBox(width: 16),
          // Symbol Name
          Expanded(
            child: Text(
              stock.symbol,
              style: const TextStyle(
                fontSize: 15,
                color: AppTheme.secondaryText,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // Delete Button
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete, color: Colors.black, size: 22),
          ),
        ],
      ),
    );
  }
}
