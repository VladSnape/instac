// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instac/auth/domain/entity/user_entity.dart';
import 'package:instac/home/presentation/bloc/bloc/insta_bloc.dart';
import 'package:instac/home/presentation/bloc/followbloc/follow_bloc.dart';

import 'package:instac/home/presentation/pages/chat_room_page.dart';
import 'package:instac/home/presentation/widgets/instabutton.dart';

class UserProfilePage extends StatefulWidget {
  final String userId;
  const UserProfilePage({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  void initState() {
    BlocProvider.of<InstaBloc>(context).add(GetUserInfoEvent(widget.userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<InstaBloc>(context)
                    .add(GetUserInfoEvent(widget.userId));
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
              width: MediaQuery.sizeOf(context).width * 0.6,
              child: Text(
                widget.userId,
                style: const TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          child: Column(
            children: [
              BlocBuilder<InstaBloc, InstaState>(
                builder: (context, state) {
                  if (state is InstaUserInfoSeccessState) {
                    final UserEntity user = state.user;
                    return Row(
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
                            Text(
                              '${user.name}',
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${user.bio}',
                              style: const TextStyle(
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
                                  '${user.posts!.length}',
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Posts',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${user.followers!.length}',
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Followrs',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${user.following!.length}',
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
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
                    );
                  }
                  return const Row(
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
                            'not found',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'not found',
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
                                '00',
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
                                '00',
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
                                '00',
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
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<FollowBloc, FollowState>(
                    builder: (context, state) {
                      if (state is FollowUnfollowState) {
                        return InstaButton(
                          themeColor: const Color.fromARGB(255, 33, 243, 124),
                          text: '   follow   ',
                          function: () {
                            BlocProvider.of<FollowBloc>(context).add(
                                FollowUserEvent(
                                    yourId:
                                        FirebaseAuth.instance.currentUser!.uid,
                                    hisId: widget.userId));
                          },
                        );
                      } else if (state is FollowInitial) {
                        return InstaButton(
                          themeColor: const Color.fromARGB(255, 94, 94, 94),
                          text: '   init   ',
                          function: () {
                            BlocProvider.of<FollowBloc>(context).add(
                                FollowUserEvent(
                                    yourId:
                                        FirebaseAuth.instance.currentUser!.uid,
                                    hisId: widget.userId));
                          },
                        );
                      } else if (state is FollowUnfollowFailState) {
                        return InstaButton(
                          themeColor: Colors.red,
                          text: '   follow $state ',
                          function: () {
                            BlocProvider.of<FollowBloc>(context).add(
                                FollowUserEvent(
                                    yourId:
                                        FirebaseAuth.instance.currentUser!.uid,
                                    hisId: widget.userId));
                          },
                        );
                      }
                      return InstaButton(
                        themeColor: Colors.blue,
                        text: '   follow $state ',
                        function: () {
                          BlocProvider.of<FollowBloc>(context).add(
                              FollowUserEvent(
                                  yourId:
                                      FirebaseAuth.instance.currentUser!.uid,
                                  hisId: widget.userId));
                        },
                      );
                    },
                  ),
                  InstaButton(
                    text: '   Message   ',
                    function: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChatRoomPage(
                          reader: widget.userId,
                        ),
                      ));
                    },
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
                          'No posts to show here ',
                        ))
                      ]))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
