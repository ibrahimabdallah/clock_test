import 'package:clock_tast/components/clock_view.dart';
import 'package:clock_tast/components/custom_icon_.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ClockApp extends StatefulWidget {
  const ClockApp({Key? key}) : super(key: key);

  @override
  _ClockAppState createState() => _ClockAppState();
}

class _ClockAppState extends State<ClockApp> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timeZoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';

    if (!timeZoneString.startsWith('-')) offsetSign = '+';

    return Scaffold(
      backgroundColor:const Color(0xff2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                text: 'Clock',
                iconPath: 'assets/clock_icon.png',
                onPressed: () {},
              ),
              CustomIconButton(
                text: 'Alarm',
                iconPath: 'assets/alarm_icon.png',
                onPressed: () {},
              ),
              CustomIconButton(
                text: 'Timer',
                iconPath: 'assets/timer_icon.png',
                onPressed: () {},
              ),
              CustomIconButton(
                text: 'Stopwatch',
                iconPath: 'assets/stopwatch_icon.png',
                onPressed: () {},
              ),
            ],
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: _buildClockArea(
                formattedTime, formattedDate, offsetSign, timeZoneString),
          ),
        ],
      ),
    );
  }

  Container _buildClockArea(String formattedTime, String formattedDate,
      String offsetSign, String timeZoneString) {
    return Container(
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Text(
                  'Clock',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formattedTime,
                      style: const TextStyle(color: Colors.white, fontSize: 64),
                    ),
                    Text(
                      formattedDate,
                      style:const  TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Flexible(
                  flex: 5,
                  fit: FlexFit.tight,
                  child: Align(
                    alignment: Alignment.center,
                    child: ClockView(
                      size: MediaQuery.of(context).size.height / 4,
                    ),
                  )),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const  Text(
                      'zone',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                       const  Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'UTC $offsetSign$timeZoneString',
                          style: const TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
