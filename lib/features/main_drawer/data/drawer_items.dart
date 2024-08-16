import 'package:flutter/material.dart' show Icons;

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/highlight_text_card.dart';
import '../domain/models/menu_section_model.dart';
import '../domain/models/section_item_model.dart';

const List<MenuSectionModel> drawerItems = [
  MenuSectionModel(
    title: 'Main',
    items: [
      SectionItemModel(
        icon: Icons.speed_rounded,
        title: 'Dashboard',
        trailing: HighlightTextCard('9+'),
      ),
      SectionItemModel(
        icon: Icons.date_range_rounded,
        title: 'Calender',
      ),
      SectionItemModel(
        icon: Icons.chat_rounded,
        title: 'Chat',
      ),
      SectionItemModel(
        icon: Icons.email_rounded,
        title: 'Email',
        children: ['Inbox', 'Read Email'],
      ),
      SectionItemModel(
        icon: Icons.checklist_rounded,
        title: 'Tasks',
        children: ['List', 'Details'],
      ),
      SectionItemModel(
        icon: Icons.content_paste_rounded,
        title: 'Kanban Board',
      ),
      SectionItemModel(
        icon: Icons.folder_copy_rounded,
        title: 'File Manager',
        trailing: HighlightTextCard(
          '1 File',
          color: AppColors.purple,
        ),
      ),
    ],
  ),
];
