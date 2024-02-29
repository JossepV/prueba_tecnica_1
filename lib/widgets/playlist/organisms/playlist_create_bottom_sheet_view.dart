import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/widgets/common/atoms/text_button_view.dart';
import 'package:prueba_tecnica_1/widgets/common/molecules/bottom_sheet_container_view.dart';
import 'package:prueba_tecnica_1/widgets/playlist/organisms/playlist_content_tab_view.dart';
import 'package:prueba_tecnica_1/widgets/playlist/organisms/playlist_details_tab_view.dart';
import 'package:prueba_tecnica_1/widgets/playlist/organisms/playlist_privacy_tab_view.dart';

class PlaylistCreateBottomSheetView extends StatefulWidget {
  const PlaylistCreateBottomSheetView({Key? key}) : super(key: key);

  @override
  State<PlaylistCreateBottomSheetView> createState() =>
      _PlaylistCreateBottomSheetViewState();
}

class _PlaylistCreateBottomSheetViewState
    extends State<PlaylistCreateBottomSheetView> {
  late final TabController tabController =
      TabController(vsync: Scaffold.of(context), length: 3);
  final List<String> tabTitles = ['My Content', '', ''];

  int _selectedCount = 0;

  void _onCheckboxChanged(bool isChecked) {
    setState(() {
      if (isChecked) {
        _selectedCount++;
      } else {
        _selectedCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color colorPrimary = Theme.of(context).colorScheme.primary;
    final double maxHeight = MediaQuery.of(context).size.height * 0.95;
    // Move sorting contacts logic to a helper class later
    List<String> contacts =
        List<String>.generate(200, (index) => faker.person.name());
    contacts.sort();
    Map<String, List<String>> sections = {};
    for (var contact in contacts) {
      String firstLetter = contact[0].toUpperCase();
      if (sections[firstLetter] == null) sections[firstLetter] = [];
      sections[firstLetter]?.add(contact);
    }
    var sortedSections = sections.keys.toList()..sort();
    return Container(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: BottomSheetContainerView(
          height: maxHeight,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButtonView(
                      label: 'Cancel',
                      colorLabel: Colors.white.withOpacity(0.5),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      'Create New PlayList',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    TextButtonView(
                        colorLabel: colorPrimary,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        label: 'Save'),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 47),
                      height: 2,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    TabBar(
                      unselectedLabelColor: Colors.white,
                      labelColor: colorPrimary,
                      indicatorColor: colorPrimary,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 2,
                      controller: tabController,
                      tabs: const [
                        Tab(text: 'Content'),
                        Tab(text: 'Details'),
                        Tab(text: 'Privacy'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      MyContentTabView(
                        colorPrimary: colorPrimary,
                        selectedCount: _selectedCount,
                        onCheckboxChanged: _onCheckboxChanged,
                      ),
                      const DetailsTabView(),
                      PrivacyTabView(
                        sortedSections: sortedSections,
                        sections: sections,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
