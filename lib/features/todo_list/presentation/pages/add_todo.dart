import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testproject/core/extentions/extention.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          context.go('/todo');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start, // ویجت‌ها به سمت چپ
            children: [
              GestureDetector(
                onTap: () {
                  context.go('/todo');
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.lightBlueAccent,
                ),
              ),
              Text(
                'Close',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 90),
              Text(
                'Task',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 37, 30, 33),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitlePage(),
                    SizedBox(height: 16),
                    AddTaskName(),
                    SizedBox(height: 30),
                    ShowHours(),
                    SizedBox(height: 30),
                    SelectedToday(),
                    SizedBox(height: 60),
                    WidgetButton(),
                    SizedBox(height: 14),
                    WidgetText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//! widget text
class WidgetText extends StatelessWidget {
  const WidgetText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'If you disable today, the task will be considered as tomorrow',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xff3C3C43).withAlpha(100),
      ),
    );
  }
}

//! button widget
class WidgetButton extends StatelessWidget {
  const WidgetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: Size(context.screenwidth * 0.8, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      ),
      child: Text(
        'Done',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}

//! selected today widget
class SelectedToday extends StatefulWidget {
  const SelectedToday({super.key});

  @override
  State<SelectedToday> createState() => _SelectedTodayState();
}

class _SelectedTodayState extends State<SelectedToday> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = true; //! وضعیت انتخاب شده
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Today',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Switch(
          value: isSelected,
          onChanged: (value) {
            setState(() {
              isSelected = !isSelected;
            });
            setState(() {});
          },
          activeColor: Colors.white,
          activeTrackColor: Colors.green,
        ),
      ],
    );
  }
}

//! show hours widget
class ShowHours extends StatelessWidget {
  const ShowHours({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenwidth * .7,
      child: Row(
        children: [
          Text(
            'Hour',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 20),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xff76801f).withAlpha(20),
            ),
            width: context.screenwidth * .3,
            height: 40,
            child: Text(
              '12 : 00',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(width: 15),
          Container(
            alignment: Alignment.center,
            width: context.screenwidth * .15,
            height: 36,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            child: Text(
              'AM',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

//! add task name widget
class AddTaskName extends StatelessWidget {
  const AddTaskName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Name',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 20),
        SizedBox(
          width: context.screenwidth * 0.5,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter task name',
              fillColor: Colors.transparent,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//! title widget
class TitlePage extends StatelessWidget {
  const TitlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Add a task',
      style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
    );
  }
}
