import 'package:live_score/product/common/enums/order_types.dart';
import 'package:live_score/product/common/enums/sort_types.dart';

class LatestLivescoresRequestModel {
  LatestLivescoresRequestModel({
    this.sortType,
    this.orderType,
  });

  final SortTypes? sortType;
  final OrderTypes? orderType;

  Map<String, dynamic> toJson() => {
        if (sortType != null) SortTypes.queryKey: sortType?.key,
        if (orderType != null) OrderTypes.queryKey: orderType?.key,
      };
}
