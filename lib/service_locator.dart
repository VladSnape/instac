import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:instac/auth/data/datasource/userdata.dart';
import 'package:instac/auth/data/impl/auth_impl.dart';
import 'package:instac/auth/domain/repo/auth_repo.dart';
import 'package:instac/auth/domain/usecases/loginuser_usecase.dart';
import 'package:instac/auth/domain/usecases/registreuser_usecase.dart';
import 'package:instac/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:instac/home/data/dataSource/instadata_source.dart';
import 'package:instac/home/data/impl/insta_impl.dart';
import 'package:instac/home/domain/repo/insta_repo.dart';
import 'package:instac/home/domain/usecase/editprofile_usecase.dart';
import 'package:instac/home/domain/usecase/follow_usecase.dart';
import 'package:instac/home/domain/usecase/getuserinfo_usecase.dart';
import 'package:instac/home/domain/usecase/openchatroom_usecase.dart';
import 'package:instac/home/domain/usecase/send_message_usecase.dart';
import 'package:instac/home/presentation/bloc/bloc/insta_bloc.dart';
import 'package:instac/home/presentation/bloc/followbloc/follow_bloc.dart';
import 'package:instac/home/presentation/bloc/messagebloc/bloc/message_bloc.dart';
import 'package:instac/home/presentation/bloc/openChatBloc/bloc/open_chat_bloc_bloc.dart';

final sl = GetIt.instance;
void init() {
// bloc
  sl.registerFactory(() => AuthBloc(sl(), sl()));
  //////// insta
  sl.registerFactory(
      () => InstaBloc(editProfileUseCase: sl(), getUserInfoUseCase: sl()));
  sl.registerFactory(() => FollowBloc(sl()));
  sl.registerFactory(() => MessageBloc(sl()));
  sl.registerFactory(() => OpenChatBlocBloc(sl()));
//use cases
  sl.registerLazySingleton(() => LoginUserUseCase(sl()));
  sl.registerLazySingleton(() => RegistreUserUseCase(sl()));
  ///////// insta
  sl.registerLazySingleton(() => EditProfileUseCase(sl()));
  sl.registerLazySingleton(() => GetUserInfoUseCase(sl()));
  sl.registerLazySingleton(() => FollowUseCase(sl()));
  sl.registerLazySingleton(() => SendMessageUseCase(sl()));
  sl.registerLazySingleton(() => OpenChatroomUseCase(sl()));

// repo impl
  sl.registerLazySingleton<AuthRepo>(() => AuthImpl(sl()));
  ///////// insta
  sl.registerLazySingleton<Instarepo>(() => InstaImpl(sl()));
// data dource impl
  sl.registerLazySingleton<UserData>(() => UserDataFireBase(sl(), sl()));
  //// insta
  sl.registerLazySingleton<InstadataSource>(
      () => InstadataSourceimplFire(sl()));
// other : firebase - firestore
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
}
