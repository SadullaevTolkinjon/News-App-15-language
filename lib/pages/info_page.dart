import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newanewsapi/model/news_model.dart';

class InfoPAge extends StatefulWidget {
  var data;
  InfoPAge({Key? key, this.data}) : super(key: key);

  @override
  _InfoPAgeState createState() => _InfoPAgeState();
}

class _InfoPAgeState extends State<InfoPAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          widget.data!["urlToImage"].toString()),
                      fit: BoxFit.cover),
                ),
              ),
              flex: 3,
            ),
            Expanded(flex: 7,
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 70,
                            width: 5,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(
                            height: 70,
                            width: 320,
                            child: Text(
                              widget.data!['title'].toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 20),
                      child: Text(
                        widget.data['description'].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 20),
                      child: Text(
                        widget.data!['content'].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
