Future<Uri> deepLinkTransformer(Uri uri) async {
  if (uri.path == '/' && uri.fragment.isNotEmpty) {
    return uri.replace(path: uri.path.replaceFirst('/', uri.fragment));
  }
  return uri;
}
