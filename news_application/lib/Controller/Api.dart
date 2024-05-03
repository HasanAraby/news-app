import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/Models/Model/Article.dart';

class Api{
  List<Article> articles=[];
  getNews()async{
    
    var response=await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&apiKey=330ca0aaad2142668cb50d692a5afeb7'));
    var body=jsonDecode(response.body);

    if(body["status"]=="ok"){

     body["articles"].forEach((x){

       Article article=Article(
         title: x['title'],
         uri: x['uri'],
         image: x['image'],
         source: x['source']['name'],
       );
       articles.add(article);
      });


    }

    else{
       print ('no data');
    }
return articles ;
  }
  getNewsCategory(category)async{
    var response=await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=330ca0aaad2142668cb50d692a5afeb7'));
    var body=jsonDecode(response.body);

   try{
     if(body["status"]=="ok"){

       body['article'].forEach((x){

         Article article=Article(
           title: x['title'],
           uri: x['uri'],
           image: x['image'],
           source: x['source']['name'],
         );
         articles.add(article);
       });


     }

     else{
       print ('no data');
     }

   }

   catch(e){
     print(e);
   }
    return articles ;
   }
}

