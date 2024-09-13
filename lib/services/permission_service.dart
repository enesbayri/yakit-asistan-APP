import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yakit_asistan/models/user_location.dart';

getLocation() async {
  permissionControl();
}

permissionControl() async {
  if (await Permission.location.isGranted) {
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    UserLocation.latitude = location.latitude;
    UserLocation.longitude = location.longitude;
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    UserLocation.userPlace = placeMarks[0].administrativeArea ?? "";
  } else {
    // Kullanıcıdan izin iste
    final status = await Permission.location.request();
    if (status.isGranted) {
      // Kullanıcı tarafından izin verildi
      var location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      UserLocation.latitude = location.latitude;
      UserLocation.longitude = location.longitude;
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);
      UserLocation.userPlace = placeMarks[0].administrativeArea ?? "";
    } else {
      // Kullanıcı tarafından izin reddedildi
    }
  }
}
