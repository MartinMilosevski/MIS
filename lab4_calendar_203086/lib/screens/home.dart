import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
 import 'package:geolocator/geolocator.dart';
import 'package:lab4_calendar_203086/models/Exam.dart';
import 'package:lab4_calendar_203086/services/local_notification_service.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:lab4_calendar_203086/services/geolocator_service.dart' as geo;

  class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key, required this.title});

    final String title;

    @override
    State<MyHomePage> createState() => _MyHomePageState();
  }


  class _MyHomePageState extends State<MyHomePage> {


    @override
    void initState() {
      super.initState();
      Timer.periodic(const Duration(minutes: 1), (timer) async {
        await DistanceBetweenPositions(exams);
      });
    }

    final List<Exam> exams=[
      Exam(DateTime(2025,1,15,10,30), 'Skopje-TMF', 'MIS',Colors.blue,20.1,23.1),
      Exam(DateTime(2025,1,17,14,20), 'Skopje-TMF', 'VNP',Colors.blue,24.1,25.1),
      Exam(DateTime(2025,1,16,9,30), 'Skopje-FEIT', 'BS',Colors.blue,50.2,69.1),
      Exam(DateTime(2025,1,19,11,0), 'Skopje-TMF', 'AOK',Colors.blue,11.9,25.9),
      Exam(DateTime(2025,1,20,14,0), 'Skopje-FEIT', 'SP',Colors.blue,14.9,18.9),
    ];

    List<Appointment> convertExamsToAppointments() {
      return exams.map((exam) {
        return Appointment(
          startTime: exam.date,
          endTime: exam.date.add(const Duration(hours: 2)),
          subject: exam.subject,
          location: exam.location,
          color: exam.color,
        );
      }).toList();
    }

    Future<String> DistanceBetweenPositions(List<Exam> exams) async {
      Position coordinates=await geo.geolocator_service().getCurrentPosition();

      for(var i in exams){
        if(Geolocator.distanceBetween(coordinates.latitude, coordinates.longitude, i.latitude, i.longitude)<=100){
          await local_notification_service().showNotifications(
              "You're near your exam location",
              "Exam location: ${i.location}"
          );
          return "You are near the exam location";
        }
      }
      return "You are not close to the exam locaiton!";
    }




    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Exams'),
          ),
          body: SfCalendar(
            view: CalendarView.month,
            dataSource: ExamDataSource(convertExamsToAppointments()),
            monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
          ),
      );
    }
  }

  class ExamDataSource extends CalendarDataSource {
    ExamDataSource(List<Appointment> appointments) {
      this.appointments = appointments;
    }
  }
