import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDetails({super.key, required this.newsModel});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.newsModel.title.toString()),
      ),
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: widget.newsModel.urlToImage.toString(),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(widget.newsModel.source!.name.toString()),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(widget.newsModel.publishedAt.toString()),
            ],
          ),
          Text(widget.newsModel.title.toString()),
          const SizedBox(
            height: 8,
          ),
          Text(widget.newsModel.description.toString()),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () async {
                final Uri uri = Uri.parse(widget.newsModel.url.toString());
                if (!await launchUrl(uri)) {
                  throw Exception("Could Not Launch");
                }
              },
              child: const Text("Read More..."))
        ],
      ),
    );
  }
}
