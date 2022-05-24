const GOOGLE_API_KEY = 'AIzaSyCDL4E6i_tXgD5XpOoZYO3wR2aTR2B0NiA';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double? latitude, double? longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=7&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,-$longitude&key=$GOOGLE_API_KEY';
  }
}