import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';

class DetailPage extends StatefulWidget {
  // const DetailPage({ Key? key }) : super(key: key);
  final NewsModel news;

  DetailPage(this.news);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
