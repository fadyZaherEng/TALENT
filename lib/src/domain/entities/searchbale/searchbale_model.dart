import 'package:talent_link/src/domain/entities/searchbale/searchbale_item.dart';

class SearchableModel {
  final String title;
  final List<SearchableItem> searchableItems;

  SearchableModel({
    required this.searchableItems,
    required this.title,
  });
}
