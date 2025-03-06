import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score/core/_.export.dart';
import 'package:live_score/features/scores/_.export.dart';
import 'package:live_score/features/scores/view/pages/match_detail_page.dart';
import 'package:live_score/features/scores/view/widgets/scores_filter_bottom_sheet.dart';
import 'package:live_score/product/_.export.dart';

class MatchListPage extends StatefulWidget {
  const MatchListPage({super.key});

  @override
  State<MatchListPage> createState() => _MatchListPageState();
}

class _MatchListPageState extends State<MatchListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (final _) async {
        await DependencyInjector.instance<ScoresCubit>().fetchScoresPeriodic();
      },
    );
  }

  @override
  void dispose() {
    DependencyInjector.instance<ScoresCubit>().reset();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => BlocBuilder<ScoresCubit, ScoresState>(
        bloc: DependencyInjector.instance<ScoresCubit>(),
        builder: (final context, final state) => Scaffold(
          appBar: CustomAppBar.page(
            title: 'Scores',
            actions: IconButton(
              onPressed: () async {
                DependencyInjector.instance<ScoresCubit>().pause();
                await showModalBottomSheet(
                  context: context,
                  builder: (final context) => const ScoresFilterBottomSheet(),
                );
                await DependencyInjector.instance<ScoresCubit>().fetchScoresPeriodic();
              },
              icon: const Icon(Icons.filter_list),
            ),
          ),
          body: Center(
            child: switch (state) {
              ScoresInitial() => const CircularProgressIndicator(),
              ScoresLoading() => const CircularProgressIndicator(),
              ScoresSuccess() => RefreshIndicator(
                  onRefresh: DependencyInjector.instance<ScoresCubit>().fetchScoresPeriodic,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (final context, final index) => InkWell(
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (final context) => MatchDetailPage(match: state.matches[index]),
                          ),
                        );
                      },
                      child: MatchItem(
                        team1: state.matches[index].home,
                        team2: state.matches[index].away,
                        matchTime: state.matches[index].startingAt,
                        time: state.matches[index].time,
                        score: state.matches[index].scores,
                        status: state.matches[index].status,
                      ),
                    ),
                    separatorBuilder: (final context, final index) => const SizedBox(height: 8),
                    itemCount: state.matches.length,
                  ),
                ),
              ScoresEmpty() => const Text('No matches available'),
              ScoresError() => Text(state.message),
            },
          ),
        ),
      );
}
