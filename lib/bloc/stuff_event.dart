part of 'stuff_bloc.dart';

sealed class StuffEvent {}

final class StuffEventSetTitle extends StuffEvent {
  final String? title;
  StuffEventSetTitle({this.title});
}

final class StuffEventSetFlag extends StuffEvent {
  final bool? flag;
  StuffEventSetFlag({this.flag});
}

final class StuffEventSetItems extends StuffEvent {
  final List<Item>? items;
  StuffEventSetItems({this.items});
}
