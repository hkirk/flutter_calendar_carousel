library flutter_calendar_dooboo;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/src/default_styles.dart';
import 'package:flutter_calendar_carousel/src/calendar_header.dart';
import 'package:flutter_calendar_carousel/src/weekday_row.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' show DateFormat;
export 'package:flutter_calendar_carousel/classes/event_list.dart';

typedef MarkedDateIconBuilder<Event> = Widget Function(Event event);
typedef void OnDayLongPressed(DateTime day);


/// This builder is called for every day in the calendar.
/// If you want to build only few custom day containers, return null for the days you want to leave with default looks
/// All characteristics like circle border are also applied to the custom day container [DayBuilder] provides.
/// (if supplied function returns null, Calendar's function will be called for [day]).
/// [isSelectable] - is between [CalendarCarousel.minSelectedDate] and [CalendarCarousel.maxSelectedDate]
/// [index] - DOES NOT equal day number! Index of the day built in current visible field
/// [isSelectedDay] - if the day is selected
/// [isToday] - if the day is similar to [DateTime.now()]
/// [isPrevMonthDay] - if the day is from previous month
/// [textStyle] - text style that would have been applied by the calendar if it was to build the day.
/// Example: if the user provided [CalendarCarousel.todayTextStyle] and [isToday] is true,
///   [CalendarCarousel.todayTextStyle] would be sent into [DayBuilder]'s [textStyle]. If user didn't
///   provide it, default [CalendarCarousel]'s textStyle would be sent. Same applies to all text styles like
///   [CalendarCarousel.prevDaysTextStyle], [CalendarCarousel.daysTextStyle] etc.
/// [isNextMonthDay] - if the day is from next month
/// [isThisMonthDay] - if the day is from next month
/// [day] - day being built.
typedef Widget DayBuilder(
    bool isSelectable,
    int index,
    bool isSelectedDay,
    bool isToday,
    bool isPrevMonthDay,
    TextStyle textStyle,
    bool isNextMonthDay,
    bool isThisMonthDay,
    DateTime day
    );

class CalendarCarousel<T> extends StatefulWidget {
  final double viewportFraction;
  final TextStyle prevDaysTextStyle;
  final TextStyle daysTextStyle;
  final TextStyle nextDaysTextStyle;
  final Color prevMonthDayBorderColor;
  final Color thisMonthDayBorderColor;
  final Color nextMonthDayBorderColor;
  final double dayPadding;
  final double height;
  final double width;
  final TextStyle todayTextStyle;
  final Color dayButtonColor;
  final Color todayBorderColor;
  final Color todayButtonColor;
  final DateTime selectedDateTime;
  final TextStyle selectedDayTextStyle;
  final Color selectedDayButtonColor;
  final Color selectedDayBorderColor;
  final bool daysHaveCircularBorder;
  final Function(DateTime, List<T>) onDayPressed;
  final TextStyle weekdayTextStyle;
  final Color iconColor;
  final TextStyle headerTextStyle;
  final String headerText;
  final TextStyle weekendTextStyle;
  final EventList<Event> markedDatesMap;
  /// Change `makredDateWidget` when `markedDateShowIcon` is set to false.
  final Widget markedDateWidget;
  /// Change `ShapeBorder` when `markedDateShowIcon` is set to false.
  final ShapeBorder markedDateCustomShapeBorder;
  /// Change `TextStyle` when `markedDateShowIcon` is set to false.
  final TextStyle markedDateCustomTextStyle;

  /// Icon will overlap the [Day] widget when `markedDateShowIcon` is set to true.
  /// This will also make below parameters work.
  final bool markedDateShowIcon;
  final Color markedDateIconBorderColor;
  final int markedDateIconMaxShown;
  final double markedDateIconMargin;
  final double markedDateIconOffset;
  final MarkedDateIconBuilder<Event> markedDateIconBuilder;
  /// null - no indicator, true - show the total events, false - show the total of hidden events
  final bool markedDateMoreShowTotal;
  final Decoration markedDateMoreCustomDecoration;
  final TextStyle markedDateMoreCustomTextStyle;
  final EdgeInsets headerMargin;
  final double childAspectRatio;
  final EdgeInsets weekDayMargin;
  final EdgeInsets weekDayPadding;
  final WeekdayBuilder customWeekDayBuilder;
  final DayBuilder customDayBuilder;
  final Color weekDayBackgroundColor;
  final bool weekFormat;
  final bool showWeekDays;
  final bool showHeader;
  final bool showHeaderButton;
  final Widget leftButtonIcon;
  final Widget rightButtonIcon;
  final ScrollPhysics customGridViewPhysics;
  final Function(DateTime) onCalendarChanged;
  final String locale;
  final int firstDayOfWeek;
  final DateTime minSelectedDate;
  final DateTime maxSelectedDate;
  final TextStyle inactiveDaysTextStyle;
  final TextStyle inactiveWeekendTextStyle;
  final bool headerTitleTouchable;
  final Function onHeaderTitlePressed;
  final WeekdayFormat weekDayFormat;
  final bool staticSixWeekFormat;
  final bool isScrollable;
  final bool showOnlyCurrentMonthDate;
  final bool pageSnapping;
  final OnDayLongPressed onDayLongPressed;
  final CrossAxisAlignment dayCrossAxisAlignment;
  final MainAxisAlignment dayMainAxisAlignment;
  final bool showIconBehindDayText;

