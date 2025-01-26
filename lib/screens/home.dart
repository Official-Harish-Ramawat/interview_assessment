import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:overlapped_carousel/overlapped_carousel.dart';
import 'package:untitled/models/bottomdata_model.dart';
import 'package:untitled/models/middledata_model.dart';
import 'package:untitled/models/topdata_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TopDataModel> getTopList = [];
  List<ShopByCategory> getMiddleCategoryList = [];
  List<ShopByFabric> getMiddleFabricList = [];
  List<Unstitched> getMiddleUnstitchedList = [];
  List<BoutiqueCollection> getMiddleBoutiqueList = [];
  List<RangeOfPattern> getRangeOfPatternList = [];
  List<DesignOccasion> getDesignOccasionList = [];
  bool isLoading = false; // Add a loading state

  final PageController _pageController = PageController();

  // Keep track of the current page index
  int _currentPage = 0;

  Color generateRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255, // Full opacity
      200 + random.nextInt(56), // Red (200-255 for lighter tones)
      200 + random.nextInt(56), // Green (200-255 for lighter tones)
      200 + random.nextInt(56), // Blue (200-255 for lighter tones)
    );
  }

  Future<void> getTopDataApi() async {
    setState(() {
      isLoading = true; // Indicate loading
    });

    try {
      var url = "https://app-interview.easyglue.in/top_repository.json";
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var apiData = jsonDecode(response.body)['main_sticky_menu'];
        print(apiData);
        print("apiData");
        List<TopDataModel> list = [];
        for (var data in apiData) {
          list.add(TopDataModel.fromJson(data)); // Correct JSON parsing
        }
        // if (mounted) {
        setState(() {
          getTopList = list;
          // print(getTopList.first.);
          print("getTopList");
        });
        // }
      } else {
        if (mounted) {
          setState(() {
            getTopList = [];
          });
        }
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false; // Stop loading
        });
      }
    }
  }

  Future<void> getMiddleCategoryDataApi() async {
    setState(() {
      isLoading = true; // Indicate loading
    });

    try {
      var url = "https://app-interview.easyglue.in/middle_repository.json";
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var apiData = jsonDecode(response.body)['shop_by_category'];
        print(apiData);
        print("apiData");
        List<ShopByCategory> list = [];
        for (var data in apiData) {
          list.add(ShopByCategory.fromJson(data)); // Correct JSON parsing
        }
        // if (mounted) {
        setState(() {
          getMiddleCategoryList = list;
          print(getMiddleCategoryList);
          print("getMiddleCategoryList");
        });
        // }
      } else {
        if (mounted) {
          setState(() {
            getMiddleCategoryList = [];
          });
        }
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false; // Stop loading
        });
      }
    }
  }

  Future<void> getMiddleFabricDataApi() async {
    setState(() {
      isLoading = true; // Indicate loading
    });

    try {
      var url = "https://app-interview.easyglue.in/middle_repository.json";
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var apiData = jsonDecode(response.body)['shop_by_fabric'];
        List<ShopByFabric> list = [];
        for (var data in apiData) {
          list.add(ShopByFabric.fromJson(data)); // Correct JSON parsing
        }
        // if (mounted) {
        setState(() {
          getMiddleFabricList = list;
        });
        // }
      } else {
        if (mounted) {
          setState(() {
            getMiddleFabricList = [];
          });
        }
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false; // Stop loading
        });
      }
    }
  }

  Future<void> getMiddleUnstitchedDataApi() async {
    setState(() {
      isLoading = true; // Indicate loading
    });

    try {
      var url = "https://app-interview.easyglue.in/middle_repository.json";
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var apiData = jsonDecode(response.body)['Unstitched'];
        List<Unstitched> list = [];
        for (var data in apiData) {
          list.add(Unstitched.fromJson(data)); // Correct JSON parsing
        }
        // if (mounted) {
        setState(() {
          getMiddleUnstitchedList = list;
        });
        // }
      } else {
        if (mounted) {
          setState(() {
            getMiddleUnstitchedList = [];
          });
        }
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false; // Stop loading
        });
      }
    }
  }

  Future<void> getMiddleBoutiqueDataApi() async {
    setState(() {
      isLoading = true; // Indicate loading
    });

    try {
      var url = "https://app-interview.easyglue.in/middle_repository.json";
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var apiData = jsonDecode(response.body)['boutique_collection'];
        List<BoutiqueCollection> list = [];
        for (var data in apiData) {
          list.add(BoutiqueCollection.fromJson(data)); // Correct JSON parsing
        }
        // if (mounted) {
        setState(() {
          getMiddleBoutiqueList = list;
        });
        // }
      } else {
        if (mounted) {
          setState(() {
            getMiddleBoutiqueList = [];
          });
        }
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false; // Stop loading
        });
      }
    }
  }

  Future<void> getBottomRangeOfPatternDataApi() async {
    setState(() {
      isLoading = true; // Indicate loading
    });

    try {
      var url = "https://app-interview.easyglue.in/bottom_repository.json";
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var apiData = jsonDecode(response.body)['range_of_pattern'];
        List<RangeOfPattern> list = [];
        for (var data in apiData) {
          list.add(RangeOfPattern.fromJson(data)); // Correct JSON parsing
        }
        // if (mounted) {
        setState(() {
          getRangeOfPatternList = list;
        });
        // }
      } else {
        if (mounted) {
          setState(() {
            getRangeOfPatternList = [];
          });
        }
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false; // Stop loading
        });
      }
    }
  }

  Future<void> getDesignOccasionListDataApi() async {
    setState(() {
      isLoading = true; // Indicate loading
    });

    try {
      var url = "https://app-interview.easyglue.in/bottom_repository.json";
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var apiData = jsonDecode(response.body)['design_occasion'];
        List<DesignOccasion> list = [];
        for (var data in apiData) {
          list.add(DesignOccasion.fromJson(data)); // Correct JSON parsing
        }
        // if (mounted) {
        setState(() {
          getDesignOccasionList = list;
        });
        // }
      } else {
        if (mounted) {
          setState(() {
            getDesignOccasionList = [];
          });
        }
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false; // Stop loading
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getTopDataApi();
    getMiddleCategoryDataApi();
    getMiddleFabricDataApi();
    getMiddleUnstitchedDataApi();
    getMiddleBoutiqueDataApi();
    getBottomRangeOfPatternDataApi();
    getDesignOccasionListDataApi();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_outlined, color: Colors.grey),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.card_travel_outlined,
                color: Colors.grey,
              ),
            )
          ],
          title: Image.asset(
            'assets/images/app_logo.png',
            fit: BoxFit.cover,
            width: 180,
          ),
        ),
        body:(isLoading)?
        Center(
            child:
            CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isLoading
                  ? const Center() // Show a loader while fetching data
                  : (getTopList.isEmpty)
                      ? const Center(
                          child: Text(
                              "No Data Available")) // Handle empty data gracefully
                      : SizedBox(
                          height: 110,
                          child: ListView.builder(
                            itemCount: getTopList.length,
                            padding: EdgeInsets.all(12),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 70,
                                margin: EdgeInsets.only(right: 8),
                                width:
                                    MediaQuery.of(context).size.width / 3 - 10,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.grey.withOpacity(0.2)),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                getTopList[index].image!,
                                              ),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            // Replace 8 with your desired radius
                                            topRight: Radius.circular(
                                                4), // Replace 4 with your desired radius
                                          ),
                                        )),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      getTopList[index].title!,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 11),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
              SizedBox(
                height: 2,
              ),
              if (getTopList.isNotEmpty &&
                  getTopList.first.sliderImages != null)
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,

                    enlargeCenterPage: true,
                  ),
                  items: getTopList.first.sliderImages!.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Card(
                          color: generateRandomColor(), // Assign a random color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 0,
                          child: Stack(
                            children: [
                              Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFFE3C6),
                                    // Assign a random color
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          item.image!,
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      // Replace 8 with your desired radius
                                      topRight: Radius.circular(
                                          4), // Replace 4 with your desired radius
                                    ),
                                  )),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(45, 20, 45, 20),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, -2),
                                              blurRadius: 5,
                                              color: Colors.black12)
                                        ]),
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            item.title!.toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            item.cta!.toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 8,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Shop by category',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              isLoading
                  ? const Center() // Show a loader while fetching data
                  : (getMiddleCategoryList.isEmpty)
                      ? const Center(
                          child: Text(
                              "No Data Available")) // Handle empty data gracefully
                      :
                      // First row (sticky)
                      Column(
                          children: [
                            _buildCategoryGrid(
                                getMiddleCategoryList.sublist(0, 3)),
                            SizedBox(height: 15), // Space between the rows
                            // Second row (sticky)
                            _buildCategoryGrid(
                                getMiddleCategoryList.sublist(3, 6)),
                          ],
                        ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Shop by Fabric Material',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              isLoading
                  ? const Center() // Show a loader while fetching data
                  : (getMiddleFabricList.isEmpty)
                      ? const Center(
                          child: Text(
                              "No Data Available")) // Handle empty data gracefully
                      : Column(
                          children: [
                            _buildFabricGrid(getMiddleFabricList.sublist(0, 3)),
                            SizedBox(height: 10), // Space between the rows
                            // Second row (sticky)
                            _buildFabricGrid(getMiddleFabricList.sublist(3, 6)),
                          ],
                        ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Unstitched',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              isLoading
                  ? const Center() // Show a loader while fetching data
                  : (getMiddleUnstitchedList.isEmpty)
                  ? const Center(
                  child: Text(
                      "No Data Available")) // Handle empty data gracefully
                  :
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CarouselSlider(
                  options: CarouselOptions(
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enlargeCenterPage: true,
                    height: 350,
                    viewportFraction: 0.63
                  ),
                  items: getMiddleUnstitchedList
                      .map((item) => Stack(
                        children: [
                          Center(
                              child: Image.network(item.image!,
                                  height: 350,
                                  fit: BoxFit.cover, width: 1000)),
                                        Container(
                                          width: 1000,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.transparent,
                                                Colors.transparent,
                                                Colors.black.withOpacity(0.7),
                                              ],
                                              begin: Alignment.topCenter,
                                              // Start the gradient at the top
                                              end: Alignment
                                                  .bottomCenter, // End the gradient at the bottom
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                item.description!.toUpperCase(),
                                                textAlign: TextAlign.center,softWrap: true,
                                                // overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Container(
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: Colors.black.withOpacity(0.5)
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    item.name!.toUpperCase(),
                                                    textAlign: TextAlign.center,softWrap: true,
                                                    // overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: generateRandomColor(),
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                      ))
                      .toList(),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Boutique collection',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              isLoading
                  ? const Center() // Show a loader while fetching data
                  : (getMiddleBoutiqueList.isEmpty)
                      ? const Center(
                          child: Text(
                              "No Data Available")) // Handle empty data gracefully
                      : Column(
                          children: [
                            SizedBox(
                              height: 480,
                              child: PageView.builder(
                                controller: _pageController,
                                itemCount: getMiddleBoutiqueList.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Image.network(
                                        getMiddleBoutiqueList[index]
                                            .bannerImage!,
                                        fit: BoxFit.cover,
                                        height: 480,
                                      ),
                                      IgnorePointer(
                                        ignoring: true,
                                        // Prevent interactions with this widget
                                        child: Container(
                                          height: 480,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.transparent,
                                                Colors.transparent,
                                                Colors.transparent,
                                                Colors.black.withOpacity(0.5),
                                                Colors.black.withOpacity(0.7),
                                                Colors.black.withOpacity(0.7),
                                              ],
                                              begin: Alignment.topCenter,
                                              // Start the gradient at the top
                                              end: Alignment
                                                  .bottomCenter, // End the gradient at the bottom
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 20,
                                        left: 15,
                                        right: 15,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  // Split the text dynamically
                                                  ..._getFormattedText(
                                                      getMiddleBoutiqueList[
                                                              index]
                                                          .name!
                                                          .toUpperCase()),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              getMiddleBoutiqueList[index]
                                                  .cta!
                                                  .toUpperCase(),
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    getMiddleBoutiqueList.length, (index) {
                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 0),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    height: _currentPage == index ? 10 : 5,
                                    width: _currentPage == index ? 10 : 5,
                                    decoration: BoxDecoration(
                                        color: _currentPage == index
                                            ? Colors.grey
                                            : Colors.grey.withOpacity(0.5),
                                        shape: BoxShape.circle),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Range Of Pattern',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              isLoading
                  ? const Center() // Show a loader while fetching data
                  : (getRangeOfPatternList.isEmpty)
                  ? const Center(
                  child: Text(
                      "No Data Available")) // Handle empty data gracefully
                  : Column(
                children: [
                  _buildRangeOfPatternGrid(getRangeOfPatternList.sublist(0, 5)),
                  SizedBox(height: 10), // Space between the rows
                  // Second row (sticky)
                  _buildRangeOfPatternGrid(getRangeOfPatternList.sublist(5, 10)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Design as per Occasion',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              isLoading
                  ? const Center() // Show a loader while fetching data
                  : (getDesignOccasionList.isEmpty)
                  ? const Center(
                  child: Text(
                      "No Data Available")) // Handle empty data gracefully
                  :
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns
                  crossAxisSpacing: 8.0, // Horizontal spacing
                  mainAxisSpacing: 8.0, // Vertical spacing
                  childAspectRatio: 0.9, // Aspect ratio for each grid item
                ),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: getDesignOccasionList.length, // Total number of items
                itemBuilder: (context, index) {
                  final item = getDesignOccasionList[index]; // Get the current item dynamically
                  return Stack(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                          image: DecorationImage(
                            image: NetworkImage(item.image!??''), // Replace with your image URL
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 42,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xffE6E6E6).withOpacity(0.8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name!.toUpperCase(),
                                  textAlign: TextAlign.start,softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  item.cta!.toUpperCase(),
                                  textAlign: TextAlign.start,softWrap: true,
                                  // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),

            ],
          ),
        ));
  }

  // Method to build the horizontal grid for each row
  Widget _buildCategoryGrid(List<ShopByCategory> data) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // Horizontal scrolling
        itemCount: data.length,
        padding: EdgeInsets.symmetric(horizontal: 5),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = data[index];
          return Padding(
            padding: const EdgeInsets.only(right: 6, left: 6),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.8,
              decoration: BoxDecoration(
                color:
                    Color(int.parse(item.tintColor!.replaceFirst('#', '0xFF')))
                        .withOpacity(0.3),
                border:
                    Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Color(
                          int.parse(item.tintColor!.replaceFirst('#', '0xFF'))),
                      image: DecorationImage(
                        image: NetworkImage(item.image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item.name!.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Method to build the horizontal grid for each row
  Widget _buildFabricGrid(List<ShopByFabric> data) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Horizontal scrolling
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = data[index];
          return Padding(
            padding: const EdgeInsets.only(right: 6, left: 6),
            child: Stack(
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(
                        int.parse(item.tintColor!.replaceFirst('#', '0xFF'))),
                    image: DecorationImage(
                      image: NetworkImage(item.image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black,
                      ],
                      begin: Alignment.topCenter,
                      // Start the gradient at the top
                      end: Alignment
                          .bottomCenter, // End the gradient at the bottom
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    // Align content to the bottom center
                    children: [
                      Positioned(
                        bottom: 20, // Adjust distance from the bottom
                        child: Text(
                          item.name!.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRangeOfPatternGrid(List<RangeOfPattern> data) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Horizontal scrolling
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = data[index];
          return Padding(
            padding: const EdgeInsets.only(right: 6, left: 6),
            child: Stack(
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFFE3C6),
                    image: DecorationImage(
                      image: NetworkImage(item.image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                        Colors.black,
                      ],
                      begin: Alignment.topCenter,
                      // Start the gradient at the top
                      end: Alignment
                          .bottomCenter, // End the gradient at the bottom
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    // Align content to the bottom center
                    children: [
                      Positioned(
                        bottom: 20, // Adjust distance from the bottom
                        child: SizedBox(
                          width: 100,
                          child: Text(
                            item.name!.toUpperCase(),
                            textAlign: TextAlign.center,softWrap: true,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<TextSpan> _getFormattedText(String text) {
    // Check if "FOR" exists in the text
    if (text.contains(" FOR ")) {
      // Split the text into parts
      List<String> parts = text.split(" FOR ");
      return [
        TextSpan(
          text: parts[0], // Text before "FOR"
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5),
        ),
        TextSpan(
          text: "\nFOR ", // The "FOR" word with a new line
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5),
        ),
        TextSpan(
          text: parts.length > 1 ? parts[1] : "", // Text after "FOR"
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5),
        ),
      ];
    } else {
      // If "FOR" doesn't exist, return the text as a single TextSpan
      return [
        TextSpan(
          text: text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ];
    }
  }

  List<Widget> widgets = List.generate(
    10,
        (index) => ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
      child: Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoFRQjM-wM_nXMA03AGDXgJK3VeX7vtD3ctA&s', //Images stored in assets folder
        fit: BoxFit.cover,
      ),
    ),
  );
}