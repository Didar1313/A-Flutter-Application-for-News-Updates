import 'package:flutter/material.dart';
import 'package:newsapp/ui/allnews.dart';
import 'package:newsapp/ui/breaking_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(title: const Center(child: Text("Flutter News App",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.orange),)),
      bottom: const TabBar(
        tabs: [
          Tab(text: "Breaking News",),
          Tab(text: "All News",),
        ],
      ),
        backgroundColor: Colors.greenAccent,
      ),
      body: const TabBarView(
        children: [
          BreakingNews(),
          AllNews(),
        ],
      ),
    ));
  }
}
