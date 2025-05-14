import 'package:flutter/material.dart';
import 'package:io_app/component/io_team_member_tile.dart';

class TeamDetailScreen extends StatelessWidget {
  final String teamName;
  final String rank;
  final List<TeamMember> members;

  const TeamDetailScreen({
    super.key,
    required this.teamName,
    required this.rank,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Banner
          Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/login_backgound_image.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(32),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                top: 40,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/mongolz.png"),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          teamName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(rank, style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.camera_alt, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),

          // Member List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: members.length,
              itemBuilder: (context, index) {
                final member = members[index];
                return IoTeamMemberTile(member: member);
              },
            ),
          ),

          // Add Member Button
          Padding(
            padding: EdgeInsets.all(16),
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add member"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.purple,
                side: BorderSide(color: Colors.purple),
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
