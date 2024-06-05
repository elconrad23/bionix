import 'package:geolocator/geolocator.dart';
import '../data/clinic.dart';
import 'lat_lng.dart';
import 'location_model.dart';

Future<Location> getnearestLocation() async {
  
  LatLng userPosition = LatLng(37.7749, -122.4194);
  Location? nearestLocation;
  for (int i = 1; i < clinics.length; i++) {
    double distances = await calculateDistance(userPosition, clinics[i].location );
    double leastDistance= double.infinity;
    if (distances < leastDistance) {
      leastDistance = distances;
      nearestLocation = clinics[i];
    }
  }
  return nearestLocation!;
}

Future<double> calculateDistance(LatLng userPosition, LatLng fixedPosition) async {
  double distance = Geolocator.distanceBetween(
    userPosition.latitude,
    userPosition.longitude,
    fixedPosition.latitude,
    fixedPosition.longitude,
  );

  return distance / 1000; // Convert distance from meters to kilometers
}
