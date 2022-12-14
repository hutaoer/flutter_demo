import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
  
  
  // getHttp();
  // debugPaintSizeEnabled = true; // Remove to suppress visual layout
  runApp(const MyApp());
}

void getHttp() async {
  try {
    var api = 'https://gateway-biz.aistarfish.net/metis/api/metis/doc/public/detail?docId=V2022052515562227800003380&sign=_lDqDbaEQqw7Px7AhbN-HLiqVmE&signDate=1669812473200';
    var response = await Dio().get(api);
    var data= jsonDecode(response.toString());
    print(data['data']);
    print(response.statusCode);
  } catch (e) {
    print(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context);
    // ScreenUtil.init(context,designSize: Size(750, 1334));
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: Scaffold(
            appBar: AppBar(
              title: Text('我的消息', style: TextStyle(fontSize: 20.sp),),
            ),
            // Change to buildColumn() for the other column example
            // body: Center(child: buildRow()),
            // body: Text('body的内容啊啊啊'),
            body: ListView(
              shrinkWrap: true, 
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                _buildMsgItem(),
                _buildMsgItem(),
                _buildMsgItem(),
              ],
            )
          ),
        );
      },
    );
  }

  Widget _buildMsgItem() => Container(
    height: 187.w,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('2020/12/02  12:24:54', style: TextStyle(fontSize: 14.sp, color: Color.fromRGBO(153, 153, 153, 1))),
        _buildInfo()
    ]), 
  );

  Widget _buildInfo() => Container(
    width: 343.w,
    height: 137.w,
    decoration: BoxDecoration(
     borderRadius: const BorderRadius.all(Radius.circular(8)).w,
     color: Color.fromRGBO(255, 255, 255, 1) 
    ),
    child: Column(children: [
      Text('会面通知', style: TextStyle(color: Color.fromRGBO(60, 60, 60, 1), fontSize: 16.sp)),
      Container(
        width: 343.w,
        height: 38.w,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 1.w, color: Color.fromRGBO(153, 153, 153, 1)))
        ),
        child: Text('查看详情', style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),),
      )
    ]),
  );

  Widget _buildEntryItem() => Container(
    width: ScreenUtil().setWidth(80.w),
    height: ScreenUtil().setHeight(48.w),
    child: Column(children: [
     Icon(Icons.star),
     Text('我的账户', style: TextStyle(fontSize: 14, color: Colors.blue),)
    ]),
  );

  Widget _buildEntryIcon() => Container(
    width: ScreenUtil().setWidth(24),
    height: ScreenUtil().setHeight(24),
    child: Image.network('https://static.aistarfish.com/front-release/file/F2022120118404601800009688.icon.png') 
  );

  Widget _buildUserCertification() => Container(
    width: ScreenUtil().setWidth(343.w),
    margin: const EdgeInsets.only(bottom: 12),
    decoration: BoxDecoration(
      color: Colors.white, 
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    child: Column(
      children: [
      _buildCertificationItem(),
      _buildCertificationItem(),
      _buildCertificationItem(),
    ]),
  );

  Widget _buildCertificationItem() => Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildIcon(),
        Text('实名认证', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),),
        Text('已认证', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.yellow),)
      ],
    ),
  );

  Widget _buildIcon() => Container(
    width: ScreenUtil().setWidth(40 * 2),
    height: ScreenUtil().setHeight(40 * 2),
    decoration: BoxDecoration(
      color: Colors.grey, 
      borderRadius: const BorderRadius.all(Radius.circular(40)),
    ),
  ); 

  Widget _buildDecoratedImage() => Container(
        width: ScreenUtil().setWidth(52 * 2),
        height: ScreenUtil().setHeight(52 * 2),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(52)),
        ),
        child: Image.network('https://sf-spectre.sh1a.qingstor.com/org/logo/b76904a356044f72b6806f778f6db04f.png')
      );

  Widget _buildQrcodeImage() => Container(
    width: ScreenUtil().setWidth(40 * 2),
    height: ScreenUtil().setHeight(40 * 2),
    child: Image.network('https://static.aistarfish.com/front-release/file/F2022120117114822800001347.qrcode.png')
  );

  Widget _buildUserInfo() {
    return Container(
      // width: ScreenUtil().setWidth(343),
      width: ScreenUtil().setWidth(343 * 2),
      height: ScreenUtil().setHeight(104 * 2),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.95),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildDecoratedImage(),
          _buildUserStuff(),
          _buildQrcodeImage()
      ],
      ),
    );
  }

  Widget _buildUserStuff() => Container(
    width: ScreenUtil().setWidth(400.w),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('姓名', style: TextStyle(fontSize: 20, color: Color.fromRGBO(43, 44, 45, 1))),
      Text('肿瘤科/主任医师', style: TextStyle(fontSize: 14, color: Color.fromRGBO(96, 97, 98, 1))),
      Text('浙江大学附属第二医院', style: TextStyle(fontSize: 14, color: Color.fromRGBO(96, 97, 98, 1)))
    ],
  ));
}