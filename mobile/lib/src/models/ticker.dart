class Ticker {
  int? id;
  int? user;
  String? ticker;
  int? quantity;

  Ticker({this.id, this.user, this.ticker, this.quantity});

  Ticker.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    user = json["user"];
    ticker = json["ticker"];
    quantity = json["quantity"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "id": id,
      "user": user,
      "ticker": ticker,
      "quantity": quantity,
    };
    return data;
  }
}