  CalendarCarousel({
    this.viewportFraction = 1.0,
    this.prevDaysTextStyle,
    this.daysTextStyle,
    this.nextDaysTextStyle,
    this.prevMonthDayBorderColor = Colors.transparent,
    this.thisMonthDayBorderColor = Colors.transparent,
    this.nextMonthDayBorderColor = Colors.transparent,
    this.dayPadding = 2.0,
    this.height = double.infinity,
    this.width = double.infinity,
    this.todayTextStyle,
    this.dayButtonColor = Colors.transparent,
    this.todayBorderColor = Colors.red,
    this.todayButtonColor = Colors.red,
    this.selectedDateTime,
    this.selectedDayTextStyle,
    this.selectedDayBorderColor = Colors.green,
    this.selectedDayButtonColor = Colors.green,
    this.daysHaveCircularBorder,
    this.onDayPressed,
    this.weekdayTextStyle,
    this.iconColor = Colors.blueAccent,
    this.headerTextStyle,
    this.headerText,
    this.weekendTextStyle,
    this.markedDatesMap,
    this.markedDateShowIcon = false,
    this.markedDateIconBorderColor,
    this.markedDateIconMaxShown = 2,
    this.markedDateIconMargin = 5.0,
    this.markedDateIconOffset = 5.0,
    this.markedDateIconBuilder,
    this.markedDateMoreShowTotal,
    this.markedDateMoreCustomDecoration,
    this.markedDateCustomShapeBorder,
    this.markedDateCustomTextStyle,
    this.markedDateMoreCustomTextStyle,
    this.markedDateWidget,
    this.headerMargin = const EdgeInsets.symmetric(vertical: 16.0),
    this.childAspectRatio = 1.0,
    this.weekDayMargin = const EdgeInsets.only(bottom: 4.0),
    this.weekDayPadding = const EdgeInsets.all(0.0),
    this.weekDayBackgroundColor = Colors.transparent,
    this.customWeekDayBuilder,
    this.customDayBuilder,
    this.showWeekDays = true,
    this.weekFormat = false,
    this.showHeader = true,
    this.showHeaderButton = true,
    this.leftButtonIcon,
    this.rightButtonIcon,
    this.customGridViewPhysics,
    this.onCalendarChanged,
    this.locale = "en",
    this.firstDayOfWeek,
    this.minSelectedDate,
    this.maxSelectedDate,
    this.inactiveDaysTextStyle,
    this.inactiveWeekendTextStyle,
    this.headerTitleTouchable = false,
    this.onHeaderTitlePressed,
    this.weekDayFormat = WeekdayFormat.short,
    this.staticSixWeekFormat = false,
    this.isScrollable = true,
    this.showOnlyCurrentMonthDate = false,
    this.pageSnapping = false,
    this.onDayLongPressed,
    this.dayCrossAxisAlignment = CrossAxisAlignment.center,
    this.dayMainAxisAlignment = MainAxisAlignment.center,
    this.showIconBehindDayText = false,
  });

  @override
  _CalendarState<T> createState() => _CalendarState<T>();
}

enum WeekdayFormat {
  weekdays,
  standalone,
  short,
  standaloneShort,
  narrow,
  standaloneNarrow,
}

class _CalendarState<T> extends State<CalendarCarousel<T>> {
  PageController _controller;
  List<DateTime> _dates = List(3);
  List<List<DateTime>> _weeks = List(3);
  DateTime _selectedDate = DateTime.now();
  int _startWeekday = 0;
  int _endWeekday = 0;
  DateFormat _localeDate;

