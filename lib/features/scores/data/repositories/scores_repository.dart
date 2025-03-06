import 'package:live_score/core/_.export.dart';
import 'package:live_score/features/scores/_.export.dart';
import 'package:live_score/product/common/enums/sort_types.dart';

class ScoresRepository {
  ScoresRepository(this._baseRequest);

  final IBaseRequest _baseRequest;

  Future<DataState<ScoresResponseModel>> fetchScores(final LatestLivescoresRequestModel requestModel) async {
    final response = await _baseRequest.request(
      requestParam: RequestParams(
        endPoint: Endpoints.latestLivescores,
        requestBody: requestModel.toJson(),
      ),
      responseParams: ResponseParams(fromJson: ScoresResponseModel.fromJson),
    );

    if (response is DataFailed) {
      return response;
    }
    return switch (requestModel.sortType) {
      null => response,
      SortTypes.leagueName => DataSuccess(
          ScoresResponseModel(
            data: ScoresResponseModelData(
              match: response.data?.matches
                ?..sort(
                  (final a, final b) => a.competition?.name?.compareTo(b.competition?.name ?? '') ?? 0,
                ),
            ),
          ),
        ),
      SortTypes.countryName => DataSuccess(
          ScoresResponseModel(
            data: ScoresResponseModelData(
              match: response.data?.matches
                ?..sort(
                  (final a, final b) => a.country?.name?.compareTo(b.country?.name ?? '') ?? 0,
                ),
            ),
          ),
        ),
      SortTypes.startingAt => DataSuccess(
          ScoresResponseModel(
            data: ScoresResponseModelData(
              match: response.data?.matches
                ?..sort(
                  (final a, final b) => a.startingAt.compareTo(b.startingAt),
                ),
            ),
          ),
        ),
    };
  }
}
