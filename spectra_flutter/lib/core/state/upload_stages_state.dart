class UploadProgress {
  final bool getOriginalSignedUrl;
  final bool uploadOriginal;
  final bool getThumbnailSignedUrl;
  final bool uploadThumbnail;
  final bool storeVector;
  final bool saveArtwork;
  final bool completed;
  final bool idle;
  final bool started;
  final String message;
  final double progress;
  final bool hasError;

  UploadProgress({
    required this.getOriginalSignedUrl,
    required this.uploadOriginal,
    required this.getThumbnailSignedUrl,
    required this.uploadThumbnail,
    required this.storeVector,
    required this.saveArtwork,
    required this.completed,
    required this.idle,
    required this.started,
    required this.message,
    required this.progress,
    required this.hasError,
  });

  UploadProgress.initial()
      :
        message = '',
        progress = 0.00,
        getOriginalSignedUrl = false,
        uploadOriginal = false,
        getThumbnailSignedUrl = false,
        uploadThumbnail = false,
        storeVector = false,
        saveArtwork = false,
        completed = false,
        idle = true,
        started = false,
        hasError = false;

  UploadProgress copyWith({
    bool? getOriginalSignedUrl,
    bool? uploadOriginal,
    bool? getThumbnailSignedUrl,
    bool? uploadThumbnail,
    bool? storeVector,
    bool? saveArtwork,
    bool? completed,
    bool? idle,
    bool? started,
    String? message,
    double? progress,
    bool? hasError,
  }) {
    return UploadProgress(
      getOriginalSignedUrl: getOriginalSignedUrl ?? this.getOriginalSignedUrl,
      uploadOriginal: uploadOriginal ?? this.uploadOriginal,
      getThumbnailSignedUrl: getThumbnailSignedUrl ?? this.getThumbnailSignedUrl,
      uploadThumbnail: uploadThumbnail ?? this.uploadThumbnail,
      storeVector: storeVector ?? this.storeVector,
      saveArtwork: saveArtwork ?? this.saveArtwork,
      completed: completed ?? this.completed,
      idle: idle ?? this.idle,
      started: started ?? this.started,
      message: message ?? this.message,
      progress: progress ?? this.progress,
      hasError: hasError ?? this.hasError,
    );
  }
}
