import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/model/news_model.dart';

class ApiService{
  final all_news_url="https://newsapi.org/v2/everything?q=apple&from=2024-05-12&to=2024-05-12&sortBy=popularity&apiKey=97a5599c74634426bc6d6da7e440b592";
  final breaking_news_url="https://newsapi.org/v2/top-headlines?country=us&apiKey=97a5599c74634426bc6d6da7e440b592";


  Future<List<NewsModel>> getAllNews()async{
    try{
      Response response=await get(Uri.parse(all_news_url));
      if(response.statusCode==200){
        Map<String,dynamic>json=jsonDecode(response.body);
        List<dynamic>body=json['articles'];
        List<NewsModel>articleslist=body.map((item) => NewsModel.fromJson(item)).toList();
        return articleslist;
      }
      else{
        throw("No news found");
      }
    }catch(e){
      print(e.toString());
      throw e;
    }
  }

  Future<List<NewsModel>> getBreakingNews()async{
    try{
      Response response=await get(Uri.parse(breaking_news_url));
      if(response.statusCode==200){
        Map<String,dynamic>json=jsonDecode(response.body);
        List<dynamic>body=json['articles'];
        List<NewsModel>articleslist=body.map((item) => NewsModel.fromJson(item)).toList();
        return articleslist;
      }
      else{
        throw("No news found");
      }
    }catch(e){
      throw e;
    }
  }

}