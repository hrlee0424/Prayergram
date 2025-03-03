import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class MainListItem extends StatefulWidget {
  const MainListItem({super.key});

  @override
  State<MainListItem> createState() => _MainListItemState();
}

class _MainListItemState extends State<MainListItem> {
  String text =
      "Starting input: tba=com.example.prayer ic=io.flutter.plugin.editing.InputConnectionAdaptor@6022667 mNaviBarColor -855310, Starting input: tba=com.example.prayer ic=io.flutter.plugin.editing.InputConnectionAdaptor@6022667 mNaviBarColor -855310 Starting input: tba=com.example.prayer ic=io.flutter.plugin.editing.InputConnectionAdaptor@6022667 mNaviBarColor -855310, Starting input: tba=com.example.prayer ic=io.flutter.plugin.editing.InputConnectionAdaptor@6022667 mNaviBarColor -855310";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(100),
                ),
                width: 50,
                height: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      ExpandableText(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
                        expandText: '더보기',
                        // collapseText: 'show less',
                        maxLines: 1,
                        linkColor: Colors.blue,
                      ),
                      Text(maxLines: 5, text),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.green)),
                        child: const Center(
                          child: Text(
                            "Starting input: tba=com.example.prayer ic=io.flutter.plugin.editing.InputConnectionAdaptor@6022667 mNaviBarColor -855310",
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ))
              // text.length > 30
              //     ? MaterialButton(
              //         onPressed: () {},
              //         child: Text('더보기'),
              //       )
              //     : SizedBox()
            ],
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined))
            ],
          )
        ],
      ),
    );
  }
}