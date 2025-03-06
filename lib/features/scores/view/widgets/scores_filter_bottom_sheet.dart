import 'package:flutter/material.dart';
import 'package:live_score/core/_.export.dart';
import 'package:live_score/features/scores/_.export.dart';
import 'package:live_score/product/_.export.dart';

class ScoresFilterBottomSheet extends StatefulWidget {
  const ScoresFilterBottomSheet({super.key});

  @override
  State<ScoresFilterBottomSheet> createState() => _ScoresFilterBottomSheetState();
}

class _ScoresFilterBottomSheetState extends State<ScoresFilterBottomSheet> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  SortTypes? sortType;
  OrderTypes? orderType = OrderTypes.defaultOrder;

  @override
  void initState() {
    animationController = BottomSheet.createAnimationController(this);
    super.initState();
  }

  Future<void> onApply() async {
    Navigator.of(context).pop();
    await DependencyInjector.instance<ScoresCubit>().changeFilter(sortType, orderType);
  }

  @override
  Widget build(final BuildContext context) => BottomSheet(
        animationController: animationController,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        enableDrag: false,
        onClosing: () {},
        builder: (final context) => StatefulBuilder(
          builder: (final context, final setState) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  const IconButton(onPressed: null, icon: SizedBox.shrink()),
                  const Spacer(),
                  Container(
                    height: 4,
                    width: 32,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      color: CustomColors.grey,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: IconButton(
                      onPressed: onApply,
                      icon: const Icon(Icons.close, color: CustomColors.primaryColor),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      child: Text('Sort by', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    ...SortTypes.values.map(
                      (final sortType) => RadioListTile<SortTypes>(
                        title: Text(sortType.label),
                        value: sortType,
                        groupValue: this.sortType,
                        onChanged: (final value) => setState(() => this.sortType = value),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      child: Text('Order by', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    ...OrderTypes.values.map(
                      (final orderType) => RadioListTile<OrderTypes>(
                        title: Text(orderType.label),
                        value: orderType,
                        groupValue: this.orderType,
                        onChanged: (final value) => setState(() => this.orderType = value),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: onApply,
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * .8,
                          child: const Center(
                            child: Text('Apply'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
