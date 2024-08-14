import 'section_item_model.dart';

final class MenuSectionModel {
  const MenuSectionModel({required this.title, required this.items});

  final String title;
  final List<SectionItemModel> items;
}
