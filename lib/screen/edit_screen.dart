import 'package:flutter/material.dart';
import 'package:prayer/data/bible.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () => Navigator.of(context).pop(),
        //     icon: const Icon(Icons.close)),
        actions: [
          MaterialButton(
            onPressed: () {},
            child: const Text("등록"),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        width: 40,
                        height: 40,
                      ),
                      Expanded(
                          child: TextFormField(
                            minLines: 1,
                            maxLines: 30,
                            focusNode: focusNode,
                            controller: textEditingController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 10, bottom: 11, top: 7, right: 10),
                                hintText: "어떤 일이 있었나요?"),
                          ))
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Text("믿음이 강한 우리는 마땅히 믿음이 약한 자의 약점을 담당하고 자기를 기쁘게 하지 아니할 것이라\n로마서 15:1", textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                  border:
                  Border(top: BorderSide(color: Colors.black12, width: 1))),
              child: Row(
                children: [
                  InkWell(
                    customBorder: const CircleBorder(),
                    onTap: (){},
                    child: Padding(padding: const EdgeInsets.all(10),
                    child: Image.asset("assets/icon_gallery.png", width: 30,),),
                  ),
                  InkWell(
                    customBorder: const CircleBorder(),
                    onTap: (){
                      BibleData().getBibleVerses("창", "1", 1, 5);
                    },
                    child: Padding(padding: const EdgeInsets.all(10),
                    child: Image.asset("assets/icon_bible.png", width: 30,),),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}