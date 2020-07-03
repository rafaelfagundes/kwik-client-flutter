class ImageUtils {
  static String resizeCloudinaryImage(String name, int size) {
    const String _cloudinaryId = 'kardappio';

    String url =
        'https://res.cloudinary.com/$_cloudinaryId/image/upload/c_scale,w_$size/$name';
    return url;
  }

  static String resizeCloudinaryImageFromUrl(String url, int size) {
    const String _cloudinaryId = 'kardappio';

    var strings = url.split('/');
    String name = strings[strings.length - 1];

    String finalUrl =
        'https://res.cloudinary.com/$_cloudinaryId/image/upload/c_scale,w_$size/$name';
    return finalUrl;
  }
}
