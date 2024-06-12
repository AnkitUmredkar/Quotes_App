class QuotesModel {
  String? quote;
  String? author;
  String? category;
  List<QuotesModel> quoteModelList = [];

  QuotesModel({this.author, this.quote, this.category});

  factory QuotesModel.fromQuote(Map data) {
    return QuotesModel(
      quote: data['quotes'],
      author: data['author'],
      category: data['category'],
    );
  }

  QuotesModel.toList(List q1) {
    for (int i = 0; i < q1.length; i++) {
      quoteModelList.add(QuotesModel.fromQuote(q1[i]));
    }
  }
}