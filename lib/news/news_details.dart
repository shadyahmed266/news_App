import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../drawer/home_drawer.dart';
import '../my_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'home_details';

  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    News news = ModalRoute.of(context)?.settings.arguments as News;
    final fifteenAgo =
        DateTime.now().difference(DateTime.parse(news.publishedAt!));

    String time = timeago.format(DateTime.parse(news.publishedAt!));

    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset("assets/images/background.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              news.source?.name ?? '',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: news.urlToImage ?? '',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.28,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                      backgroundColor: MyTheme.primaryLightColor,
                    )),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  news.source?.name ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MyTheme.greyColor),
                ),
                Text(
                  news.title ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      textAlign: TextAlign.end,
                      time,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: double.infinity,
                  child: Text(
                    news.description ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () async{
                          await _launchURL(news.url!);
                        },
                        child: Text(
                          "View Full Article",
                          style: Theme.of(context).textTheme.titleMedium,
                        )),
                    Icon(Icons.play_arrow_rounded),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
