import 'package:api/service/Post.dart';
import 'package:api/service/http_servic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  bool _isLoading = false;
  var itms = [];
  @override
  void initState() {
    super.initState();
    _apiPostList();
  }

  void _apiPostList() async {
    setState(() {
      _isLoading = true;
    });
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    // .then((response) => {LogService.i(response.toString())});

    // if (response != null) {
    //   _isLoading = false;
    //   itms = Network.parsrPostList(response);
    //   print(response);
    // }

    try {
      if (response != null) {
        _isLoading = false;
        setState(() {
          itms = Network.parsrPostList(response);
        });
        print(response);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
        backgroundColor: Colors.blue,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: <Widget>[
                ListView.builder(
                  itemCount: itms.length,
                  itemBuilder: (context, index) {
                    return itmsHome(itms[index]);
                  },
                )
              ],
            ),
    );
  }

  Widget itmsHome(Post post) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            onPressed: (BuildContext contex) {},
            flex: 3,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: "Delet",
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Text("data")
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.amber,
              ),
            ),
            Text(post.body),
            Text(post.id.toString()),
            Text(post.userId.toString()),
          ],
        ),
      ),
    );
  }
}
