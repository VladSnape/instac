import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:instac/home/presentation/pages/users_profile_page.dart';
import 'package:instac/home/presentation/widgets/user_listtile.dart';

class OnSearchingPage extends StatefulWidget {
  const OnSearchingPage({super.key});

  @override
  State<OnSearchingPage> createState() => _OnSearchingPageState();
}

class _OnSearchingPageState extends State<OnSearchingPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 40,
          child: TextField(
            onChanged: (value) {
              // Trigger a rebuild when the user types to update the list
              setState(() {});
            },
            controller: searchController,
            decoration: InputDecoration(
              hintStyle: const TextStyle(fontSize: 20),
              hintText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred'),
            );
          } else {
            // Filter the list based on the search text
            final filteredUsers = snapshot.data!.docs.where((userDoc) {
              final userData = userDoc.data() as Map<String, dynamic>;
              final userName = userData['name']?.toLowerCase() ?? '';
              final searchText = searchController.text.toLowerCase();
              return userName.contains(searchText);
            }).toList();

            return ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user =
                    filteredUsers[index].data() as Map<String, dynamic>;

                return UserListTile(
                  userBio: ' ${user['bio']}',
                  userName: '${user['name']}',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserProfilePage(
                        userId: user['uid'],
                      ),
                    ));
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
