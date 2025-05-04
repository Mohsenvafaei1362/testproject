import 'package:flutter/material.dart';
import 'package:testproject/gen/assets.gen.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // لیست وضعیت هر چک‌باکس
  List<bool> isCheckedList = List.generate(5, (_) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        toolbarHeight: 60,
        actions: [Image.asset(Assets.images.unsplashYMSecCHsIBc.path)],
        actionsPadding: EdgeInsets.symmetric(horizontal: 18),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  ),
                  Text(
                    'Hide completed',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3478F6),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35),
              ListView.builder(
                itemCount: isCheckedList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Checkbox(
                          value: isCheckedList[index],
                          onChanged: (value) {
                            setState(() {
                              isCheckedList[index] = value ?? false;
                            });
                          },
                        ),
                        SizedBox(width: 13),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width *
                                  .7, // محدود کردن عرض به عرض موجود
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                                style: TextStyle(
                                  color: Color(0xff737373),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                softWrap:
                                    true, // برای اینکه متن به خط بعدی برود
                              ),
                            ),
                            SizedBox(height: 13),
                            Text(
                              '12:42 PM',
                              style: TextStyle(
                                color: Color(0xffA3A3A3),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              Text(
                'Tomorrow',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
              ),
              // Suggested code may be subject to a license. Learn more: ~LicenseLog:3418398354.
              SizedBox(height: 35),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 13),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 290,
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                                style: TextStyle(
                                  color: Color(0xff737373),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 13),
                            Text(
                              '12:42 PM',
                              style: TextStyle(
                                color: Color(0xffA3A3A3),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
