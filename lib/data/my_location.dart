import 'package:geolocator/geolocator.dart';

class MyLocation {
  late double latitude2;
  late double longitude2;

  Future<void> getMyCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (_checkPermission(permission) == false) {
      await Geolocator.requestPermission();
    } else
      print('locaiton permission : $permission');

    // LocationPermission permission = await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print(position);
    } catch (e) {
      print('또 안됐지롱 ㅋㅋㄹㅃㅃ');
    }
  }

  bool _checkPermission(LocationPermission permission) {
    if (permission == LocationPermission.always) return true;
    if (permission == LocationPermission.whileInUse) return true;
    return false;
  }
}
