import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? hasPrefixIcon;
  final String? hintText;
  final String? label;
  final IconData? icon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final int maxLines;
  final bool showBorder;
  final bool eyeCheck;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool isPassword;
  final double verticalPadding;
  final double horizontalPadding;
  final int maxLength;
  final GestureTapCallback? onEyeClick;
  final enabledReadonly;
  final bool enabledFiled;
  final Function(String)? onChanged;
  final GestureTapCallback? onTap;

  CustomTextField({
    this.controller,
    this.hasPrefixIcon = false,
    this.label,
    this.hintText,
    this.suffix,
    this.prefixIcon,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.obscureText = false,
    this.eyeCheck = false,
    this.isPassword = false,
    this.textInputAction = TextInputAction.done,
    this.maxLength = 1000,
    this.verticalPadding = 16,
    this.horizontalPadding = 16,
    this.onEyeClick,
    this.showBorder = false,
    this.enabledReadonly = false,
    this.enabledFiled = true,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: enabledReadonly,
      enabled: enabledFiled,
      obscureText: obscureText,
      textAlign: TextAlign.start,
      onTap: onTap,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      textInputAction:
      maxLines == 1 ? textInputAction : TextInputAction.newline,
      maxLines: maxLines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$label is required.";
        }
        return null;
      },
      decoration: InputDecoration(
        // hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70),
        labelText: hintText,
        labelStyle: TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        suffixIcon:
        suffix ??
            (!isPassword
                ? null
                : GestureDetector(
              onTap: onEyeClick,
              child:
              eyeCheck
                  ? Icon(Icons.remove_red_eye_outlined)
                  : Icon(Icons.visibility_off_outlined),
            )),
        prefixIcon:
        prefixIcon ??
            (hasPrefixIcon == true
                ? Icon(
              icon,
              color: AppColors.grey,
              size: 22,
            ) // Display the search icon if true
                : null),
      ),
      style: TextStyle(color: Colors.white, fontSize: 13),
      onChanged: onChanged,
    );
  }
}


/////////////////////////////////////////////


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Profile", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: "Posts"),
              Tab(text: "Followers"),
              Tab(text: "Following"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProfilePosts(),
            FollowersScreen(),
            FollowersScreen(),
          ],
        ),
      ),
    );
  }
}

// ---------------- PROFILE POSTS ----------------
class ProfilePosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildHeader(),
        Divider(),
        _buildPost("What is your preferred work environment?",
            ["In a large crowded office", "In a quiet workspace"]),
        _buildPost("Which tech event are you most excited for in 2025?",
            ["Turku AI Conference", "Seoul Web Summit"]),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          height: 120,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlue],
            ),
          ),
        ),
        const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: Icon(Icons.person, size: 50),
        ),
        const SizedBox(height: 8),
        const Text("Benjamin Lee",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Text("@BenjaminLee2345 · Fresno, CA",
            style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 5),
        const Text(
          "Digital Goodies Team · Web & Mobile UI/UX Development · Graphics · Illustrations",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text("112 Following · 15 Followers",
            style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 10),
        ElevatedButton(onPressed: () {}, child: Text("Edit Profile")),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildPost(String question, List<String> options) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question, style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          ...options.map((opt) =>
              OutlinedButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(opt),
                ),
              )),
        ],
      ),
    );
  }
}

// ---------------- FOLLOWERS SCREEN ----------------
class FollowersScreen extends StatelessWidget {
  final List<Map<String, String>> followers = [
    {"name": "Sophia Davis", "handle": "@SophiaDavis33"},
    {"name": "David Miller", "handle": "@DavidMiller25"},
    {"name": "Ava Martinez", "handle": "@AvaMartinez92"},
    {"name": "Liam Walker", "handle": "@LiamWalker44"},
    {"name": "William Harris", "handle": "@WilliamHarris14"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: followers.length,
      itemBuilder: (context, index) {
        final f = followers[index];
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(f["name"]!),
          subtitle: Text(f["handle"]!, style: TextStyle(color: Colors.grey)),
          trailing: ElevatedButton(
            onPressed: () {},
            child: Text("Follow"),
          ),
        );
      },
    );
  }
}

// // ---------------- FOLLOWING SCREEN ----------------
// class FollowingScreen extends StatelessWidget {
//   final List<Map<String, String>> following = [
//   {"name": "Quantum Quest", "handle": "@QuantumQuest"},
// {"name": "Olivia Bond", "handle": "@OliviaBond45"},
// {"name": "SunnyDay_22", "handle": "@SunnyDay_22"},
// {"name": "Isabella King", "handle": "@IsabellaKing"},
// {"name": "Epic Explorer", "handle": "@EpicExplorer"},
// {"name": "Daniel Wong", "handle": "@DanielWong87"},
// {"name":











