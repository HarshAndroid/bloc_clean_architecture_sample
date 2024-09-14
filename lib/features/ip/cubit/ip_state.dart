part of 'ip_cubit.dart';

@immutable
sealed class IpState {}

final class IpInitial extends IpState {
  final IPDetailsModel ipDetails = IPDetailsModel();
}

final class IpLoading extends IpState {}

final class IpResult extends IpState {
  final IPDetailsModel ipDetails;

  IpResult({required this.ipDetails});
}
