class NewsCardModel {
  const NewsCardModel({
    required this.title,
    required this.bodyText,
    required this.author,
    required this.date,
    required this.viewCount,
    required this.messageCount,
  });

  final String title;
  final String bodyText;
  final String author;
  final String date;
  final String viewCount;
  final String messageCount;
}

final List<NewsCardModel> newsList = [
  const NewsCardModel(
    title: "BTC's Hash Rate Up More Than 600% In Two Years: CryptoQuant CEO",
    bodyText: "The insights platform Kaiko warned that the market may enter into a period...",
    author: "Steven Walgenbach",
    date: "July 19, 2023",
    viewCount: "780",
    messageCount: "12",
  ),
  const NewsCardModel(
    title: "Bitcoin Reigns, Dominates 99% of Inflows in Cryptocurrency Investments",
    bodyText: "Bitcoin's dominance: captures 99% of inflows in cryptocurrency..",
    author: "Vignesh Karunanidhi",
    date: "July 19,2023",
    viewCount: "640",
    messageCount: "17",
  ),
  const NewsCardModel(
    title: "BTC's Hash Rate Up More Than 600% In Two Years: CryptoQuant CEO",
    bodyText: "The insights platform Kaiko warned that the market may enter into a period...",
    author: "Steven Walgenbach",
    date: "July 19, 2023",
    viewCount: "780",
    messageCount: "12",
  ),
];