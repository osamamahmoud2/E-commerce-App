part of 'layout_cubit.dart';

@immutable
sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}

class ChangeCurrentIndex extends LayoutState {}

final class GetCategorySuccessState extends LayoutState {}

final class GetCategoryFailureState extends LayoutState {}

final class GetCategoryLoudingState extends LayoutState {}

final class GetBannerSuccessState extends LayoutState {}

final class GetBannerFailureState extends LayoutState {}

final class IncreamentPrice extends LayoutState {}

final class DecreamentPrice extends LayoutState {}

final class ChangeReadFlag extends LayoutState {}
