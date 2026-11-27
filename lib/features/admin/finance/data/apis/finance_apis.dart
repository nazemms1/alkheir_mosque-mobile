import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:alkheir_mosque/app/core/http/data/models/base_api_model.dart';
import 'package:alkheir_mosque/app/core/http/end_points.dart';

import '../models/finance_model.dart';
import '../params/finance_params.dart';

part 'finance_apis.g.dart';

@RestApi()
abstract class FinanceApis {
  factory FinanceApis(Dio dio) = _FinanceApis;

  @GET(EndPoints.financeSummary)
  Future<BaseApiModel<FinanceSummaryModel>> summary();

  @GET(EndPoints.financeCashBoxes)
  Future<BaseApiModel<List<CashBoxBalanceModel>>> cashBoxes();

  @GET(EndPoints.financeTransactions)
  Future<BaseApiModel<List<LedgerEntryModel>>> transactions(
    @Query('page') int page,
    @Query('per_page') int perPage, {
    @Query('cash_box_id') int? cashBoxId,
    @Query('direction') String? direction,
    @Query('date_from') String? dateFrom,
    @Query('date_to') String? dateTo,
  });

  @POST(EndPoints.financeAdjustments)
  Future<BaseApiModel<LedgerEntryModel>> postAdjustment(
      @Body() AdjustmentParams params);

  @GET(EndPoints.financeTransfers)
  Future<BaseApiModel<List<CashBoxTransferModel>>> transfers(
    @Query('page') int page,
    @Query('per_page') int perPage,
  );

  @POST(EndPoints.financeTransfers)
  Future<BaseApiModel<CashBoxTransferModel>> postTransfer(
      @Body() TransferParams params);

  @GET(EndPoints.financeExchanges)
  Future<BaseApiModel<List<CurrencyExchangeModel>>> exchanges(
    @Query('page') int page,
    @Query('per_page') int perPage,
  );

  @POST(EndPoints.financeExchanges)
  Future<BaseApiModel<CurrencyExchangeModel>> postExchange(
      @Body() ExchangeParams params);

  @GET(EndPoints.financeRequests)
  Future<BaseApiModel<List<FinanceRequestItemModel>>> requests(
    @Query('page') int page,
    @Query('per_page') int perPage, {
    @Query('type') String? type,
    @Query('status') String? status,
  });
}
