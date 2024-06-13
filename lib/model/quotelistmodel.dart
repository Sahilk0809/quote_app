class QuoteModel {
  String? quote;
  String? author;
  String? cate;

  List<QuoteModel> quoteModelList = [];

  QuoteModel({this.quote, this.author, this.cate});

  factory QuoteModel.fromQuote(Map m1) {
    return QuoteModel(quote: m1['quote'], author: m1['author'], cate: m1['cate']);
  }

  QuoteModel.toList({required List l1}) {
    for (int i = 0; i < l1.length; i++) {
      quoteModelList.add(
        QuoteModel.fromQuote(l1[i]),
      );
    }
  }
}