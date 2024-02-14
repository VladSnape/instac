import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instac/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:instac/auth/presentation/pages/auth_state.dart';

import 'package:instac/firebase_options.dart';
import 'package:instac/home/presentation/bloc/bloc/insta_bloc.dart';
import 'package:instac/home/presentation/bloc/followbloc/follow_bloc.dart';
import 'package:instac/home/presentation/bloc/messagebloc/bloc/message_bloc.dart';
import 'package:instac/home/presentation/bloc/openChatBloc/bloc/open_chat_bloc_bloc.dart';
import 'package:instac/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OpenChatBlocBloc>(
          create: (_) => OpenChatBlocBloc(sl()),
        ),
        BlocProvider<MessageBloc>(
          create: (_) => MessageBloc(sl()),
        ),
        BlocProvider<InstaBloc>(
            create: (_) => sl<InstaBloc>()
              ..add(GetYourInfoEvent(FirebaseAuth.instance.currentUser!.uid))),
        BlocProvider<AuthBloc>(create: (_) => sl<AuthBloc>()),
        BlocProvider<FollowBloc>(create: (_) => sl<FollowBloc>()),
      ],
      child: MaterialApp(
        home: AuthStatePage(),
      ),
    );
  }
}
