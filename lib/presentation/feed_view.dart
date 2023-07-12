import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyll_test/cubits/cubits.dart';
import 'package:hyll_test/models/adventure_model.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Feed",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          context.read<AdventureCubit>().refreshData();
          return Future.delayed(Duration(seconds: 1));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0).copyWith(top: 20),
          child: BlocBuilder<AdventureCubit, AdventureState>(
            builder: (context, adventureState) {
              if (adventureState is AdventureLoaded) {
                return BlocProvider(
                  create: (context) =>
                      AdventureActionCubit(context.read<AdventureCubit>()),
                  child:
                      BlocBuilder<AdventureActionCubit, AdventureActionState>(
                    builder: (context, adventureActionState) {
                      return Container(
                        child: Stack(
                          children: List.generate(
                              (adventureState is AdventureLoading &&
                                      adventureState
                                          .adventureModel.data!.isNotEmpty)
                                  ? adventureState.adventureModel.data!.length +
                                      1
                                  : adventureState.adventureModel.data!.length,
                              (index) {
                            if (index ==
                                adventureState.adventureModel.data!.length)
                              return Loader();
                            return FeedTileWidget(
                              index: index,
                              data: adventureState.adventureModel.data![index],
                            );
                          }),
                        ),
                      );
                    },
                  ),
                );
              } else if (adventureState is AdventureError) {
                return Center(child: Text(adventureState.message));
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

class FeedTileWidget extends StatelessWidget {
  FeedTileWidget({
    super.key,
    required this.index,
    required this.data,
  });
  int index;
  Adventures data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0).copyWith(top: index.toDouble() + 8),
      child: Dismissible(
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            context.read<AdventureActionCubit>().positiveAction();
          } else {
            context.read<AdventureActionCubit>().negativeAction();
          }
        },
        key: UniqueKey(),
        child: Container(
          height: MediaQuery.of(context).size.height * .8,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue.shade800,
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 8,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Stack(
              children: [
                Container(
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: data.contents!.first.contentUrl!,
                            fit: BoxFit.fill,
                            width: double.maxFinite,
                            height: double.maxFinite,
                          )),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                            child: Container(
                              height: double.maxFinite,
                              width: double.maxFinite,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              imageUrl: data.contents!.first.contentUrl!,
                            )),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                        child: Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          data.title ?? '',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: CachedNetworkImage(
                                            imageUrl: data.activityIcon!,
                                            height: 16,
                                          )),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    data.description ?? '',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
