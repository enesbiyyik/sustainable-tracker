import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickerListTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final List list;
  int select;
  PickerListTile(this.icon, this.title, this.list, this.select);


  @override
  _PickerListTileState createState() => _PickerListTileState();
}

class _PickerListTileState extends State<PickerListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: Icon(widget.icon, size: 30, color: Colors.white),
          decoration: BoxDecoration(
              color: Color(0xff45D1FD),
              border: Border.all(color: Color(0xff45D1FD), width: 0),
              borderRadius: BorderRadius.circular(10)),
        ),
        title: Text(widget.title,
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        trailing: FlatButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              return showModalBottomSheet(
                isScrollControlled: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13), topRight: Radius.circular(13))),
                backgroundColor: Colors.white,
                context: context,
                builder: (context) => Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Container(
                    child: CupertinoPicker.builder(
                      childCount: widget.list.length,
                      itemBuilder: (context, index){
                        return Center(child: Text(widget.list[index]));
                      },
                      magnification: 1,
                      backgroundColor: Colors.white,
                      itemExtent: 50,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          widget.select = index;
                        });
                      },
                    ),
                  ),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("${widget.list[widget.select]}", style: TextStyle(color: Colors.black)),
                Text("Edit"),
              ],
            ),
            height: 10,
            minWidth: 10,
            color: Colors.white),
      ),
    );
  }
}