import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final Map<String, List<String>>? errors;

  ApiErrorModel({this.message, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Get all error messages combined into a single string
  String getAllErrorMessages() {
    if (errors == null || errors!.isEmpty) {
      return message ?? 'Unknown error occurred';
    }

    return errors!.entries.map((entry) {
      final field = entry.key;
      final messages = entry.value.join(', ');
      return "$field: $messages";
    }).join('\n');
  }

  /// Get first error message (optional helper)
  String get firstErrorMessage {
    if (errors != null && errors!.isNotEmpty) {
      return errors!.values.first.first;
    }
    return message ?? 'Unknown error';
  }
}
