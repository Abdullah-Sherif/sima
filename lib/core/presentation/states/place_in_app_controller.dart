import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';

StateNotifierProvider<PlaceInAppController, PlaceInApp> placeInAppControllerProvider =
    StateNotifierProvider<PlaceInAppController, PlaceInApp>((ref) => PlaceInAppController());

class PlaceInAppController extends StateNotifier<PlaceInApp> {
  PlaceInAppController() : super(PlaceInApp.landing);

  void setPlaceInApp(PlaceInApp placeInApp) {
    state = placeInApp;
  }
}
