import 'package:flutter/cupertino.dart';

Future<String> showMyCupertinoDialog({
  required BuildContext context,
  required ValueChanged<int>? onSelectedItemChanged,
  required Iterable<String> strings,
}) async {
  var returnValue = strings.first;
  await showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: CupertinoPicker(
          magnification: 1.22,
          squeeze: 1.2,
          useMagnifier: true,
          itemExtent: 50,
          onSelectedItemChanged: (value) => {
            returnValue = strings.elementAt(value),
          },
          children: [
            ...strings.map((e) => Center(child: Text(e))),
          ],
        ),
      ),
    ),
  );
  return returnValue;
}
