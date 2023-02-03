import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shoexsmass/models/usermodel.dart';
import 'package:shoexsmass/services/userservice.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void login({
    required String email,
    required String password
  }) async {
    emit(UserSigningIn());
    UserModel user = await UserService().login(
      email: email,
      password: password
    );
    emit(UserSigningInSuccess(user));
  }

  void register({
    required String fullName,
    required String email,
    required int phoneNumber,
    required String password
  }) async {
    emit(UserSigningUp());
    UserModel user = await UserService().register(
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      password: password
    );
    emit(UserSigningUpSuccess(user));
  }

  void fetch({
    required int userId
  }) async {
    emit(UserFetching());
    UserModel user = await UserService().fetch(
      userId: userId
    );
    emit(UserFetchingSuccess(user));
  }

  void update({
    required int id,
    required String fullName,
    required String email,
    required int phoneNumber,
    required String address,
    required String password,
    required int balance,
  }) async {
    emit(UserUpdating());
    UserModel user = await UserService().update(
      id: id,
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      password: password,
      balance: balance
    );
    emit(UserUpdatingSuccess(user));
  }
}
