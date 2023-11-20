

class Quotemodel {
  final String quote;

  Quotemodel({required this.quote});

  factory  Quotemodel.fromMap(Map<String, dynamic> data) {
    return  Quotemodel(
      quote: data['quote'] ?? '',
    );
  }
}

