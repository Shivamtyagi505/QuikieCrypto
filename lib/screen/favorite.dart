
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../favoritelistadd.dart';
import '../globaldata.dart';
import 'detailspage.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  void _openDetailsPage(GlobalData obj) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsPAge(obj)),
    );
  }
CircleAvatar _getLeadingWidget(String name, color) {
    return new CircleAvatar(
      backgroundColor: color,
      child: new Text(name[0],style: TextStyle(color: Colors.white),),
    );
  }
  @override
  Widget build(BuildContext context) {
    final FavoriteListAdd getlistoffav = Provider.of<FavoriteListAdd>(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: (getlistoffav.favoritelist.length != 0)
          ? ListView.builder(
              itemCount: getlistoffav.favoritelist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () =>
                      _openDetailsPage(getlistoffav.favoritelist[index]),
                  child: Container(
                    height: 60,
                    child: Card(
                      color: Colors.grey[50],
                       child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            _getLeadingWidget(getlistoffav.favoritelist[index].name, Colors.redAccent),
                             Text(getlistoffav.favoritelist[index].name.toString()),
                             Text(getlistoffav.favoritelist[index].symbol.toString()),
                          ],),
                        ),
                    ),
                  ),
                );
              })
          : Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
        children: [
            Container(
              margin:
                  EdgeInsets.only(top: 100,),
              child: Image.asset(
                'assets/icon/noOrder.png',
                height: 162,
              ),
            ),
            Container(
                margin:
                    EdgeInsets.only( top: 50),
                child: Text(
                  'No Favourite Currency Found',
                  style: TextStyle(
                      color: Color(0xffC7C7C7),
                      fontSize: 25),
                )),
            Container(
              margin:
                  EdgeInsets.only( top: 50),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(10),
                  color: Color(0xffC7C7C7)),
              child: FlatButton(
                onPressed: () {
                },
                child: Center(
                  child: Text(
                    'Add Currencies!!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25),
                  ),
                ),
              ),
            ),
        ],
      ),
          ),
    );
  }
}
