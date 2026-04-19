import 'package:multiple_result/multiple_result.dart';
import 'package:habit/core/errors/failure.dart';
import 'package:habit/features/loading/domain/entities/loading_entity.dart';

abstract class LoadingRepositoryDomain {
    Future<Result<LoadingEntity, Failure>> getLoading();
}
