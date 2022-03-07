import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newanewsapi/model/news_model.dart';
import 'package:newanewsapi/service/news_service.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/svg.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  TabController? _tabController;
  String q = "business";
  String _dropValue = "en";
  String _sortedByValue = "relevancy";
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All news application"),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                curve: Curves.linear,
                child: Container(
                  width: double.infinity,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      "https://cdn.pixabay.com/photo/2017/06/10/07/22/news-2389226_1280.png"),
                )),
              ),
              ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            height: 200,
                            child: Column(
                              children: [
                                DropdownButton(
                                  value: _dropValue,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(
                                        "English",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: "en",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Arabic",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: "ar",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Deutch",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: "de",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Espanol",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: "es",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "France",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: "fr",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Hebrew",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: "he",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Italian",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: "it",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Niderlandians",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: "nl",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Norwegian",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: "no",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Portugal",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: "pt",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Russian",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: "ru",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Northern Sami",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: "se",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "Chinese",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      value: "zh",
                                    )
                                  ],
                                  onChanged: (val) {
                                    _dropValue = val.toString();
                                    setState(() {});
                                  },
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Save"))
                              ],
                            ),
                          ),
                        );
                      });
                },
                leading: Icon(
                  Icons.language,
                  color: Colors.blue,
                ),
                title: Text(
                  "Select language",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  
                  
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              height: 200,
                              child: Column(
                                children: [
                                  DropdownButton(
                                    value: _sortedByValue,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text(
                                          "Relevancy",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: "relevancy",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "Popularity",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: "popularity",
                                      ),
                                      DropdownMenuItem(
                                        child: Text(
                                          "Published",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: "publishedAt",
                                      ),
                                    ],
                                    onChanged: (val) {
                                      _sortedByValue = val.toString();
                                      setState(() {});
                                    },
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Save"))
                                ],
                              ),
                            ),
                          );
                        });
                  
                },
                leading: Icon(
                  Icons.star,
                  color: Colors.blue,
                ),
                title: Text("Sorted By",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: Icon(
                  Icons.schedule,
                  color: Colors.blue,
                ),
                title: Text("Reminders",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: Icon(
                  Icons.style,
                  color: Colors.blue,
                ),
                title:
                    Text("Tags", style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Text("Edit"),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.delete,
                  color: Colors.blue,
                ),
                title: Text(
                  "Trash",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
                title: Text("Settings",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await NewsApiService.getNewsApi(nom(q), til(_dropValue),sortlash(_sortedByValue));
          return setState(() {});
        },
        child: SafeArea(
          child: FutureBuilder(
            future: NewsApiService.getNewsApi(nom(q), til(_dropValue),sortlash(_sortedByValue)),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Shimmer(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Container(
                            height: 50,
                            width: 150,
                            color: Colors.grey,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: TabBar(
                            labelColor: Colors.black,
                            indicatorColor: Colors.orange,
                            tabs: [
                              Tab(
                                text: "business",
                              ),
                              Tab(
                                text: "entertainment",
                              ),
                              Tab(
                                text: "general",
                              ),
                              Tab(
                                text: "health",
                              ),
                              Tab(
                                text: "science",
                              ),
                              Tab(
                                text: "sports",
                              ),
                              Tab(
                                text: "technology",
                              ),
                            ],
                            controller: _tabController,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            height: 200,
                            width: 300,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    color: index % 2 == 0
                                        ? Colors.amber
                                        : Colors.blue,
                                  ),
                                  height: 200,
                                  width: 290,
                                );
                              },
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.only(top: 15),
                          sliver: SliverToBoxAdapter(
                            child: Text(
                              "Latest News",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                        SliverGrid(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                              return Card(
                                  child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 130,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0)),
                                          color: Colors.amber),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 80,
                                            width: 240,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Container(
                                          height: 45,
                                          width: 240,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("15 minutes ago"),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.bookmark))
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ));
                            }),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 150, crossAxisCount: 1))
                      ],
                    ),
                    gradient:
                        LinearGradient(colors: [Colors.grey, Colors.white]));
              } else if (NewsApiService.datas!.contains("nodata")) {
                return Center(
                  child: Text("Network error"),
                );
              } else {
                var data = NewsApiService.datas;

                return CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.only(top: 20),
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: 300,
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                      enabled: false,
                                      hintText: "Search",
                                      suffixIcon: Icon(Icons.search)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: TabBar(
                        onTap: (val) {
                          if (val == 0) {
                            q = "business";
                            setState(() {});
                          } else if (val == 1) {
                            q = "entertainment";
                            setState(() {});
                          } else if (val == 2) {
                            q = "general";
                            setState(() {});
                          } else if (val == 3) {
                            q = "health";
                            setState(() {});
                          } else if (val == 4) {
                            q = "science";
                            setState(() {});
                          } else if (val == 5) {
                            q = "sports";
                            setState(() {});
                          } else if (val == 6) {
                            q = "technology";
                            setState(() {});
                          }
                        },
                        isScrollable: true,
                        labelColor: Colors.black,
                        indicatorColor: Colors.orange,
                        tabs: [
                          Tab(
                            text: "business",
                          ),
                          Tab(
                            text: "entertainment",
                          ),
                          Tab(
                            text: "general",
                          ),
                          Tab(
                            text: "health",
                          ),
                          Tab(
                            text: "science",
                          ),
                          Tab(
                            text: "sports",
                          ),
                          Tab(
                            text: "technology",
                          ),
                        ],
                        controller: _tabController,
                      ),
                    ),
                   SliverPadding(padding: EdgeInsets.only(top: 20),sliver:  SliverToBoxAdapter(
                      child: Container(
                        height: 200,
                        width: 300,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          NewsApiService.datas![index]
                                                  ["urlToImage"]
                                              .toString()),
                                      fit: BoxFit.cover)),
                              height: 200,
                              width: 290,
                            );
                          },
                          itemCount: NewsApiService.datas!.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),),
                    SliverPadding(
                      padding: EdgeInsets.only(top: 15),
                      sliver: SliverToBoxAdapter(
                        child: Text(
                          "Latest News",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    SliverGrid(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Card(
                            child: InkWell(
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 130,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                NewsApiService.datas![index]
                                                        ["urlToImage"]
                                                    .toString()),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0)),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 80,
                                            width: 240,
                                            child: Text(
                                              NewsApiService.datas![index]
                                                      ["title"]
                                                  .toString(),
                                              maxLines: 4,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 45,
                                          width: 240,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(NewsApiService.datas![index]
                                                      ["publishedAt"]
                                                  .toString()),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.bookmark))
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "/info",
                                    arguments: NewsApiService.datas![index]);
                              },
                            ),
                          );
                        }, childCount: NewsApiService.datas!.length),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 150, crossAxisCount: 1))
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  nom(String data) {
    return data;
  }

  til(String til) {
    return til;
  }

  sortlash(String sort) {
    return sort;
  }
}
