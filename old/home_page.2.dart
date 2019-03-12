import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import '../config/header_config.dart';

class homePage extends StatefulWidget {
  final Widget child;

  homePage({Key key, this.child}) : super(key: key);

  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String showText = '请求数据';

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: AppBar(title: Text('fdgdf'),),
        body: Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: _chooseAction,
                child:Text('请求数据'),
              ),
              Text(
                showText,
                overflow:TextOverflow.ellipsis,
                maxLines:1
              )
            ],
          ),
        ),
      )
    );
  }

  void _chooseAction(){
    print('开始选择类型...');
      getHttp().then((val){
        setState((){
          showText = val['data']['name'];
        });
      });
    
  }

  Future getHttp() async{
    try{
      Response response;
      Dio dio = new Dio(); 
      // dio.options.headers = httpheaders;
      response = await dio.get('https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian');
      return response.data;
    }catch(e){
      return print(e);
    }
  }
}