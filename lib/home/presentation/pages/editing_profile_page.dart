import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instac/home/presentation/bloc/bloc/insta_bloc.dart';

class EditingProfilePage extends StatefulWidget {
  const EditingProfilePage({super.key});

  @override
  State<EditingProfilePage> createState() => _EditingProfilePageState();
}

class _EditingProfilePageState extends State<EditingProfilePage> {
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            size: 40,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<InstaBloc>(context).add(EditProfileEvent(
                    userId: currentUserId,
                    bio: bioController.text,
                    newUserName: userNameController.text));
                BlocProvider.of<InstaBloc>(context)
                    .add(GetYourInfoEvent(currentUserId));
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                size: 40,
                color: Colors.blue,
              ))
        ],
        title: const Row(
          children: [
            Text(
              'Editing Page',
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<InstaBloc, InstaState>(
          builder: (context, state) {
            if (state is InstaLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is InstaYourInfoFailState) {
              return Text(
                  'get user info failed state message : ${state.message}');
            } else if (state is InstaYourInfoSeccessState) {
              return Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'User Name',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextField(
                        controller: userNameController,
                        decoration:
                            const InputDecoration(hintText: 'user name'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bio',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextField(
                        controller: bioController,
                        decoration: const InputDecoration(hintText: 'bio'),
                      ),
                    ],
                  ),
                ],
              );
            }
            return const Text('i have no idea what satte you in');
          },
        ),
      ),
    );
  }
}
