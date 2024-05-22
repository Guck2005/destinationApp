import 'package:flutter/material.dart';
import 'package:login_signup/pages/home/widgets/customBottomNavigationBar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({Key? key}) : super(key: key);

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  late CalendarController _calendarController;
  Map<DateTime, List<dynamic>> _events = {};

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
      ),
      body: SfCalendar(
        view: CalendarView.month,
        dataSource: MeetingDataSource(_getDataSource()),
        monthViewSettings: MonthViewSettings(
          showAgenda: true,
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          showTrailingAndLeadingDates: false, // Masquer les jours du mois suivant et précédent
        ),
        timeSlotViewSettings: TimeSlotViewSettings(
          startHour: 9,
          endHour: 16,
          nonWorkingDays: <int>[DateTime.friday, DateTime.saturday],
        ),
        firstDayOfWeek: 1,
        controller: _calendarController,
        onTap: (calendarTapDetails) {
          if (calendarTapDetails.targetElement == CalendarElement.calendarCell) {
            DateTime tappedDate = calendarTapDetails.date!;
            _showAddDialog(tappedDate);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DateTime selectedDate = _calendarController.selectedDate ?? DateTime.now();
          _showAddDialog(selectedDate);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 1),
    );
  }

  void _showAddDialog(DateTime date) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String eventText = '';
        return AlertDialog(
          title: Text('Add Event'),
          content: TextField(
            onChanged: (value) {
              eventText = value;
            },
            decoration: InputDecoration(hintText: 'Enter event description'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  if (_events[date] != null) {
                    _events[date]!.add(eventText);
                  } else {
                    _events[date] = [eventText];
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
 String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
