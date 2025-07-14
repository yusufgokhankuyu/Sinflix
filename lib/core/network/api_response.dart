class ApiResponse {
  final int code;
  final String message;

  ApiResponse({required this.code, required this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(code: json['code'] ?? 0, message: json['message'] ?? '');
  }
}

class Pagination {
  final int totalCount;
  final int perPage;
  final int maxPage;
  final int currentPage;

  Pagination({
    required this.totalCount,
    required this.perPage,
    required this.maxPage,
    required this.currentPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalCount: json['totalCount'] ?? 0,
    perPage: json['perPage'] ?? 0,
    maxPage: json['maxPage'] ?? 0,
    currentPage: json['currentPage'] ?? 0,
  );
}
