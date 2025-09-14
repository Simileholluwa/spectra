import 'package:spectra_client/spectra_client.dart';

final Map<String, MediaType?> mediaTypes = {
  'Images only': MediaType.image,
  'Videos only': MediaType.video,
  'Images and Videos': null,
};

final Map<String, bool?> downloadable = {
  'Any': null,
  'Download allowed': true,
  'Download not allowed': false,
};

final Map<String, bool?> prompts = {
  'Any': null,
  'Has prompt': true,
  'No/hidden prompt': false,
};

final Map<String, String> arrangeBy = {
  'Sort by likes': 'likes',
  'Sort by views': 'views',
  'Sort by downloads': 'downloads',
  'Sort by date': 'createdAt'
};

final Map<String, bool> sortDirection = {
  'Sort ascending': false,
  'Sort descending': true,
};
