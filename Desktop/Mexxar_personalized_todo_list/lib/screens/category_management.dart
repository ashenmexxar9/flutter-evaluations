import 'package:flutter/material.dart';
import 'package:personalized_todo_list/components/category.dart';

class CategoryManagement extends StatefulWidget {
  const CategoryManagement({Key? key}) : super(key: key);

  @override
  State<CategoryManagement> createState() => _CategoryManagement();
}
//Controllers title and body

class _CategoryManagement extends State<CategoryManagement> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  List<Category> category = List.empty(growable: true);

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Task'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: bodyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Body',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
            SizedBox(height: 20),
            //save todo list
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    String title = titleController.text.trim();
                    String body = bodyController.text.trim();
                    if (title.isNotEmpty && body.isNotEmpty) {
                      setState(() {
                        titleController.text = '';
                        bodyController.text = '';
                        category.add(Category(title: title, body: body));
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 54, 54, 54),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Save'),
                ),
                //update todo list
                ElevatedButton(
                  onPressed: () {
                    String title = titleController.text.trim();
                    String contact = bodyController.text.trim();
                    if (title.isNotEmpty && contact.isNotEmpty) {
                      setState(() {
                        titleController.text = '';
                        bodyController.text = '';
                        category[selectedIndex].title = title;
                        category[selectedIndex].body = contact;
                        selectedIndex = -1;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 0, 0, 0),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Update'),
                ),
              ],
            ),
            SizedBox(height: 20),
            category.isEmpty
                ? Text(
                    '',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: category.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: index % 2 == 0
              ? const Color.fromARGB(255, 0, 0, 0)
              : const Color.fromARGB(255, 134, 134, 134),
          foregroundColor: Colors.white,
          radius: 24,
          child: Text(
            category[index].title[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category[index].title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              category[index].body,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
         //edit todo list   
         InkWell(
                onTap: () {
                  titleController.text = category[index].title;
                  bodyController.text = category[index].body;
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Icon(
                  Icons.edit,
                  color: Color.fromARGB(255, 4, 145, 180),
                ),
              ),
              //delete todo list
              InkWell(
                onTap: () {
                  setState(() {
                    category.removeAt(index);
                  });
                },
                child: Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 255, 17, 0),
                ),
              ),
              Icon(
                Icons.check,
                color: Colors.green,
                size: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
