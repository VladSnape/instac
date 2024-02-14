import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instac/auth/domain/entity/user_entity.dart';
import 'package:instac/home/presentation/bloc/bloc/insta_bloc.dart';
import 'package:instac/home/presentation/pages/editing_profile_page.dart';
import 'package:instac/home/presentation/widgets/instabutton.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<InstaBloc, InstaState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                actions: [
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<InstaBloc>(context).add(
                            GetYourInfoEvent(
                                FirebaseAuth.instance.currentUser!.uid));
                      },
                      icon: const Icon(
                        Icons.refresh,
                        size: 30,
                        color: Colors.black,
                      ))
                ],
                title: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      child: Text(
                        FirebaseAuth.instance.currentUser!.uid,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(13),
                child: BlocBuilder<InstaBloc, InstaState>(
                  builder: (context, state) {
                    if (state is InstaInitial) {
                      return buildProfilePageInInitial(context);
                    } else if (state is InstaLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is InstaYourInfoSeccessState) {
                      final user = state.user;
                      return buildProfilePageInSeccesss(user, context);
                    }
                    if (state is InstaYourInfoFailState) {
                      return Text(
                          'get user info failed state message : ${state.message}');
                    }
                    return const Text('i have no idea what satte you in');
                  },
                ),
              )),
        );
      },
    ));
  }

  SizedBox buildProfilePageInSeccesss(UserEntity user, BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 30,
                    width: 70,
                    child: Text(
                      '${user.name}',
                      style: const TextStyle(
                          overflow: TextOverflow.fade,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 130,
                    height: 50,
                    child: Text(
                      '${user.bio}',
                      style: const TextStyle(
                          overflow: TextOverflow.fade,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${user.posts?.length}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Posts',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${user.followers!.length}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Followers',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${user.following!.length}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Following',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InstaButton(
                themeColor: const Color.fromARGB(255, 185, 185, 185),
                text: 'Edit Profile',
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditingProfilePage()));
                },
              ),
              InstaButton(
                text: 'Share',
                function: () {},
                themeColor: const Color.fromARGB(255, 185, 185, 185),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                      unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
                      labelColor: Color.fromARGB(255, 0, 0, 0),
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.grid_4x4_sharp,
                          ),
                          text: 'Posts',
                        ),
                        Tab(
                          icon: Icon(
                            Icons.person_pin_circle_rounded,
                          ),
                          text: 'mentioned',
                        )
                      ]),
                  Expanded(
                      child: TabBarView(children: [
                    GridView.builder(
                      itemCount: user.posts!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            color: const Color.fromARGB(255, 86, 86, 86),
                          ),
                        );
                      },
                    ),
                    const Center(
                        child: Text(
                      'you have not been mentioned yet',
                    ))
                  ]))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

////////
  ///
  ///
  ///
  ///
  ///
  SizedBox buildProfilePageInInitial(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'user name',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'bio',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Posts',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '46',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Followrs',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '34',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InstaButton(
                themeColor: const Color.fromARGB(255, 185, 185, 185),
                text: 'Edit Profile',
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditingProfilePage()));
                },
              ),
              InstaButton(
                text: 'Share Profile',
                function: () {},
                themeColor: const Color.fromARGB(255, 185, 185, 185),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                      unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
                      labelColor: Color.fromARGB(255, 0, 0, 0),
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.grid_4x4_sharp,
                          ),
                          text: 'Posts',
                        ),
                        Tab(
                          icon: Icon(
                            Icons.person_pin_circle_rounded,
                          ),
                          text: 'mentioned',
                        )
                      ]),
                  Expanded(
                      child: TabBarView(children: [
                    GridView.builder(
                      itemCount: 5,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            color: const Color.fromARGB(255, 86, 86, 86),
                          ),
                        );
                      },
                    ),
                    const Center(
                        child: Text(
                      'you have not been mentioned yet',
                    ))
                  ]))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
