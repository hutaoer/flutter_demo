import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true; // Remove to suppress visual layout
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('我的标题', style: TextStyle(),),
        ),
        // Change to buildColumn() for the other column example
        // body: Center(child: buildRow()),
        body: Text('body的内容啊啊啊'),
      ),
    );
  }

  Widget buildRow() =>
      // #docregion Row
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Image.network('https://static.aistarfish.com/front-release/file/F2022110812491246800007950.haixinjiankang.png'),
          ),
          Image.network('https://static.aistarfish.com/front-release/file/F2022110717015354700009779.down.png'),
        ],
      );
  // #enddocregion Row

  // Widget buildColumn() =>
  //     // #docregion Column
  //     Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         Image.asset('images/pic1.jpg'),
  //         Image.asset('images/pic2.jpg'),
  //         Image.asset('images/pic3.jpg'),
  //       ],
  //     );
  // #enddocregion Column
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Image.network('https://static.aistarfish.com/front-release/file/F2022110812491246800007950.haixinjiankang.png'),
//           Image.network('https://static.aistarfish.com/front-release/file/F2022110717015354700009779.down.png'),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(const MyApp());
// }