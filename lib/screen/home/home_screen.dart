import 'package:flutter/material.dart';
import 'package:io_app/component/io_news_card.dart';
import 'package:io_app/component/io_title_item.dart';
import 'package:io_app/component/io_tournament_card.dart';
import 'package:io_app/component/profile_item.dart';
import 'package:io_app/theme/io_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 300,
          decoration: BoxDecoration(
            // color: IOColors.primary400,
            gradient: LinearGradient(
              colors: [
                IOColors.primary500, // Start color
                IOColors.primary400, // End color
              ],
              begin: Alignment.bottomLeft, // Gradient starts at the top
              end: Alignment.centerRight, // Gradient ends at the bottom
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Image.asset('assets/images/logo_1.png', height: 150, width: 150),
              Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile_user.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back!',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'David Smith',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: IOColors.primary500,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {
                        // Handle notification button press
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(height: 30),
            IoTitleItem(text: 'Tournaments', hasIcon: false ,),
            SizedBox(
              height: 180,
              child: ListView(
                
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                children: [
                  IoTournamentCard(
                    imagePath: 'assets/images/pubg.jpg',
                    titleText: 'Valorant',
                    statusText: 'In Progress',
                  ),
                  IoTournamentCard(
                    imagePath: 'assets/images/pubg.jpg',
                    titleText: 'Valorant',
                    statusText: 'In Progress',
                  ),
                  IoTournamentCard(
                    imagePath: 'assets/images/pubg.jpg',
                    titleText: 'Valorant',
                    statusText: 'In Progress',
                  ),
                ],
              ),
            ),
          
          
            // Row(
            //   children: [
            //     SizedBox(width: 20),
            //     SingleChildScrollView(
            //       scrollDirection:
            //           Axis.horizontal, // Enable horizontal scrolling
            //       padding: EdgeInsets.symmetric(
            //         horizontal: 16,
            //       ), // Add horizontal padding
            //       child: Row(
            //         children: [
                     
            //           IoTournamentCard(
            //             imagePath: 'assets/images/pubg.jpg',
            //             titleText: 'Valorant',
            //             statusText: 'In Progress',
            //           ),
                  
    
            //           // Add more cards
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(height: 20),
            IoTitleItem(text: 'News', hasIcon: true,),
            // Add your task list here
            IoNewsCard(
              imagePath: 'assets/images/pubg.jpg',
              title: 'Valorant',
            ),
            IoNewsCard(
              imagePath: 'assets/images/pubg.jpg',
              title: 'Valorant',
            ),
          ],
        ),
      ],
    );
  }
}
