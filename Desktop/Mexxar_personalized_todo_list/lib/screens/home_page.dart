import 'package:flutter/material.dart';
import 'package:personalized_todo_list/screens/category_management.dart';


class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}
//all images icons

class _CategoryListState extends State<HomePage> {
  int _CategoryListIndex = 0;
  var categoryList = [
    {
      "name": "user",
      "icon": "/Users/madhu/Desktop/Mexxar_personalized_todo_list/lib/assets/user.png",
    },
    {
      "name": "suitcase",
      "icon":
          "/Users/madhu/Desktop/Mexxar_personalized_todo_list/lib/assets/suitcase.png",
    },
    {
      "name": "travel",
      "icon": "/Users/madhu/Desktop/Mexxar_personalized_todo_list/lib/assets/car.png",
    },
    {
      "name": "cardiogram",
      "icon":
          "/Users/madhu/Desktop/Mexxar_personalized_todo_list/lib/assets/cardiogram.png",
    },
  ];

  void setCategoryIndex(int currentIndex) {
    setState(() {
      _CategoryListIndex = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  SizedBox(height: 50.0),
                  Text(
                    "Hi, Ashen",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Today's Date: ${DateTime.now().toString().split(' ')[0]}",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SearchBar(
              hintText: 'Search...',
              leading: const Icon(Icons.search),
              
            ),IconButton(
                          onPressed: () {
                            print("filter Todo list");
                          },
                          icon: Icon(Icons.sort),
                        ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 100.0,
              width: double.infinity,
              child: ListView.builder(
                itemCount: categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setCategoryIndex(index);
                      print(categoryList[index]["name"]!);

// Navigate to the categorymanagement page

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryManagement()),
                      );
                    },
                    child: CategoryList(
                      imgAsset: categoryList[index]["icon"]!,
                      index: index,
                      isSelected: (_CategoryListIndex == index) ? true : false,
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "Track Your Work with progress",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final String imgAsset;
  final int index;
  final bool isSelected;

  const CategoryList({
    Key? key,
    required this.imgAsset,
    required this.index,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (index == 0)
          ? EdgeInsets.fromLTRB(20, 12, 10, 12)
          : EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      padding: (index == 0)
          ? EdgeInsets.symmetric(vertical: 20, horizontal: 25)
          : EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: (isSelected)
            ? Color.fromARGB(255, 142, 164, 186)
            : (index == 0)
                ? Colors.black12
                : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 7,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Image.asset(
        imgAsset,
        width: 60,
        height: 50,
      ),
    );
  }
}
