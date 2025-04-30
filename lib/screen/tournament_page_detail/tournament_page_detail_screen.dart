import 'package:flutter/material.dart';
import 'package:io_app/component/io_button.dart';
import 'package:io_app/component/io_gap.dart';
import 'package:io_app/component/io_place_tile.dart';
import 'package:io_app/component/io_title_item.dart';
import 'package:io_app/theme/io_colors.dart';

class TournamentDetailsPage extends StatelessWidget {
  final String titleText;
  final String statusText;
  final String imagePath;

  const TournamentDetailsPage({
    super.key,
    required this.titleText,
    required this.statusText,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(titleText),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Information'),
              Tab(text: 'Participants'),
              Tab(text: 'Results'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Information Tab
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Image
                  Image.asset(
                    imagePath,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  IoGap(),
                  IoTitleItem(text: 'Tournament Format'),
                  const SizedBox(height: 16),
                  // Text Container
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Game: $titleText',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('Maps:', style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 16),
                          Text(
                            statusText,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Price Pool: \10,000,000₮ / \$2,000',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IoGap(),
                  Center(
                    child: SizedBox(
                      width: 250,
                      child: IOButton(
                        label: 'Team Register',
                        onPressed: () {
                          // Handle registration logic
                          print('Register button pressed');
                        },
                        color: IOColors.primary500,
                      ),
                    ),
                  ),
                  IoGap(),
                  IoTitleItem(text: 'Point System:'),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Table rows
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IoPlaceTile(place: "1",points: "10pts", purple: true),
                            IoPlaceTile(place: "5", points:  "3pts"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IoPlaceTile(place: "2", points: "6pts", purple: true),
                            IoPlaceTile(place: "6", points: "2pts"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IoPlaceTile(place: "3", points: "5pts", purple: true),
                            IoPlaceTile(place: "7-8", points: "1pts"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IoPlaceTile(place: "4", points: "4pts", purple: true),
                            IoPlaceTile(place: "9-16", points: "0pts"),
                          ],
                        ),

                        SizedBox(height: 16),

                        // Bottom caption
                        Text(
                          "1 Elimination = 1 Point",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Participants Tab
            Center(
              child: Text(
                'Participants List',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            // Results Tab
            Center(
              child: Text('Results', style: const TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
