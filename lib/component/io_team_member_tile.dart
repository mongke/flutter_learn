import 'package:flutter/material.dart';

class TeamMember {
  final String role;
  final String name;
  final String imagePath;

  TeamMember({required this.role, required this.name, required this.imagePath});
}

class IoTeamMemberTile extends StatelessWidget {
  final TeamMember member;

  const IoTeamMemberTile({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 4),
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(member.imagePath),
      ),
      title: Text(member.role, style: TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text("name: ${member.name}", style: TextStyle(color: Colors.purple)),
      trailing: IconButton(
        icon: Icon(Icons.delete_outline, color: Colors.purple),
        onPressed: () {},
      ),
    );
  }
}