  /// When FIRSTDAYOFWEEK is 0 in dart-intl, it represents Monday. However it is the second day in the arrays of Weekdays.
  /// Therefore we need to add 1 modulo 7 to pick the right weekday from intl. (cf. [GlobalMaterialLocalizations])
  int firstDayOfWeek;

  /// If the setState called from this class, don't reload the selectedDate, but it should reload selected date if called from external class
  bool _isReloadSelectedDate = true;

  @override
  initState() {
    super.initState();
    initializeDateFormatting();

    /// setup pageController
    _controller = PageController(
      initialPage: 1,
      keepPage: true,
      viewportFraction: widget.viewportFraction,

      /// width percentage
    );

    _localeDate = DateFormat.yMMM(widget.locale);

    if (widget.firstDayOfWeek == null)
      firstDayOfWeek = (_localeDate.dateSymbols.FIRSTDAYOFWEEK + 1) % 7;
    else
      firstDayOfWeek = widget.firstDayOfWeek;

    if (widget.selectedDateTime != null)
      _selectedDate = widget.selectedDateTime;
    _setDate();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isReloadSelectedDate) {
      if (widget.selectedDateTime != null)
        _selectedDate = widget.selectedDateTime;
      _setDatesAndWeeks();
    } else {
      _isReloadSelectedDate = true;
    }
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: <Widget>[
          CalendarHeader(
            showHeader: widget.showHeader,
            headerMargin: widget.headerMargin,
            headerTitle: widget.headerText != null
                ? widget.headerText
                : widget.weekFormat
                  ? '${_localeDate.format(_weeks[1].first)}'
                  : '${_localeDate.format(this._dates[1])}',
            headerTextStyle: widget.headerTextStyle,
            showHeaderButtons: widget.showHeaderButton,
            headerIconColor: widget.iconColor,
            leftButtonIcon: widget.leftButtonIcon,
            rightButtonIcon: widget.rightButtonIcon,
            onLeftButtonPressed: () => _setDate(0),
            onRightButtonPressed: () => _setDate(2),
            isTitleTouchable: widget.headerTitleTouchable,
            onHeaderTitlePressed: widget.onHeaderTitlePressed != null
                ? widget.onHeaderTitlePressed
                : () => _selectDateFromPicker(),
          ),
          WeekdayRow(
            firstDayOfWeek,
            widget.customWeekDayBuilder,
            showWeekdays: widget.showWeekDays,
            weekdayFormat: widget.weekDayFormat,
            weekdayMargin: widget.weekDayMargin,
            weekdayPadding: widget.weekDayPadding,
            weekdayBackgroundColor: widget.weekDayBackgroundColor,
            weekdayTextStyle: widget.weekdayTextStyle,
            localeDate: _localeDate,
          ),
          Expanded(
              child: PageView.builder(
            itemCount: 3,
            physics: widget.isScrollable
                ? ScrollPhysics()
                : NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              this._setDate(index);
            },
            controller: _controller,
            itemBuilder: (context, index) {
              return widget.weekFormat ? weekBuilder(index) : builder(index);
            },
            pageSnapping: widget.pageSnapping,
          )),
        ],
      ),
    );
  }

  Widget getDefaultDayContainer(
    bool isSelectable,
    int index,
    bool isSelectedDay,
    bool isToday,
    bool isPrevMonthDay,
    TextStyle textStyle,
    TextStyle defaultTextStyle,
    bool isNextMonthDay,
    bool isThisMonthDay,
    DateTime now,
  ) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        crossAxisAlignment: widget.dayCrossAxisAlignment,
        mainAxisAlignment: widget.dayMainAxisAlignment,
        children: <Widget>[
          DefaultTextStyle(
            style: getDefaultDayStyle(isSelectable, index, isSelectedDay, isToday, isPrevMonthDay,
                textStyle, defaultTextStyle, isNextMonthDay, isThisMonthDay),
              child: Text(
                '${now.day}',
                semanticsLabel: now.day.toString(),
                style: getDayStyle(isSelectable, index, isSelectedDay, isToday, isPrevMonthDay,
                textStyle, defaultTextStyle, isNextMonthDay, isThisMonthDay),
                maxLines: 1,
              ),
          ),
        ],
      ),
    );
  }

  Widget renderDay(
    bool isSelectable,
    int index,
    bool isSelectedDay,
    bool isToday,
    bool isPrevMonthDay,
    TextStyle textStyle,
    TextStyle defaultTextStyle,
    bool isNextMonthDay,
    bool isThisMonthDay,
    DateTime now,
  ) {
    return Container(
      margin: EdgeInsets.all(widget.dayPadding),
      child: GestureDetector(
        onLongPress: () => _onDayLongPressed(now),
        child: FlatButton(
          color:
              isSelectedDay && widget.selectedDayButtonColor != null
                  ? widget.selectedDayButtonColor
                  : isToday && widget.todayButtonColor != null
                      ? widget.todayButtonColor
                      : widget.dayButtonColor,
          onPressed: () => _onDayPressed(now),
          padding: EdgeInsets.all(widget.dayPadding),
          shape: widget.markedDateCustomShapeBorder != null
            && widget.markedDatesMap != null
            && widget.markedDatesMap.getEvents(now).length > 0
            ? widget.markedDateCustomShapeBorder
            : widget.daysHaveCircularBorder == null
              ? CircleBorder()
              : widget.daysHaveCircularBorder ?? false
                ? CircleBorder(
                    side: BorderSide(
                      color: isSelectedDay
                        ? widget.selectedDayBorderColor
                        : isToday && widget.todayBorderColor != null
                          ? widget.todayBorderColor
                          : isPrevMonthDay
                            ? widget.prevMonthDayBorderColor
                            : isNextMonthDay
                              ? widget.nextMonthDayBorderColor
                              : widget.thisMonthDayBorderColor,
                    ),
                  )
                : RoundedRectangleBorder(
                    side: BorderSide(
                      color: isSelectedDay
                          ? widget.selectedDayBorderColor
                          : isToday && widget.todayBorderColor != null
                              ? widget.todayBorderColor
                              : isPrevMonthDay
                                  ? widget.prevMonthDayBorderColor
                                  : isNextMonthDay
                                      ? widget.nextMonthDayBorderColor
                                      : widget.thisMonthDayBorderColor,
                    ),
                  ),
          child: Stack(
            children: widget.showIconBehindDayText
              ? <Widget>[
                widget.markedDatesMap != null
                    ? _renderMarkedMapContainer(now)
                    : Container(),
                getDayContainer(isSelectable, index, isSelectedDay, isToday, isPrevMonthDay, textStyle, defaultTextStyle, isNextMonthDay, isThisMonthDay, now),
              ]
              : <Widget>[
                getDayContainer(isSelectable, index, isSelectedDay, isToday, isPrevMonthDay, textStyle, defaultTextStyle, isNextMonthDay, isThisMonthDay, now),
                widget.markedDatesMap != null
                    ? _renderMarkedMapContainer(now)
                    : Container(),
              ],
          ),
        ),
      ),
    );
  }

  AnimatedBuilder builder(int slideIndex) {
    double screenWidth = MediaQuery.of(context).size.width;
    int totalItemCount = widget.staticSixWeekFormat
        ? 42
        : DateTime(
              _dates[slideIndex].year,
              _dates[slideIndex].month + 1,
              0,
            ).day +
            _startWeekday +
            (7 - _endWeekday);
    int year = _dates[slideIndex].year;
    int month = _dates[slideIndex].month;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double value = 1.0;
        if (_controller.position.haveDimensions) {
          value = _controller.page - slideIndex;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value) * widget.height,
            width: Curves.easeOut.transform(value) * screenWidth,
            child: child,
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: GridView.count(
                physics: widget.customGridViewPhysics,
                crossAxisCount: 7,
                childAspectRatio: widget.childAspectRatio,
                padding: EdgeInsets.zero,
                children: List.generate(totalItemCount,

                    /// last day of month + weekday
                    (index) {
                  bool isToday =
                      DateTime.now().day == index + 1 - _startWeekday &&
                          DateTime.now().month == month &&
                          DateTime.now().year == year;
                  bool isSelectedDay = widget.selectedDateTime != null &&
                      widget.selectedDateTime.year == year &&
                      widget.selectedDateTime.month == month &&
                      widget.selectedDateTime.day == index + 1 - _startWeekday;
                  bool isPrevMonthDay = index < _startWeekday;
                  bool isNextMonthDay = index >=
                      (DateTime(year, month + 1, 0).day) + _startWeekday;
                  bool isThisMonthDay = !isPrevMonthDay && !isNextMonthDay;

                  DateTime now = DateTime(year, month, 1);
                  TextStyle textStyle;
                  TextStyle defaultTextStyle;
                  if (isPrevMonthDay && !widget.showOnlyCurrentMonthDate) {
                    now = now.subtract(Duration(days: _startWeekday - index));
                    textStyle = widget.prevDaysTextStyle;
                    defaultTextStyle = defaultPrevDaysTextStyle;
                  } else if (isThisMonthDay) {
                    now = DateTime(year, month, index + 1 - _startWeekday);
                    textStyle = isSelectedDay
                        ? widget.selectedDayTextStyle
                        : isToday
                            ? widget.todayTextStyle
                            : widget.daysTextStyle;
                    defaultTextStyle = isSelectedDay
                        ? defaultSelectedDayTextStyle
                        : isToday
                            ? defaultTodayTextStyle
                            : defaultDaysTextStyle;
                  } else if (!widget.showOnlyCurrentMonthDate) {
                    now = DateTime(year, month, index + 1 - _startWeekday);
                    textStyle = widget.nextDaysTextStyle;
                    defaultTextStyle = defaultNextDaysTextStyle;
                  } else {
                    return Container();
                  }
                  if (widget.markedDateCustomTextStyle != null
                    && widget.markedDatesMap != null
                    && widget.markedDatesMap.getEvents(now).length > 0) {
                    textStyle = widget.markedDateCustomTextStyle;
                  }
                  bool isSelectable = true;
                  if (widget.minSelectedDate != null &&
                      now.millisecondsSinceEpoch <
                          widget.minSelectedDate.millisecondsSinceEpoch)
                    isSelectable = false;
                  else if (widget.maxSelectedDate != null &&
                      now.millisecondsSinceEpoch >
                          widget.maxSelectedDate.millisecondsSinceEpoch)
                    isSelectable = false;
                  return renderDay(isSelectable, index, isSelectedDay, isToday, isPrevMonthDay, textStyle, defaultTextStyle, isNextMonthDay, isThisMonthDay, now);
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedBuilder weekBuilder(int slideIndex) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<DateTime> weekDays = _weeks[slideIndex];

    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double value = 1.0;
          if (_controller.position.haveDimensions) {
            value = _controller.page - slideIndex;
            value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
          }

          return Center(
            child: SizedBox(
              height: Curves.easeOut.transform(value) * widget.height,
              width: Curves.easeOut.transform(value) * screenWidth,
              child: child,
            ),
          );
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: GridView.count(
                  physics: widget.customGridViewPhysics,
                  crossAxisCount: 7,
                  childAspectRatio: widget.childAspectRatio,
                  padding: EdgeInsets.zero,
                  children: List.generate(weekDays.length, (index) { /// last day of month + weekday
                    bool isToday = weekDays[index].day == DateTime.now().day &&
                        weekDays[index].month == DateTime.now().month &&
                        weekDays[index].year == DateTime.now().year;
                    bool isSelectedDay = this._selectedDate != null &&
                        this._selectedDate.year == weekDays[index].year &&
                        this._selectedDate.month == weekDays[index].month &&
                        this._selectedDate.day == weekDays[index].day;
                    bool isPrevMonthDay =
                        weekDays[index].month < this._selectedDate.month;
                    bool isNextMonthDay =
                        weekDays[index].month > this._selectedDate.month;
                    bool isThisMonthDay = !isPrevMonthDay && !isNextMonthDay;

                    DateTime now = DateTime(weekDays[index].year,
                        weekDays[index].month, weekDays[index].day);
                    TextStyle textStyle;
                    TextStyle defaultTextStyle;
                    if (isPrevMonthDay && !widget.showOnlyCurrentMonthDate) {
                      textStyle = widget.prevDaysTextStyle;
                      defaultTextStyle = defaultPrevDaysTextStyle;
                    } else if (isThisMonthDay) {
                      textStyle = isSelectedDay
                        ? widget.selectedDayTextStyle
                        : isToday
                          ? widget.todayTextStyle
                          : widget.daysTextStyle;
                      defaultTextStyle = isSelectedDay
                        ? defaultSelectedDayTextStyle
                        : isToday
                          ? defaultTodayTextStyle
                          : defaultDaysTextStyle;
                    } else if (!widget.showOnlyCurrentMonthDate) {
                      textStyle = widget.nextDaysTextStyle;
                      defaultTextStyle = defaultNextDaysTextStyle;
                    } else {
                      return Container();
                    }
                    bool isSelectable = true;
                    if (widget.minSelectedDate != null &&
                        now.millisecondsSinceEpoch <
                            widget.minSelectedDate.millisecondsSinceEpoch)
                      isSelectable = false;
                    else if (widget.maxSelectedDate != null &&
                        now.millisecondsSinceEpoch >
                            widget.maxSelectedDate.millisecondsSinceEpoch)
                      isSelectable = false;
                    return renderDay(isSelectable, index, isSelectedDay, isToday, isPrevMonthDay, textStyle, defaultTextStyle, isNextMonthDay, isThisMonthDay, now);
                  }),
                ),
              ),
            ),
          ],
        ));
  }

  List<DateTime> _getDaysInWeek([DateTime selectedDate]) {
    if (selectedDate == null) selectedDate = new DateTime.now();

    var firstDayOfCurrentWeek = _firstDayOfWeek(selectedDate);
    var lastDayOfCurrentWeek = _lastDayOfWeek(selectedDate);

    return _daysInRange(firstDayOfCurrentWeek, lastDayOfCurrentWeek)
        .toList();
  }

  DateTime _firstDayOfWeek(DateTime date) {
    var day = _createUTCMiddayDateTime(date);
    return day.subtract(new Duration(days: date.weekday % 7));
  }

  DateTime _lastDayOfWeek(DateTime date) {
    var day = _createUTCMiddayDateTime(date);
    return day.add(new Duration(days: 7 - day.weekday % 7));
  }

  DateTime _createUTCMiddayDateTime(DateTime date) {
    // Magic const: 12 is to maintain compatibility with date_utils
    return new DateTime.utc(date.year, date.month, date.day, 12, 0, 0);
  }

  Iterable<DateTime> _daysInRange(DateTime start, DateTime end) {
    var offset = start.timeZoneOffset;

    return List<int>.generate(end.difference(start).inDays, (i) => i + 1)
      .map((int i) {
      var d = start.add(Duration(days: i));

      var timeZoneDiff = d.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = d.timeZoneOffset;
        d = d.subtract(new Duration(seconds: timeZoneDiff.inSeconds));
      }
      return d;
    });
  }

  void _onDayLongPressed(DateTime picked) {
    widget.onDayLongPressed(picked);
  }

  void _onDayPressed(DateTime picked) {
    if (picked == null) return;
    if (widget.minSelectedDate != null &&
        picked.millisecondsSinceEpoch <
            widget.minSelectedDate.millisecondsSinceEpoch) return;
    if (widget.maxSelectedDate != null &&
        picked.millisecondsSinceEpoch >
            widget.maxSelectedDate.millisecondsSinceEpoch) return;

    setState(() {
      _isReloadSelectedDate = false;
      _selectedDate = picked;
    });
    if (widget.onDayPressed != null)
      widget.onDayPressed(
        picked,
        widget.markedDatesMap != null
          ? widget.markedDatesMap.getEvents(picked)
          : []);
    _setDate();
  }

  Future<Null> _selectDateFromPicker() async {
    DateTime selected = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? new DateTime.now(),
      firstDate: widget.minSelectedDate != null
        ? widget.minSelectedDate
        : DateTime(1960),
      lastDate: widget.maxSelectedDate != null
        ? widget.maxSelectedDate
        : DateTime(2050),
    );

    if (selected != null) {
      // updating selected date range based on selected week
      setState(() {
        _isReloadSelectedDate = false;
        _selectedDate = selected;
      });
      if (widget.onDayPressed != null)
        widget.onDayPressed(
          selected,
          widget.markedDatesMap != null
            ? widget.markedDatesMap.getEvents(selected)
            : []);
      _setDate();
    }
  }

  void _setDatesAndWeeks() {
    /// Setup default calendar format
    DateTime date0 =
      DateTime(this._selectedDate.year, this._selectedDate.month - 1, 1);
    DateTime date1 =
      DateTime(this._selectedDate.year, this._selectedDate.month, 1);
    DateTime date2 =
      DateTime(this._selectedDate.year, this._selectedDate.month + 1, 1);

    /// Setup week-only format
    DateTime now = this._selectedDate;
    List<DateTime> week0 = _getDaysInWeek(now.subtract(new Duration(days: 7)));
    List<DateTime> week1 = _getDaysInWeek(now);
    List<DateTime> week2 = _getDaysInWeek(now.add(new Duration(days: 7)));

    _startWeekday = date1.weekday - firstDayOfWeek;
    _endWeekday = date2.weekday - firstDayOfWeek;
    this._dates = [
      date0,
      date1,
      date2,
    ];
    this._weeks = [
      week0,
      week1,
      week2,
    ];
//        this._selectedDate = widget.selectedDateTime != null
//            ? widget.selectedDateTime
//            : DateTime.now();
  }

  void _setDate([int page = -1]) {
    if (page == -1) {
      setState(() {
        _isReloadSelectedDate = false;
        _setDatesAndWeeks();
      });
    } else if (page == 1) {
      return;
    } else {
      if (widget.weekFormat) {
        DateTime curr;
        List<List<DateTime>> newWeeks = this._weeks;
        if (page == 0) {
          curr = _weeks[0].first;
          newWeeks[0] = _getDaysInWeek(DateTime(curr.year, curr.month, curr.day - 7));
          newWeeks[1] = _getDaysInWeek(curr);
          newWeeks[2] = _getDaysInWeek(DateTime(curr.year, curr.month, curr.day + 7));
          page += 1;
        } else if (page == 2) {
          curr = _weeks[2].first;
          newWeeks[1] = _getDaysInWeek(curr);
          newWeeks[0] = _getDaysInWeek(DateTime(curr.year, curr.month, curr.day - 7));
          newWeeks[2] = _getDaysInWeek(DateTime(curr.year, curr.month, curr.day + 7));
          page -= 1;
        }
        setState(() {
          _isReloadSelectedDate = false;
          this._weeks = newWeeks;
        });

        _controller.animateToPage(page,
            duration: Duration(milliseconds: 1), curve: Threshold(0.0));
      } else {
        List<DateTime> dates = this._dates;
        if (page == 0) {
          dates[2] = DateTime(dates[0].year, dates[0].month + 1, 1);
          dates[1] = DateTime(dates[0].year, dates[0].month, 1);
          dates[0] = DateTime(dates[0].year, dates[0].month - 1, 1);
          page = page + 1;
        } else if (page == 2) {
          dates[0] = DateTime(dates[2].year, dates[2].month - 1, 1);
          dates[1] = DateTime(dates[2].year, dates[2].month, 1);
          dates[2] = DateTime(dates[2].year, dates[2].month + 1, 1);
          page = page - 1;
        }

        setState(() {
          _isReloadSelectedDate = false;
          _startWeekday = dates[page].weekday - firstDayOfWeek;
          _endWeekday = dates[page + 1].weekday - firstDayOfWeek;
          this._dates = dates;
        });

        _controller.animateToPage(page,
            duration: Duration(milliseconds: 1), curve: Threshold(0.0));
      }
    }

    //call callback
    if (this._dates.length == 3 && widget.onCalendarChanged != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _isReloadSelectedDate = false;
        widget.onCalendarChanged(!widget.weekFormat
          ? this._dates[1]
          : this._weeks[1][firstDayOfWeek]);
      });
    }
  }

  Widget _renderMarkedMapContainer(DateTime now) {
    if (widget.markedDateShowIcon) {
      return Stack(
        children: _renderMarkedMap(now),
      );
    } else {
      return Container(
        height: double.infinity,
        padding: EdgeInsets.only(bottom: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _renderMarkedMap(now),
        ),
      );
    }
  }

  List<Widget> _renderMarkedMap(DateTime now) {
    if (widget.markedDatesMap != null &&
        widget.markedDatesMap.getEvents(now).length > 0) {
      List<Widget> tmp = [];
      int count = 0;
      int eventIndex = 0;
      double offset = 0.0;
      double padding = widget.markedDateIconMargin;
      widget.markedDatesMap.getEvents(now).forEach((Event event) {
        if (widget.markedDateShowIcon) {
          if (tmp.length > 0 && tmp.length < widget.markedDateIconMaxShown) {
            offset += widget.markedDateIconOffset;
          }
          if (tmp.length < widget.markedDateIconMaxShown &&
              widget.markedDateIconBuilder != null) {
            tmp.add(Center(
                child: new Container(
              padding: EdgeInsets.only(
                top: padding + offset,
                left: padding + offset,
                right: padding - offset,
                bottom: padding - offset,
              ),
              width: double.infinity,
              height: double.infinity,
              child: widget.markedDateIconBuilder(event),
            )));
          } else {
            count++;
          }
          if (count > 0 && widget.markedDateMoreShowTotal != null) {
            tmp.add(
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  width: widget.markedDateMoreShowTotal ? 18 : null,
                  height: widget.markedDateMoreShowTotal ? 18 : null,
                  decoration: widget.markedDateMoreCustomDecoration == null
                    ? new BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                            BorderRadius.all(Radius.circular(1000.0)),
                      )
                    : widget.markedDateMoreCustomDecoration,
                  child: Center(
                    child: Text(
                      widget.markedDateMoreShowTotal
                        ? (count + widget.markedDateIconMaxShown).toString()
                        : (count.toString() + '+'),
                      semanticsLabel: widget.markedDateMoreShowTotal
                        ? (count + widget.markedDateIconMaxShown).toString()
                        : (count.toString() + '+'),
                      style: widget.markedDateMoreCustomTextStyle == null
                        ? TextStyle(
                            fontSize: 9.0,
                            color: Colors.white,
                            fontWeight: FontWeight.normal)
                        : widget.markedDateMoreCustomTextStyle,
                    ),
                  ),
                ),
              ),
            );
          }
        } else {
          //max 5 dots
          if (eventIndex < 5) {
            if (widget.markedDateIconBuilder != null) {
              tmp.add(widget.markedDateIconBuilder(event));
            } else {
              if (event.dot != null) {
                tmp.add(event.dot);
              }
              else if (widget.markedDateWidget != null) {
                tmp.add(widget.markedDateWidget);
              } else {
                tmp.add(defaultMarkedDateWidget);
              }
            }
          }
        }

        eventIndex++;
      });
      return tmp;
    }
    return [];
  }

  TextStyle getDefaultDayStyle(
      bool isSelectable,
      int index,
      bool isSelectedDay,
      bool isToday,
      bool isPrevMonthDay,
      TextStyle textStyle,
      TextStyle defaultTextStyle,
      bool isNextMonthDay,
      bool isThisMonthDay,
      ) {
    return !isSelectable
        ?  defaultInactiveDaysTextStyle
        : (_localeDate.dateSymbols.WEEKENDRANGE.contains(
        (index - 1 + firstDayOfWeek) % 7)) && !isSelectedDay && !isToday
        ? (isPrevMonthDay
        ? defaultPrevDaysTextStyle
        : isNextMonthDay
        ? defaultNextDaysTextStyle
        : isSelectable
        ? defaultWeekendTextStyle
        : defaultInactiveWeekendTextStyle)
        : isToday
        ? defaultTodayTextStyle
        : isSelectable && textStyle != null
        ? textStyle
        : defaultTextStyle;
  }

  TextStyle getDayStyle(
      bool isSelectable,
      int index,
      bool isSelectedDay,
      bool isToday,
      bool isPrevMonthDay,
      TextStyle textStyle,
      TextStyle defaultTextStyle,
      bool isNextMonthDay,
      bool isThisMonthDay,
      ) {
    return isSelectedDay && widget.selectedDayTextStyle != null
        ? widget.selectedDayTextStyle
        : (_localeDate.dateSymbols.WEEKENDRANGE.contains(
        (index - 1 + firstDayOfWeek) % 7))
        && !isSelectedDay
        && isThisMonthDay
        && !isToday
        ? (isSelectable
        ? widget.weekendTextStyle
        : widget.inactiveWeekendTextStyle)
        : !isSelectable
        ? widget.inactiveDaysTextStyle
        : isPrevMonthDay
        ? widget.prevDaysTextStyle
        : isNextMonthDay
        ? widget.nextDaysTextStyle
        : isToday
        ? widget.todayTextStyle
        : widget.daysTextStyle;
  }

  Widget getDayContainer(
      bool isSelectable,
      int index,
      bool isSelectedDay,
      bool isToday,
      bool isPrevMonthDay,
      TextStyle textStyle,
      TextStyle defaultTextStyle,
      bool isNextMonthDay,
      bool isThisMonthDay,
      DateTime now) {
    if (widget.customDayBuilder != null) {
      TextStyle styleForBuilder = getDayStyle(isSelectable, index, isSelectedDay, isToday, isPrevMonthDay, textStyle, defaultTextStyle, isNextMonthDay, isThisMonthDay);
      if (styleForBuilder == null) {
        styleForBuilder = getDefaultDayStyle(isSelectable, index, isSelectedDay, isToday, isPrevMonthDay, textStyle, defaultTextStyle, isNextMonthDay, isThisMonthDay);
      }
      return widget.customDayBuilder(isSelectable, index, isSelectedDay, isToday, isPrevMonthDay, styleForBuilder, isNextMonthDay, isThisMonthDay, now)
             ?? getDefaultDayContainer(isSelectable, index, isSelectedDay, isToday, isPrevMonthDay, textStyle, defaultTextStyle, isNextMonthDay, isThisMonthDay, now);
    } else {
      return getDefaultDayContainer(isSelectable, index, isSelectedDay, isToday, isPrevMonthDay, textStyle, defaultTextStyle, isNextMonthDay, isThisMonthDay, now);
    }
  }
}
