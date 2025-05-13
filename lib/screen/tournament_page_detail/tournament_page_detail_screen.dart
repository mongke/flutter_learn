import 'package:flutter/material.dart';
import 'package:io_app/component/io_button.dart';
import 'package:io_app/component/io_date_time_summary_card.dart';
import 'package:io_app/component/io_divider.dart';
import 'package:io_app/component/io_drop_down.dart';
import 'package:io_app/component/io_gap.dart';
import 'package:io_app/component/io_place_tile.dart';
import 'package:io_app/component/io_stage_selector.dart';
import 'package:io_app/component/io_team_card.dart';
import 'package:io_app/component/io_title_item.dart';
import 'package:io_app/theme/io_colors.dart';

class TournamentDetailsPage extends StatefulWidget {
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
  State<TournamentDetailsPage> createState() => _TournamentDetailsPageState();
}

class _TournamentDetailsPageState extends State<TournamentDetailsPage> {
  String selectedGroup = "Group C";
  String selectedDay = "March 28";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.titleText),
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
                    widget.imagePath,
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
                            'Game: ${widget.titleText}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('Maps:', style: const TextStyle(fontSize: 16)),
                          const SizedBox(height: 16),
                          Text(
                            widget.statusText,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Prize Pool: 10,000,000₮ / \$2,000',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              "Place",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Points",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Place",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Points",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            IoPlaceTile(
                              place: "1",
                              points: "10pts",
                              purple: true,
                            ),
                            IoPlaceTile(place: "5", points: "3pts"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            IoPlaceTile(
                              place: "1",
                              points: "10pts",
                              purple: true,
                            ),
                            IoPlaceTile(place: "5", points: "3pts"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            IoPlaceTile(
                              place: "1",
                              points: "10pts",
                              purple: true,
                            ),
                            IoPlaceTile(place: "5", points: "3pts"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IoGap(),
                  IoTitleItem(text: 'Schedule:'),
                  IoDateTimeSummaryCard(
                    entries: [
                      IoDateTimeEntry(
                        label: "Registration start",
                        date: "2025/03/17",
                        time: "23:03",
                      ),
                      IoDateTimeEntry(
                        label: "Registration end",
                        date: "2025/03/27",
                        time: "23:03",
                      ),
                      IoDateTimeEntry(
                        label: "Tournament start",
                        date: "2025/03/28",
                        time: "15:03",
                      ),
                      IoDateTimeEntry(
                        label: "Tournament end",
                        date: "2025/04/07",
                        time: "15:04",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Participants Tab
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Team A',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(16),
                    childAspectRatio: 0.8,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(6, (index) {
                      return Column(
                        children: [
                          IoTeamCard(
                            imagePath: 'assets/images/mongolz.png',
                            teamName: 'Mongolz',
                          ),
                          IoGap(),
                        ],
                      );
                    }),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Team B',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(16),
                    childAspectRatio: 0.8,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(6, (index) {
                      return Column(
                        children: [
                          IoTeamCard(
                            imagePath: 'assets/images/silent_crew.png',
                            teamName: 'Silent Crew',
                          ),
                          IoGap(),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
            // Results Tab
            SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    // IoStageSelector in a horizontal scrollable view
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          IoStageSelector(
                            stages: [
                              'Open Qualifier',
                              'Closed Qualifier',
                              'Main Event',
                              'Grand Finals',
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    IoDivider(),
                    IoDropDown(
                      label: "Select Group",
                      value: selectedGroup,
                      values: List.generate(
                        8,
                        (i) => "Group ${String.fromCharCode(65 + i)}",
                      ),
                      bottomSheetTitle: "Choose a Group",
                      onChanged: (val) => setState(() => selectedGroup = val),
                    ),
                    IoDivider(),
                    IoDropDown(
                      label: "Select Day",
                      value: selectedDay,
                      values: ["March 28", "March 29", "March 30"],
                      bottomSheetTitle: "Choose a Day",
                      onChanged: (val) => setState(() => selectedDay = val),
                    ),
                    IoDivider(),
                                      
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
