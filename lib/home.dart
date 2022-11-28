// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/NewsModel.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  NewsModel newsData =NewsModel();

  bool _isloading =false;

    @override
  void initState() {
    super.initState();
   
    getdata();
  }

   Future<http.Response?> getdata() async {
    setState(() {
      _isloading=true;
    });
   http.Response? _res = await http.get(
        Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2022-10-28&sortBy=publishedAt&apiKey=06326f2aa6e34e84868fb4e7684fba62'),
      );
    if (_res.statusCode==200) {
       setState(() {
     newsData =newsModelFromJson (_res.body);
     _isloading=false;
    });
      
      return _res;
    } else {
      return null;
    }
}
  @override
  Widget build(BuildContext context) {
     final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return Scaffold(
      appBar: AppBar(
      title: Container(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search in feed",
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.transparent),

                          ),
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0)
                        ),
                      ),
                    )
,
      ),
      body: _isloading==true?Center(child: CircularProgressIndicator()):
      Container(
        height: MediaQuery.of(context).size.height *1,
        child: ListView.builder(
                        itemCount:newsData.articles!.length,
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 4,
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            RichText(text: TextSpan(
                                              children: [
                                                TextSpan(text:formatter.format(DateTime.parse(newsData.articles![index].publishedAt!).toLocal()),style: TextStyle(color: Colors.black)),
                                                TextSpan(text :' '),
                                                TextSpan(text: newsData.articles![index].source!.name,style: TextStyle(color: Colors.black))
                                              ]
                                            )),
                                            SizedBox(height: 10,),
                                            RichText(
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                              children: [
                                                TextSpan(text: newsData.articles![index].title,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
                                              ]
                                            )),
                                            SizedBox(height: 10,),
                                            RichText(
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              text:
                                             TextSpan(
                                              children: [
                                                TextSpan(text: newsData.articles![index].description,style: TextStyle(color: Colors.blue,fontSize:12)),
                                              ]
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 90,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              newsData.articles![index].urlToImage==null?
                                              "https://img.freepik.com/free-vector/404-error-lost-space-concept-illustration_114360-7901.jpg?w=2000":
                                              newsData.articles![index].urlToImage!)
                                          )
                                        ),
                                      )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
        ),
      )
    );
  }
}