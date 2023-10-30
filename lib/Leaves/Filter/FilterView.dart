import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/Constants.dart';


const List<String> list = <String>[
  'Pending',
  'Approved',
  'Rejected',
  'Cancelled'
];

String dropdownValue = 'Pending';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Filter',
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _segmentFilterBy(),
              SizedBox(
                height: 40,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('From'),
                    Text('To'),
                  ]),
              Row(
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
              SizedBox(
                height: 20,
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
                          width: 150,
                          alignment: Alignment.centerLeft,
                          child: Text(value)));
                }).toList(),
              )),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColors,
                      onPrimary: Colors.white,
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: Text('Clear'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColors,
                        onPrimary: Colors.white,
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Text('Apply')),
                ],
              ),
            ],
          ),
        ));
  }

  var segmentFilterByControlValue = 0;

  Widget _segmentFilterBy() {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.7,
        child: CupertinoSegmentedControl<int>(
          selectedColor: kPrimaryColors,
          borderColor: kPrimaryColors,
          children: const {0: Text('Me'), 1: Text('Team'), 2: Text('All')},
          onValueChanged: (int val) {
            setState(() {
              segmentFilterByControlValue = val;
            });
          },
          groupValue: segmentFilterByControlValue,
        ),
      ),
    );
  }
}
