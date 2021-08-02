
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quikiecrypto/favoritelistadd.dart';
import 'package:quikiecrypto/screen/splashScreen.dart';

import 'screen/currentcurrencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteListAdd>.value(
          value: FavoriteListAdd(),
        ),
      ],
      child: MyApp(),),
      );
  });
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}




//         home: DefaultTabController(
//           length: 2,
//           initialIndex: 0,
//           child: Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.teal,
//               elevation: 0.0,
//               centerTitle: true,
//               title: Column(
//                 children: [
//                   Text(
//                     "QuikieApps Crypto",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ],
//               ),
//               bottom: TabBar(
//                 tabs: [
//                   Tab(
//                     text: "Current Currencies",
//                   ),
//                   Tab(
//                     text: "Favorite",
//                   ),
//                 ],
//               ),
//             ),
//             body: TabBarView(
//               children: [
//                 CurrentCurrencies(),
//                 Favorite(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
