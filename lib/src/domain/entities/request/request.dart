class Request {
  int id;
  String? imagePath;
  String text;
  String? imageColor;
  List<Request>? requests;
  bool isReturned;
  String code;

  Request({
    required this.id,
    required this.text,
    this.imagePath,
    this.imageColor,
    this.requests,
    this.isReturned = false,
    this.code = '',
  });
}
