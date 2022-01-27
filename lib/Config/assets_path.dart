const String imageAssetsRoot = "assets/img/";

final String breeders = _getImagePath('shop.jpg');
final String disease = _getImagePath('disease.jpg');
final String profile = _getImagePath('profile.jpg');
final String clinic = _getImagePath('vet.jpg');

String _getImagePath(String filename) {
  return imageAssetsRoot + filename;
}
