
import 'package:flutter/material.dart';
import 'package:quikiecrypto/fetchdatafromserver/extractresponse.dart';
import 'package:quikiecrypto/fetchdatafromserver/fetchservices.dart';

import '../globaldata.dart';
import 'detailspage.dart';

class CurrentCurrencies extends StatefulWidget {
  const CurrentCurrencies({Key? key}) : super(key: key);

  @override
  _CurrentCurrenciesState createState() => _CurrentCurrenciesState();
}

class _CurrentCurrenciesState extends State<CurrentCurrencies> {
  Future<ExtractResponse>? _futureResponse;
  bool _loading = false;
  final List<MaterialColor> _colors = [
    //to show different colors for different cryptos
    Colors.blue,
    Colors.indigo,
    Colors.lime,
    Colors.teal,
    Colors.cyan
  ];
  void _openDetailsPage(GlobalData obj) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsPAge(obj)),
    );
  }
// takes in an object and color and returns a circle avatar with first letter and required color
  CircleAvatar _getLeadingWidget(String name, color) {
    return new CircleAvatar(
      backgroundColor: color,
      child: new Text(name[0],style: TextStyle(color: Colors.white),),
    );
  }

  _getMainBody() {
    if (_loading) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return new RefreshIndicator(
        child: buildFutureBuilder(),
        onRefresh: fetchCoinInfo,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _futureResponse = fetchCoinInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: (_futureResponse != null)
            ? _getMainBody()
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  FutureBuilder<ExtractResponse> buildFutureBuilder() {
    return FutureBuilder<ExtractResponse>(
      future: _futureResponse,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          snapshot.data!.data![0].name;

          return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                String name = (snapshot.data!.data![index].name).toString();
                int? id = snapshot.data!.data![index].id;
                String symbol = (snapshot.data!.data![index].symbol).toString();
                String slug=(snapshot.data!.data![index].slug).toString();
                int? rank = snapshot.data!.data![index].rank;
                int? isActive = snapshot.data!.data![index].isActive;
                DateTime? firstHistoricalData=snapshot.data!.data![index].firstHistoricalData;
                DateTime? lastHistoricalData=snapshot.data!.data![index].lastHistoricalData;
                Platform? platform=snapshot.data!.data![index].platform;
                return GestureDetector(
                    onTap: () => _openDetailsPage(GlobalData(
                        id: id,
                        name: name,
                        symbol: symbol,
                        slug: slug,
                        rank: rank,
                        isActive: isActive,
                        firstHistoricalData: firstHistoricalData,
                        lastHistoricalData: lastHistoricalData,
                        platform: platform)),
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 60,
                      child: Card(
                        color: Colors.grey[50],
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            _getLeadingWidget(name, Colors.redAccent),
                             Text((snapshot.data!.data![index].name).toString()),
                             Text((snapshot.data!.data![index].symbol).toString()),
                          ],),
                        ),
                      //     child: ListTile(
                      //        leading: _getLeadingWidget(name, Colors.redAccent),
                      //   title:
                      //           Text((snapshot.data!.data![index].name).toString()),
                      //   trailing:
                      //       Text((snapshot.data!.data![index].symbol).toString()),
                      // )
                      ),
                    ));
              });
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }

        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}
