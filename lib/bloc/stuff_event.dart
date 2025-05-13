part of 'stuff_bloc.dart';

sealed class StuffEvent {}

final class StuffEventSetStuff extends StuffEvent {
  final String? title;
  final bool? flag;
  final List<Item>? items;

  StuffEventSetStuff({this.title, this.flag, this.items});
}
