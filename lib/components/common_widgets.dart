

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todobooks/model/task.dart';
import 'package:todobooks/themes/colors.dart';
import 'package:todobooks/themes/font_styles.dart';

class CommonWidgets {

  static Widget heightSpace({
      required double height,
    }) {
    return SizedBox(height: height);
  }

  static Widget widthSpace({
    required double width,
  }) {
    return SizedBox(height: double.infinity, width: width);
  }

  static Widget expander() {
    return Expanded(child: Container());
  }

  static Widget taskListWithTitle({
    required String listTitle,
    required List<Task> taskNameList,
  }) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children:[
              Text(listTitle, style: TextStyles.getDefaultFontStyle(fontColor: CustomColor.color29A19C, fontWeight: FontWeight.w600)),
              expander(),
              IconButton(
                onPressed:() {},
                icon: SvgPicture.asset("assets/more.svg"))
            ]
          ),
          ListView.builder(
            itemCount: taskNameList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return taskTile(taskNameList[index]);
            },
          )
        ],
    ));

  }

  static Widget taskTile(Task task) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: CustomColor.colorBtnGrey
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          widthSpace(width: 10),
          Text(task.task.toString(), style: TextStyles.getDefaultFontStyle(fontSize: 14)),
          widthSpace(width: 10),
          SizedBox(
            height: 35,
            child: ElevatedButton(
              child: Text(task.category.name),
              style: ElevatedButton.styleFrom(
                primary: task.category.color,
                textStyle: TextStyles.getDefaultFontStyle(fontSize: 12, fontColor: Colors.white, fontWeight: FontWeight.w500),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(95)
                )
              ),
              onPressed: () {},
          )),
        ],
      )
    );
  }
}

