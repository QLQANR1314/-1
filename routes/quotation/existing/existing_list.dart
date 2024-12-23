import 'package:flutter/material.dart';

class ExistingList extends StatefulWidget {
  const ExistingList({super.key});

  @override
  State<ExistingList> createState() => _ExistingListState();
}

class _ExistingListState extends State<ExistingList> {
final List<String> _titleList = [
    "24h成交额(＄)",
    "24h成交额(%)",
    "流通市值(＄)",
    "最大市值币总",
    "最大涨幅币总",
    
  ];
  double _leftWidth = 100;
  double _cellWidth = 100;
  double _cellHeight = 45;
  final ScrollController _titleController = ScrollController();
  final ScrollController _contentController = ScrollController();
  @override
  void initState() {
    super.initState();
    _titleController.addListener(_updateContent);
    _contentController.addListener(_updateTitle);
  }

  void _updateTitle() {
    if (_titleController.offset != _contentController.offset) {
      _titleController.jumpTo(_contentController.offset);
    }
  }

  void _updateContent() {
    if (_contentController.offset != _titleController.offset) {
      _contentController.jumpTo(_titleController.offset);
    }
  }

  @override
  void dispose() {
    _titleController.removeListener(_updateContent);
    _contentController.removeListener(_updateTitle);
    super.dispose();
  }

  Container _buildTitleContainer(int i) {
    return Container(
      // decoration: const BoxDecoration(
      //     border: Border(
      //         bottom: BorderSide(color: Colors.black, width: 1),
      //         right: BorderSide(color: Colors.black, width: 1))),
      alignment: Alignment.center,
      
      width: 100,
      height: 30,
      child: Text(
        _titleList[i],
        style: const TextStyle(color: Color.fromARGB(255, 69, 68, 68),fontSize: 12,fontWeight: FontWeight.w700),
      ),
    );
  }

  _buildRightTitle() {
    List<Widget> list = [];
    for (int i = 0; i < _titleList.length; i++) {
      list.add(_buildTitleContainer(i));
    }
    return list;
  }

  _buildRightContent(int index) {
    List<Widget> list = [];
    for (int i = 0; i < _titleList.length; i++) {
      list.add(
        Container(
        
        alignment: const Alignment(0, 0),
        // decoration: const BoxDecoration(
        //     border: Border(
        //         bottom: BorderSide(color: Colors.black, width: 1),
        //         right: BorderSide(color: Colors.black, width: 1))),
        width: _cellWidth,
        height: _cellHeight,
        child: Text(
          "行$index 列${i + 1}",
          style: TextStyle(color: Colors.black),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Container(
               
                width: _leftWidth,
                height: _cellHeight,
                alignment: Alignment.center,
                child: const Text('分类', style: TextStyle(color: Color.fromARGB(255, 69, 68, 68),fontSize: 12,fontWeight: FontWeight.w700)),
              ),
              Expanded(
                  child: SizedBox(
                width: _titleList.length * _cellWidth,
                child: SingleChildScrollView(
                  controller: _titleController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _buildRightTitle(),
                  ),
                ),
              ))
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: _leftWidth,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: const Alignment(0, 0),
                            
                                width: _cellWidth,
                                height: _cellHeight,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   
                                     Text(
                                      "以太坊生态",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ));
                        },
                        itemCount: 50,
                      ),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      controller: _contentController,
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: _titleList.length * _cellWidth,
                        child: ListView.builder(
                          itemCount: 50,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: _buildRightContent(index),
                              ),
                            );
                          },
                        ),
                        // ),
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
