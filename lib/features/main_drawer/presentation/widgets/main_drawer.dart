import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/widgets/highlight_text_card.dart';
import '../../../../core/widgets/user_tile.dart';
import '../../domain/models/menu_section_model.dart';
import '../../domain/models/section_item_model.dart';
import 'menu_section_widget.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
      shape: InputBorder.none,
      child: Column(
        children: [
          Container(
            height: AppDimensions.appBarHeight,
            color: Colors.white,
            alignment: Alignment.center,
            child: Image.asset(
              AppAssets.logo,
              height: 30,
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.triangles),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppDimensions.padding10,
                    ),
                    child: UserTile(
                      selected: true,
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.padding24),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.padding16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MenuSectionWidget(
                        MenuSectionModel(
                          title: 'Main',
                          items: [
                            SectionItemModel(
                              icon: Icons.confirmation_num_sharp,
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
                              icon: Icons.book,
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
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
