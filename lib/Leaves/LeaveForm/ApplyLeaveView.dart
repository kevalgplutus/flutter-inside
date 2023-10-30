import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inside/Constants/Constants.dart';
import '../Constants/Constants.dart';

const List<String> list = <String>[
  'Keval Gajjar',
  'Mit Ankola',
  'Tejas Shukla',
  'Kunal Gullewar',
  'Hardik Patel',
  'Alpesh Chauhan',
  'Kishan Morichauhan',
  'Jaimin Kavathiya'
];

String dropdownValue = 'Keval Gajjar';

class ApplyLeaveView extends StatefulWidget {
  const ApplyLeaveView({super.key});

  @override
  State<ApplyLeaveView> createState() => _ApplyLeaveViewState();
}

class _ApplyLeaveViewState extends State<ApplyLeaveView> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text(
            'Apply a Leave',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(CupertinoIcons.back),
            iconSize: 20.0,
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Employee',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: kPrimaryColors),
                      ),
                      Container(
                          child: DropdownButton(
                        value: dropdownValue,
                        icon: Icon(CupertinoIcons.chevron_down),
                        iconSize: 16,
                        elevation: 16,
                        style: TextStyle(color: kPrimaryColors),
                        underline: Container(
                          height: 2,
                          color: kPrimaryColors,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: list.map<DropdownMenuItem>((String value) {
                          return DropdownMenuItem(
                              value: value,
                              child: Container(
                                  height: 100,
                                  width: MediaQuery.sizeOf(context).width *.50,
                                  alignment: Alignment.centerLeft,
                                  child: Text(value)));
                        }).toList(),
                      ))
                    ],
                  ),
                ),
                _segmentLeaveTypes(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _segmentFullOrHalfDay(),
                    _segmentFirstOrSecondHalfDay()
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'From',
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'To',
                          textAlign: TextAlign.left,
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kPrimaryColors,
                              // width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              hintText: "dd/mm/yyyy",
                              border: InputBorder.none,
                              suffixIconConstraints:
                                  BoxConstraints(minHeight: 15, minWidth: 15),
                              suffixIcon: Align(
                                widthFactor: 0.5,
                                heightFactor: 0.5,
                                child: Icon(
                                  CupertinoIcons.calendar,
                                ),
                              ),

                              // border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kPrimaryColors,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "dd/mm/yyyy",
                                suffixIconConstraints:
                                    BoxConstraints(minHeight: 15, minWidth: 15),
                                suffixIcon: Icon(CupertinoIcons.calendar)),
                            textAlignVertical: TextAlignVertical.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reason',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kPrimaryColors,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                        maxLines: 4,
                        maxLength: 300,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter the reason",
                          suffixIconConstraints:
                              BoxConstraints(minHeight: 15, minWidth: 15),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Leaves : 0',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Holidays : 0',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text('Total Leaves : 0',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                                ),
                                alignment: Alignment.centerLeft
                              ),
                              onPressed: () {},
                              child: Text('Close'))),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Reset'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kPrimaryColors,
                          onPrimary: Colors.white,
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: Text('Apply',
                          style: TextStyle(
                            color: Colors.white,
                            decorationColor: kPrimaryColors,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  int segmentedControlValue = 0;

  Widget _segmentLeaveTypes() => Container(
        width: 500,
        child: CupertinoSegmentedControl<int>(
          selectedColor: kPrimaryColors,
          borderColor: kPrimaryColors,
          children: const {
            0: Text('Planned'),
            1: Text('Unplanned'),
            2: Text('Compensation')
          },
          onValueChanged: (int val) {
            setState(() {
              segmentedControlValue = val;
            });
          },
          groupValue: segmentedControlValue,
        ),
      );

  int segmentedDayControlValue = 0;

  Widget _segmentFullOrHalfDay() => Container(
        width: 190,
        child: CupertinoSegmentedControl<int>(
          selectedColor: kPrimaryColors,
          borderColor: kPrimaryColors,
          children: const {
            0: Text('Full Day'),
            1: Text('Half Day')
          },
          onValueChanged: (int val) {
            setState(() {
              segmentedDayControlValue = val;
            });
          },
          groupValue: segmentedDayControlValue,
        ),
      );

  int segmentedFirstOrSecondControlValue = 0;
  Widget _segmentFirstOrSecondHalfDay() => Container(
        width: 190,
        child: CupertinoSegmentedControl<int>(
          selectedColor: kPrimaryColors,
          borderColor: kPrimaryColors,
          children: const {
            0: Text('First'),
            1: Text('Second')
          },
          onValueChanged: (int val) {
            setState(() {
              segmentedFirstOrSecondControlValue = val;
            });
          },
          groupValue: segmentedFirstOrSecondControlValue,
        ),
      );
}
