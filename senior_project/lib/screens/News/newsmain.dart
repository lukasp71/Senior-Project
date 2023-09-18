import 'package:flutter/material.dart';
import 'package:senior_project/screens/News/article_model.dart';
import 'package:senior_project/screens/News/api_service.dart';
import 'package:senior_project/screens/News/newssection.dart';
import 'package:senior_project/screens/News/customListTile.dart';
class _NewsPageState extends State <HomePage>{
  ApiService client = ApiService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cyber News Today", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
       
        ),
        body: FutureBuilder(
          future: client.getArticle(),
          builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot){
                if (snapshot.hasData){
                  List<Article>? articles = snapshot.data;
                  return ListView.builder(
                    itemCount: articles?.length,
                    itemBuilder: (context, index) => customListTile(articles![index])
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
          }
    ),
    );
  }
}