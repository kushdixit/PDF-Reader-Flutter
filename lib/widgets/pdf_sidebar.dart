import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PDFSidebar extends StatelessWidget {
  final bool isOpen;
  final List<SidebarSection> sections;
  final ValueChanged<int> onItemSelected;
  final int selectedPage;

  const PDFSidebar({
    super.key,
    required this.isOpen,
    required this.sections,
    required this.onItemSelected,
    this.selectedPage = 1,
  });

  @override
  Widget build(BuildContext context) {
    if (!isOpen) {
      return const SizedBox.shrink();
    }

    // Material (not Container/ColoredBox) so ListTile ink and background paint.
    return Material(
      color: AppTheme.white,
      child: SizedBox(
        width: 280,
        child: ListView.builder(
          itemCount: sections.length,
          itemBuilder: (context, sectionIndex) {
            final section = sections[sectionIndex];
            return _SidebarSectionWidget(
              section: section,
              selectedPage: selectedPage,
              onItemSelected: onItemSelected,
            );
          },
        ),
      ),
    );
  }
}

class _SidebarSectionWidget extends StatelessWidget {
  final SidebarSection section;
  final int selectedPage;
  final ValueChanged<int> onItemSelected;

  const _SidebarSectionWidget({
    required this.section,
    required this.selectedPage,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            border: const Border(
              bottom: BorderSide(color: AppTheme.borderGray),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              section.title,
              style: const TextStyle(
                color: AppTheme.darkText,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
        for (final item in section.items)
          _SidebarItemWidget(
            item: item,
            isSelected: selectedPage == item.page,
            onTap: () => onItemSelected(item.page),
          ),
      ],
    );
  }
}

class _SidebarItemWidget extends StatelessWidget {
  final SidebarItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _SidebarItemWidget({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      tileColor: isSelected ? AppTheme.hoverGray : null,
      title: Text(
        item.title,
        style: TextStyle(
          color: isSelected ? AppTheme.primaryGreen : AppTheme.darkText,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          fontSize: 13,
        ),
      ),
      selected: isSelected,
      selectedTileColor: AppTheme.hoverGray,
    );
  }
}

class SidebarItem {
  final String title;
  final int page;

  const SidebarItem({
    required this.title,
    required this.page,
  });
}

class SidebarSection {
  final String title;
  final List<SidebarItem> items;

  const SidebarSection({
    required this.title,
    required this.items,
  });
}
