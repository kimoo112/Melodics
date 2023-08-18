import 'package:audio/Helpers/Constants/colors.dart';
import 'package:audio/Helpers/Constants/navigate.dart';
import 'package:audio/Helpers/Constants/size.dart';
import 'package:audio/Model/featured_product_model.dart';
import 'package:audio/Views/Screens/details_view.dart';
import 'package:audio/Views/Widgets/add_to_cart_icon.dart';
import 'package:audio/Views/Widgets/cart_with_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../Widgets/search_bar.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool isEmpty = false;
  List<FeaturedModel> searchedList = featuredList;
  Future<void> searchForProducts(String value) async {
    searchedList = featuredList
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    isEmpty = searchedList.isEmpty;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CartWIthBadge(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: 'null',
                child: CustomSearchBar(
                  onTap: () {},
                  onChanged: (value) {
                    searchForProducts(value);
                  },
                ),
              ),
              const SizedBox(height: 20),
              isEmpty
                  ? isFilterEmpty(context)
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchedList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            title: GestureDetector(
                                 onTap: () {
                          navigateToP(
                              DetailsScreen(
                                  image: searchedList[index].image,
                                  name: searchedList[index].name,
                                  price: searchedList[index].price,
                                  rate: searchedList[index].rate),
                              context);
                        },
                              child: Text(
                                searchedList[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                            subtitle: GestureDetector(
                                 onTap: () {
                          navigateToP(
                              DetailsScreen(
                                  image: searchedList[index].image,
                                  name: searchedList[index].name,
                                  price: searchedList[index].price,
                                  rate: searchedList[index].rate),
                              context);
                        },
                              child: Text(
                                'USD ${searchedList[index].price}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: cMain),
                              ),
                            ),
                            leading: GestureDetector(
                                 onTap: () {
                          navigateToP(
                              DetailsScreen(
                                  image: searchedList[index].image,
                                  name: searchedList[index].name,
                                  price: searchedList[index].price,
                                  rate: searchedList[index].rate),
                              context);
                        },
                              child: Image.asset(searchedList[index].image)),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${searchedList[index].rate}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: cOrange),
                                ),
                                AddToCartIcon(
                                  index: index,
                                  list: searchedList,
                                  size: 18.sp,
                                )
                              ],
                            ),
                          ),
                        );
                      })
            ],
          ),
        ),
      ),
    );
  }

  Column isFilterEmpty(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: KHeight(context) * .1),
        Center(
            child: Column(
          children: [
            Lottie.asset('assets/images/Search Empty2.json', width: 270),
            SizedBox(height: 20.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No Search Results",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " Found",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: cMain),
                ),
              ],
            ),
          ],
        )),
      ],
    );
  }
}
