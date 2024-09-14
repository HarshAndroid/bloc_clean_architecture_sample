import 'package:bloc/bloc.dart';
import '../data/model/ip_details.dart';
import 'package:meta/meta.dart';

import '../data/repository/ip_repository.dart';

part 'ip_state.dart';

class IpCubit extends Cubit<IpState> {
  final IpRepository ipRepository;

  IpCubit(this.ipRepository) : super(IpInitial());

  Future<void> fetchIPDetails() async {
    emit(IpLoading());

    final model = await ipRepository.getIPDetails();

    emit(model != null ? IpResult(ipDetails: model) : IpInitial());
  }
}
