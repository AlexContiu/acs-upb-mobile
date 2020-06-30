import 'package:acs_upb_mobile/pages/timetable/model/uni_event.dart';
import 'package:acs_upb_mobile/pages/timetable/view/event_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:flutter/material.dart';

class UniEventWidget extends StatelessWidget {
  final UniEventInstance event;

  const UniEventWidget(this.event, {Key key})
      : assert(event != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = event.color ?? Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => EventView(
          event: event,
          addNew: false,
        ),
      )),
      child: Material(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).scaffoldBackgroundColor,
            width: 0.75,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(4, 2, 4, 0),
              child: AutoSizeText(
                event.title,
                maxLines: 2,
                minFontSize: 4,
                maxFontSize: 12,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: color.highEmphasisOnColor,
                    ),
              ),
            ),
            event.mainEvent.type != null
                ? Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                      child: AutoSizeText(
                        event.mainEvent.type.toLocalizedString(context),
                        wrapWords: false,
                        minFontSize: 8,
                        maxFontSize: 10,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: 10,
                              color: color.highEmphasisOnColor,
                            ),
                      ),
                    ),
                  )
                : Container(),
            Expanded(
              child: event.location != null || event.info != null
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                        child: AutoSizeText(
                          event.location ?? event.info,
                          maxLines: 1,
                          minFontSize: 10,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontSize: 12,
                                color: color.mediumEmphasisOnColor,
                              ),
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
