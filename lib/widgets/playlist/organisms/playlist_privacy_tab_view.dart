import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/widgets/common/molecules/custom_icon_button_view.dart';

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
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
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
