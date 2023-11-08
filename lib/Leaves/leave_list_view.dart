import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inside/Leaves/LeaveForm/ApplyLeaveView.dart';
import 'package:inside/Constants/Constants.dart';
import '../Constants/Constants.dart';

import 'Filter/FilterView.dart';
import 'ItemModel/ItemModel.dart';

class LeaveListView extends StatefulWidget {
  const LeaveListView({super.key});

  @override
  State<LeaveListView> createState() => _LeaveListViewState();
}

class _LeaveListViewState extends State<LeaveListView> {
  bool isExpanded = false;
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Leaves',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FilterView()),
                      );
                    },
                    color: kPrimaryColors,
                    icon: const Icon(CupertinoIcons.arrow_up_arrow_down))),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ApplyLeaveView()),
                      );
                    },
                    color: kPrimaryColors,
                    // shape: RoundedRectangleBorder(),
                    icon: Icon(CupertinoIcons.add)))
          ]),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Expanded(
          child: ListView.builder(
            itemCount: itemData.length,
            itemBuilder: (context, index) {
              return Slidable(
                key: const ValueKey(0),
                // The start action pane is the one at the left or the top side.
                startActionPane: ActionPane(
                  // A motion is a widget used to control how the pane animates.
                  motion: const ScrollMotion(),

                  // A pane can dismiss the Slidable.
                  dismissible: DismissiblePane(onDismissed: () {}),

                  // All actions are defined in the children parameter.
                  children: [
                    // A SlidableAction can have an icon and/or a label.
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Color(0xFF21B7CA),
                      foregroundColor: Colors.white,
                      icon: Icons.share,
                      label: 'Share',
                    ),
                  ],
                ),

                // The end action pane is the one at the right or the bottom side.
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      // An action can be bigger than the others.
                      flex: 2,
                      onPressed: (context) {},
                      backgroundColor: Color(0xFF7BC043),
                      foregroundColor: Colors.white,
                      icon: Icons.archive,
                      label: 'Archive',
                    ),
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Color(0xFF0392CF),
                      foregroundColor: Colors.white,
                      icon: Icons.save,
                      label: 'Save',
                    ),
                  ],
                ),
                child: Card(
                  child: ExpansionPanelList(
                    animationDuration: Duration(milliseconds: 500),
                    dividerColor: Colors.red,
                    expandedHeaderPadding: EdgeInsets.only(bottom: 0.0),
                    elevation: 1,
                    children: [
                      ExpansionPanel(
                        headerBuilder:
                            (BuildContext context, bool isExpanded) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      itemData[index]
                                          .data!
                                          .first
                                          .titleData!
                                          .first,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "R.M: ${itemData[index].data!.first.rM!}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        height: 0,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  itemData[index]
                                      .data!
                                      .first
                                      .subTitleData!
                                      .first,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        body: Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    itemData[index].data!.first.reason!,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Applied at: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      height: 0,
                                    ),
                                  ),
                                  Text(
                                    itemData[index].data!.first.date!,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Created by: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      height: 0,
                                    ),
                                  ),
                                  Text(
                                    itemData[index].data!.first.createdBy!,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    itemData[index].data!.first.status!,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        isExpanded: itemData[index].data!.first.expanded,
                      )
                    ],
                    expansionCallback: (int item, bool status) {
                      setState(() {
                        itemData[index].data!.first.expanded =
                            !itemData[index].data!.first.expanded;
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }

  List<ItemModel> itemData = <ItemModel>[
    ItemModel(data: [
      Data(
          empName: 'Keval Gajjar',
          type: 'Un-planned',
          days: '1',
          fromDate: '17-08-2023',
          toDate: '17-08-2023',
          reason: 'To attend the friend marriage function',
          date: '17-08-2023',
          rM: 'Hardik Patel',
          createdBy: 'K Mandalia',
          status: 'Approved by : H Patel',
          titleData: [
            'Keval Gajjar',
          ],
          subTitleData: [
            'Un-planned leave for (1) day from 17-08-2023 to 17-08-2023'
          ])
    ]),
    ItemModel(data: [
      Data(
          empName: 'Mit Ankola',
          type: 'Un-planned',
          days: '1',
          fromDate: '17-08-2023',
          toDate: '18-08-2023',
          reason: 'To attend the friend marriage function',
          date: '18-08-2023',
          rM: 'K Mandalia',
          createdBy: 'K Mandalia',
          status: 'Approved by : K Mandalia',
          titleData: [
            'Mit Ankola',
          ],
          subTitleData: [
            'Un-planned leave for (2) days from 17-08-2023 to 18-08-2023'
          ])
    ]),
  ];

  Widget mainExpandableWidget(
      Widget expandableWidget, String? widgetDisplayTitle) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [expandableWidget],
      ),
    );
  }

  Widget expandableRow(String? mainTitle, String? subTitle) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainTitle!,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(subTitle!, maxLines: 10),
          )
        ]);
  }
}
