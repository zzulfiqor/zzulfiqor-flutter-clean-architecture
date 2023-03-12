import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:providers_latihan/core/shared/value.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    log("Home Screen Created");
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoaded) {
            return ListView.builder(
                itemCount: state.user.data?.length ?? 0,
                itemBuilder: (_, index) {
                  var user = state.user.data?[index];
                  return ListTile(
                    title: Text("${user?.firstName} ${user?.lastName}"),
                    subtitle: Text(user?.email ?? ""),
                    leading: CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(user?.avatar ?? ""),
                    ),
                  );
                });
          } else if (state is HomeError) {
            return Container(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Data Load Failed.",
                      style: TextStyle(fontSize: Value.fontSizeHeader),
                    ),
                    const SizedBox(height: 10),
                    Text(state.message),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              child: Center(
                child: Text("Unknown Error."),
              ),
            );
          }
        },
      ),
    );
  }
}
