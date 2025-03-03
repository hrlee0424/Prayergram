import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController textEditingController = TextEditingController();

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
          Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Row(
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
                        maxLines: 15,
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
                    customBorder: new CircleBorder(),
                    onTap: (){},
                    child: Padding(padding: EdgeInsets.all(10),
                    child: Image.asset("assets/icon_gallery.png", width: 30,),),
                  ),
                  InkWell(
                    customBorder: new CircleBorder(),
                    onTap: (){},
                    child: Padding(padding: EdgeInsets.all(10),
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