import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:to_do/Services/task_services.dart';
import 'package:to_do/components/add_task_sheet.dart';
import 'package:to_do/components/background_container.dart';
import 'package:to_do/components/calendar_container.dart';
import 'package:to_do/components/empty_task_message.dart';
import 'package:to_do/components/heading_container.dart';
import 'package:to_do/components/heading_content.dart';
import 'package:to_do/components/horizontal_calendar.dart';
import 'package:to_do/components/icon_button.dart';
import 'package:to_do/model/tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Tasks> taskList;
  String date = DateFormat('E, d MMM').format(DateTime.now());
  int current = 0;
  @override
  void initState() {
    retrieveTask(date);
    super.initState();
  }

  void retrieveTask(String date) {
    taskList = TaskServices().getTask(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 20,
        label: const Text('New Task'),
        heroTag: 'hero',
        icon: const Icon(Icons.add),
        backgroundColor: const Color(0xFF0B2647),
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          backgroundColor: Colors.transparent,
          builder: (context) => AddTaskSheet(
            onClose: () => setState(() => retrieveTask(date)),
          ),
        ),
      ).animate().slideY(duration: const Duration(milliseconds: 500)),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                // Top background image
                const HeadingContainer(
                  height: 280,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 13,
                        right: 13,
                        top: 15,
                        bottom: 80,
                      ),
                      child: HeadingContent(),
                    ),
                  ),
                ),

                //! Task list view builder
                Positioned(
                  top: 285,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: BackgroundContainer(
                      child: taskList.isEmpty
                          ? const EmptyTaskMessage(msg: 'No task at this date')
                          : ListView.builder(
                              itemCount: taskList.length,
                              itemBuilder: (BuildContext context, int index) {
                                Tasks task = taskList[index];
                                bool isActive = index == current;
                                return Padding(
                                    padding: EdgeInsets.only(
                                      top: index == 0 ? 25 : 0,
                                      bottom:
                                          index == taskList.length - 1 ? 95 : 0,
                                    ),
                                    child: TimelineTile(
                                      isFirst: index == 0,
                                      isLast: index == taskList.length - 1,
                                      beforeLineStyle: LineStyle(
                                        thickness: isActive ? 3 : 2,
                                        color: task.isDone
                                            ? Colors.green
                                            : isActive
                                                ? Colors.black
                                                : Colors.grey.shade400,
                                      ),
                                      indicatorStyle: IndicatorStyle(
                                        iconStyle: IconStyle(
                                          color: isActive || task.isDone
                                              ? Colors.white
                                              : Colors.grey.shade600,
                                          iconData: task.isDone
                                              ? Icons.check
                                              : Icons.calendar_month,
                                        ),
                                        width: 25,
                                        color: task.isDone
                                            ? Colors.green
                                            : isActive
                                                ? Colors.black
                                                : Colors.grey.shade400,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                      ),
                                      //! will move this part in separate folder
                                      endChild: timeLineTileChild(
                                        index,
                                        isActive,
                                        task,
                                      ),
                                    ).animate().slideY(
                                        duration:
                                            const Duration(milliseconds: 400)));
                              },
                            ),
                    ),
                  ),
                ),

                // Horizontal calendar
                Positioned(
                  top: 235,
                  right: 0,
                  left: 0,
                  child: CalendarContainer(
                    child: HorizontalCalendar(
                      date: DateTime.now(),
                      onDateSelected: (selectedDate) {
                        setState(() {
                          date = DateFormat('E, d MMM').format(
                            DateTime.parse(selectedDate),
                          );
                          retrieveTask(date);
                        });
                      },
                    ).animate().slideX(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell timeLineTileChild(
    int index,
    bool isActive,
    Tasks task,
  ) {
    return InkWell(
      onTap: () {
        debugPrint("task id${task.id}");
        setState(() => current = index);
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.all(12),
        duration: const Duration(milliseconds: 400),
        margin: EdgeInsets.only(right: isActive ? 12 : 30, bottom: 15, top: 15),
        height: isActive ? 160 : 140,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/wavy_lines.jpg'),
            fit: BoxFit.fill,
            opacity: isActive ? 0.3 : 0,
          ),
          color: task.isDone
              ? Colors.green[isActive ? 300 : 50]
              : isActive
                  ? const Color(0xFF2B3032)
                  : Colors.transparent.withAlpha(10),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            // Heading
            Positioned(
              top: 8,
              child: text(
                task.heading,
                isActive: isActive,
                weight: FontWeight.w600,
                size: 18,
              ),
            ),
            // Time
            Positioned(
              top: 0,
              right: 5,
              child: text(
                task.time,
                isActive: isActive,
                weight: FontWeight.w400,
              ),
            ),
            // About
            Positioned(
              top: 45,
              right: 0,
              left: 0,
              child: text(
                task.about,
                isActive: isActive,
              ),
            ),
            // Show delete/edit/complete buttons
            if (isActive)
              Positioned(
                bottom: -5,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //! Delete button
                    CustomIconButton(
                      onTap: () => TaskServices().deleteTask(task.id).then(
                            (value) => setState(
                              () {
                                taskList = TaskServices().getTask(date);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('Task deleted'),
                                  ),
                                );
                              },
                            ),
                          ),
                      bgColor: task.isDone
                          ? Colors.transparent
                          : const Color(0xFF292D2D),
                      color: task.isDone
                          ? Colors.red
                          : Colors.red.withOpacity(0.8),
                      icon: task.isDone
                          ? Icons.delete_forever_sharp
                          : Icons.delete,
                    ),
                    SizedBox(width: task.isDone ? 0 : 20),
                    //? Edit button
                    Visibility(
                      visible: !task.isDone,
                      child: CustomIconButton(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            isDismissible: false,
                            backgroundColor: Colors.transparent,
                            builder: (context) => AddTaskSheet(
                              onClose: () => setState(() => ''),
                              heading: task.heading,
                              about: task.about,
                              btnLabel: 'Edit',
                              time: task.time,
                              date: task.date,
                              id: task.id,
                            ),
                          ).then(
                            (value) => setState(
                              () => taskList = TaskServices().getTask(date),
                            ),
                          );
                        },
                        color: Colors.blue,
                        icon: Icons.edit,
                      ),
                    ),
                    SizedBox(width: task.isDone ? 0 : 20),
                    //* Completed button
                    Visibility(
                      visible: !task.isDone,
                      child: CustomIconButton(
                        onTap: () {
                          TaskServices().completeTask(task);
                          setState(() {
                            taskList = TaskServices().getTask(date);
                          });
                        },
                        color: Colors.green,
                        icon: Icons.check,
                      ),
                    ),
                  ],
                ),
              ).animate().slideX(duration: const Duration(milliseconds: 400)),
          ],
        ),
      ),
    );
  }

  Widget text(
    String text, {
    required bool isActive,
    double? size,
    FontWeight? weight,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: isActive ? Colors.white : Colors.black87,
        fontSize: size ?? 14,
        fontWeight: weight ?? FontWeight.w300,
      ),
    );
  }
}
