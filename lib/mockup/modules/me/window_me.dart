import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:pandashop/mockup/constants/constant_colors.dart';
import 'package:pandashop/mockup/modules/me/widgets/widget_me_location_cell.dart';
import 'package:pandashop/mockup/modules/me/widgets/widget_me_login_cell.dart';

Indicator refreshHeaderBuilder(BuildContext context, int mode) {
  return ClassicIndicator(
    mode: mode,
    releaseText: '释放以刷新',
    refreshingText: '刷新中...',
    completeText: '完成',
    failedText: '失败',
    idleText: '下拉以刷新',
    noDataText: '',
  );
}

class MeWindow extends StatefulWidget {
  _MeWindowState createState() => _MeWindowState();
}

class _MeWindowState extends State<MeWindow> {
  final refreshController = RefreshController();

  Indicator refreshHeaderBuilder(BuildContext context, int mode) {
    return ClassicIndicator(
      mode: mode,
      releaseText: '释放以刷新',
      refreshingText: '刷新中...',
      completeText: '完成',
      failedText: '失败',
      idleText: '下拉以刷新',
      noDataText: '',
    );
  }

  void getData(up) async {
    var sub;
    Future<dynamic> future = Future.delayed(Duration(milliseconds: 2000), () => 1000).then((val) {
      print('A: $val');
      val += 1000;
      return val.toString();
    }).then((val) {
      print('B: $val');
      var tmp = int.parse(val);
      tmp += 1000;
      return tmp;
    }).then((val) {
      print('C: $val');
      refreshController.sendBack(up, RefreshStatus.completed);
    }).whenComplete(() => sub.cancel());

    sub = future.asStream().listen((val) {
      print('$val');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: SectionTableView(
          sectionCount: 1,
          numOfRowInSection: (section) {
            return 2;
          },
          cellAtIndexPath: (section, row) {
            switch (row) {
              case 0:
                return WidgetMeLoginCell(
                  onRegister: () => print('register pressed'),
                  onSignIn: () => print('signin pressed'),
                );
                break;

              case 1:
                return WidgetMeLocationCell();
                break;

              default:
                return Container(
                  color: Colors.purple,
                );
            }

//            return Container(
//              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//              child: Row(
//                children: <Widget>[
//                  Text('Cell SECTION: $section - ROW: $row'),
//                ],
//              ),
//              height: 44.0,
//            );
          },
//          headerInSection: (section) {
//            return Container(
//              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//              child: Row(
//                children: <Widget>[Text('Header $section')],
//              ),
//              height: 20.0,
//            );
//          },
          divider: Container(
            color: Colours.white246,
            height: 0.5,
          ),
          enablePullDown: false,
          refreshHeaderBuilder: refreshHeaderBuilder,
          refreshController: refreshController,
          onRefresh: (up) {
            print('pull down.');
            getData(up);
          },
        ),
      ),
    );
  }
}
