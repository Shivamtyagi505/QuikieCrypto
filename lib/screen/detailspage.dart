
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quikiecrypto/favoritelistadd.dart';
import 'package:quikiecrypto/fetchdatafromserver/extractimageresponse.dart';
import 'package:quikiecrypto/fetchdatafromserver/fetchservices.dart';

import '../globaldata.dart';

class DetailsPAge extends StatefulWidget {
  GlobalData obj;

  DetailsPAge(this.obj);

  @override
  _DetailsPAgeState createState() => _DetailsPAgeState();
}

class _DetailsPAgeState extends State<DetailsPAge> {
  Future<ExtractImageResponse>? _futureFetchImage;
  late FavoriteListAdd listadd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _futureFetchImage = fetchCoinInfoImage(widget.obj.id.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
     listadd=Provider.of<FavoriteListAdd>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
            title: Text('QuikieApps Crypto Details'),
            //centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
            //backgroundColor: Colors.purple,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.red],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: LinearGradient(
           colors: [Colors.purple, Colors.red],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.2,
              //   //color: Colors.blue,
              //   padding: EdgeInsets.all(MediaQuery.of(context).padding.top),
              //   width: double.infinity,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         widget.obj.name,
              //         style: TextStyle(
              //             fontSize: 40,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white),
              //       ),
              //       Text(
              //         widget.obj.symbol,
              //         style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white),
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 40,horizontal: 20),
                height: MediaQuery.of(context).size.height * 0.8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Text('CryptoCurrencies Details',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
                      ),
                      Center(
                        child: (_futureFetchImage != null)
                            ? buildFutureBuilder()
                            : CircleAvatar(
                                radius: 10,
                                backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/100x100')),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                             Padding(
                               padding: EdgeInsets.symmetric(vertical: 20),
                               child: Row(
                                 children: [
                                   Text(
                                          "Currency Name : ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                   Text(
                                          "${widget.obj.name}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                 ],
                               ),
                             ),
                             Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                               child: Row(
                                 children: [
                                   Text(
                                          "Currency Symbol  : ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                   Text(
                                          "${widget.obj.symbol}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                 ],
                               ),
                             ),
                            Padding(
                               padding: EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                children: [
                                  Text('FirstHistoricalData : '),
                                  Text("${widget.obj.firstHistoricalData}",),
                                  
                                ],
                              ),
                            ),
                             Padding(
                               padding: EdgeInsets.symmetric(vertical: 20),
                               child: Row(
                                children: [
                                  Text('LastHistoricalData : '),
                                  Text("${widget.obj.lastHistoricalData}",),
                                  
                                ],
                            ),
                             ),
                            Padding(
                               padding: EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                children: [
                                  Text('Currency Rank : '),
                                  Text("${widget.obj.rank}",),
                                ],
                              ),
                            ),
                            /*Text("Symbol : ${widget.obj.symbol}",style: TextStyle(fontSize: 20),),
                        Text("Rank : ${widget.obj.rank}",style: TextStyle(fontSize: 20),),
                        Text("First Historical Data : ${widget.obj.firstHistoricalData}",style: TextStyle(fontSize: 20),),
                        Text("Last Historical Data : ${widget.obj.lastHistoricalData}",style: TextStyle(fontSize: 20),),*/
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent[100],
        onPressed: () {

          if(listadd.favoritelist.contains(widget.obj)){
            listadd.removeDataInFavoriteList(widget.obj);
          } else
            listadd.addDataInFavoriteList(widget.obj);
        },
        child:(listadd.favoritelist.contains(widget.obj))? Icon(Icons.favorite,color:Colors.red ,):Icon(Icons.favorite_border,),
      ),
    );
  }

  FutureBuilder<ExtractImageResponse> buildFutureBuilder() {
    return FutureBuilder<ExtractImageResponse>(
      future: _futureFetchImage,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          snapshot.data!.data!.the5!.logo;
          return CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage(snapshot.data!.data!.the5!.logo.toString()));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
