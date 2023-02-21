import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/image_learn.dart';

class NoteDemos extends StatelessWidget {
  const NoteDemos({Key? key}) : super(key: key);

  final _title = "Create your first note";
  final _description = "Add a note";
  final _createNote = "Create a Note";
  final _importNotes = "Import Notes";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            JpegImage(name: "ic_apple_with_book.jpeg"),
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems.horizontalPadding,
              child: _SubtitleWidget(title: _description*7,),
            ),
            Spacer(),
            ElevatedButton(onPressed: (){}, child: SizedBox(
                height: ButtonHights.buttonNormalHeight,
                child: Center(
                  child: Text(_createNote,
                  style: Theme.of(context).textTheme.headline5,),
                )
              ),
            ),
            TextButton(onPressed: () {}, child: Text(_importNotes, style: TextStyle(fontSize: 19),)),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black, fontWeight: FontWeight.w800),
    );
  }
}


// Centered text widget
class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget({
    Key? key, this.textAlign = TextAlign.center, this.title,
  }) : super(key: key);

  final TextAlign textAlign;
  final title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
    );
  }
}

class PaddingItems {
  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);
}

class ButtonHights {
  static const double buttonNormalHeight = 50;
}