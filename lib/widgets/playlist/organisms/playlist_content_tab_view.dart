import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/data/mock_repository.dart';
import 'package:prueba_tecnica_1/widgets/common/atoms/button_primary_view.dart';
import 'package:prueba_tecnica_1/widgets/playlist/organisms/playlist_item_list_view.dart';

class MyContentTabView extends StatelessWidget {
  const MyContentTabView({
    super.key,
    required this.colorPrimary,
    required int selectedCount,
    required this.onCheckboxChanged,
  }) : _selectedCount = selectedCount;

  final Color colorPrimary;
  final int _selectedCount;
  final void Function(bool) onCheckboxChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "My content",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Upload from device',
                    style: TextStyle(
                        color: colorPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  ListView.builder(
                    itemCount: MockRepository.items.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return PlaylistItemListView(
                        gridItemModel: MockRepository.items[index],
                        onCheckboxChanged: onCheckboxChanged,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Visibility(
          visible: _selectedCount > 0,
          child: Positioned(
            bottom: 1,
            left: 80,
            child: ButtonPrimaryView(
              label: 'Select ($_selectedCount) and continue',
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
