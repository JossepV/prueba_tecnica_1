import 'dart:ui';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/data/mock_repository.dart';
import 'package:prueba_tecnica_1/widgets/common/atoms/text_button_view.dart';
import 'package:prueba_tecnica_1/widgets/common/molecules/bottom_sheet_container_view.dart';
import 'package:prueba_tecnica_1/widgets/common/atoms/button_primary_view.dart';
import 'package:prueba_tecnica_1/widgets/common/molecules/custom_icon_button_view.dart';
import 'package:prueba_tecnica_1/widgets/playlist/organisms/playlist_card_list_content_view.dart';
import 'package:prueba_tecnica_1/widgets/playlist/organisms/playlist_thumbnail_view.dart';

class PlaylistCreateBottomSheetView extends StatefulWidget {
  const PlaylistCreateBottomSheetView({Key? key}) : super(key: key);

  @override
  State<PlaylistCreateBottomSheetView> createState() => _PlaylistCreateBottomSheetViewState();
}

class _PlaylistCreateBottomSheetViewState extends State<PlaylistCreateBottomSheetView> {
  late final TabController tabController = TabController(vsync: Scaffold.of(context), length: 3);
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
    List<String> contacts = List<String>.generate(200, (index) => faker.person.name());
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

class PrivacyTabView extends StatelessWidget {
  const PrivacyTabView({
    super.key,
    required this.sortedSections,
    required this.sections,
  });

  final List<String> sortedSections;
  final Map<String, List<String>> sections;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sortedSections.length,
      itemBuilder: (context, index) {
        String section = sortedSections[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Text(
              section,
              style:
                  const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...sections[section]!.map(
              (contact) => ListTile(
                title: Row(
                  children: [
                    Expanded(
                        child: Text(
                      contact,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    )),
                    CustomIconButtonView(
                      icon: Icons.add,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class DetailsTabView extends StatelessWidget {
  const DetailsTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        const PlaylistThumbnailView(),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Playlist Name',
            style: TextStyle(color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 51, 19, 49).withOpacity(0.3),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 2,
                ),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white.withOpacity(0.6),
                decoration: const InputDecoration(
                    border: InputBorder.none, hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Description',
            style: TextStyle(color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 51, 19, 49).withOpacity(0.3),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 2,
                ),
              ),
              child: TextField(
                maxLines: 12,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white.withOpacity(0.2),
                decoration: const InputDecoration(
                    border: InputBorder.none, hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

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
                    style:
                        TextStyle(color: colorPrimary, fontSize: 14, fontWeight: FontWeight.w600),
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
                      return PlaylistCardListContent(
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
