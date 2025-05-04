class Erro {
  int? code;
  String? message;

  Erro({
    this.code,
    this.message,
  });

  factory Erro.fromJson(Map<String, dynamic> json) => Erro(
        code: json['code'] ?? (json['status'] ?? json['statusCode']),
        message: json['message'] == null
            ? json['title']
            : json['message'] is String
                ? json['message']
                : null,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
      };
}
