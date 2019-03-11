import 'package:flutter/material.dart';
import '../sevice/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';


class homePage extends StatefulWidget {
  final Widget child;

  homePage({Key key, this.child}) : super(key: key);

  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String homePageContent = '正在获取数据';
  @override
  void initState() {
    // TODO: implement initState
    getHomePageContent().then((val){
      setState(() {
       homePageContent = val.toString(); 
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('超市'),),
      body: FutureBuilder(
        future:getHomePageContent(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var data = json.decode(snapshot.data.toString());
            List<Map> swiper = (data['data']['slides'] as List).cast();
            return Column(
              children:<Widget>[
                SwiperDiy(swiperDataList:swiper)
              ]
            );
          }else{
            return Center(
              child:Text('加载中....')
            );
          }
        },
      )
    );
  }
}

class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:222,
      child:Swiper(
        itemBuilder:(BuildContext context,int index){
          return Image.network("${swiperDataList[index]['image']}",fit:BoxFit.fill);
        },
        itemCount: 3,
        pagination:SwiperPagination(),
        autoplay:true,
      ),
    );
  }
}