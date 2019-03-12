import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class homePage extends StatefulWidget {
  final Widget child;

  homePage({Key key, this.child}) : super(key: key);

  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  TextEditingController typeController = TextEditingController();
  String showText = '欢迎你，宝贝';

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: AppBar(title: Text('fdgdf'),),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: typeController,
                decoration:InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText:'标题',
                  helperText: '解释内容'
                ),
                autofocus:false
              ),
              RaisedButton(
                onPressed: _chooseAction,
                child:Text('按钮选择'),
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
    if(typeController.text.toString()==''){
      showDialog(
        context: context,
        builder:(context)=>AlertDialog(title:Text('类型不能为空'))
      );
    }else{
      getHttp(typeController.text.toString()).then((val){
        setState((){
          showText = val['data']['name'];
        });
      });
    }
  }

  Future getHttp(String TypeText) async{
    try{
      Response response;
      var data = {'name':TypeText};
      response = await Dio().get('https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian',
        queryParameters:data
      );
      return response.data;
    }catch(e){
      return print(e);
    }
  }
}