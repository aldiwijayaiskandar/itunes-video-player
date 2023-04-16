import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_app/presentation/cubits/cubits.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoListCubit videoListCubit;

  @override
  void initState() {
    super.initState();

    videoListCubit = BlocProvider.of<VideoListCubit>(context);
    videoListCubit.getVideoList();
  }

  @override
  void dispose() {
    super.dispose();

    videoListCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<VideoListCubit, VideoListState>(
          builder: (_, state) {
            if (state is VideoListLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else if (state is VideoListErrorState) {
              return const Center(
                child: Text("Error Fetching Video List"),
              );
            }

            return Column(
              children: [
                Text(state.data.length.toString()),
              ],
            );
          },
        ),
      ),
    );
  }
}
