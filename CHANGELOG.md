## [1.3.26]
+ Support custom day container feature [#145](https://github.com/dooboolab/flutter_calendar_carousel/pull/145).
## [1.3.23]
+ Support intl >= 0.15.7 < 0.17.0 to inclease `pub` health
+ Removed deprecated methods ~~`markedDates`~~, ~~`markedDateColor`~~
+ Fixes [#101](https://github.com/dooboolab/flutter_calendar_carousel/issues/101)
+ Fixes [#104](https://github.com/dooboolab/flutter_calendar_carousel/issues/104)
+ Fixes [#112](https://github.com/dooboolab/flutter_calendar_carousel/issues/112)
+ Fixes [#119](https://github.com/dooboolab/flutter_calendar_carousel/issues/119)
+ Support long pressed as a feature request[#103](https://github.com/dooboolab/flutter_calendar_carousel/issues/103)
+ Support semantic label as a feature request [#139](https://github.com/dooboolab/flutter_calendar_carousel/issues/139)
+ Expose `dayCrossAxisAlignment` and `dayMainAxisAlignment` to resolve [#122](https://github.com/dooboolab/flutter_calendar_carousel/issues/122)
+ Expose `showIconBehindDayText` to resolve [#131](https://github.com/dooboolab/flutter_calendar_carousel/issues/131)
+ Fixes [#94](https://github.com/dooboolab/flutter_calendar_carousel/issues/94)
## [1.3.20]
+ Support intl >= 0.15.7
## [1.3.19]
+ Improved customizability for weekday containers [#141](https://github.com/dooboolab/flutter_calendar_carousel/pull/141)
## [1.3.18]
+ Fix vertical scroll behavior for weekFormat calendar view. 
+ Reformat code with dartfmt
## [1.3.17]
+ Added feature to only show dates from today adding `showOnlyCurrentMonthDate` parameter.
## [1.3.16]
+ Added feature for change first day of the week.
## [1.3.15+]
+ Ability to disable horizontal scroll to change month with `isScrollable` param.
  - Resolve [#74](https://github.com/dooboolab/flutter_calendar_carousel/issues/74)
+ Show events in `week` calendar.
  - Resolve [#66](https://github.com/dooboolab/flutter_calendar_carousel/issues/66)
+ Update breaking docs in pub.
+ Expose event list to user.
+ Remove print.
+ Pass first date of week to onCalendarChanged in week view [#88](https://github.com/dooboolab/flutter_calendar_carousel/pull/88)
+ Support for passing in custom widgets for next and previous month arrow icons [#95](https://github.com/dooboolab/flutter_calendar_carousel/pull/95)

## [1.3.14]
+ Code refactoring [#77](https://github.com/dooboolab/flutter_calendar_carousel/pull/77)
  - Seperate weekday widget

## [1.3.13]
+ Code refactoring [#73](https://github.com/dooboolab/flutter_calendar_carousel/pull/73)
  - Seperate header.
  - Add first basic test code.
  - Add composable header widget

## [1.3.12]
+ Setting dot icon per event [#71](https://github.com/dooboolab/flutter_calendar_carousel/pull/71)

## [1.3.11]
+ Fixed `selectledDayTextStyle` property not being respected [#65](https://github.com/dooboolab/flutter_calendar_carousel/pull/65).

## [1.3.10]
+ Add property for static six week format to keep calendar height consistent between months [#62](https://github.com/dooboolab/flutter_calendar_carousel/pull/62).

## [1.3.9]
+ Changed priority for `today` higher than `prevMonth` and `nextMonth` and `thisMonth`.

## [1.3.7]
+ Ability to choose the weekday format on the constructor [#47](https://github.com/dooboolab/flutter_calendar_carousel/pull/47).

## [1.3.6]
+ custom event type added [#49](https://github.com/dooboolab/flutter_calendar_carousel/pull/49).

## [1.3.5]
+ headerTitleTouchable and onHeaderTitlePressed props added [#44](https://github.com/dooboolab/flutter_calendar_carousel/pull/44).

## [1.3.4]
+ Bug fix. PrevDaysTextStyle and PrevDaysTextStyle overwrite weekendTextStyle [#41](https://github.com/dooboolab/flutter_calendar_carousel/issues/41).

## [1.3.3]
+ Fixed FlatButton fill and border color. [#37](https://github.com/dooboolab/flutter_calendar_carousel/pull/37)
+ EventList bug fixing. [#37](https://github.com/dooboolab/flutter_calendar_carousel/pull/36)

## [1.3.2]
* Mapping events for better performance. [#34](https://github.com/dooboolab/flutter_calendar_carousel/pull/34).

## [1.3.1]
* weekdays bug fix.

## [1.3.0]
* Better localization support for `weekDays`. Setting manually weekdays isn't required now. Related [#23](https://github.com/dooboolab/flutter_calendar_carousel/pull/23).
* Add custom icons in event [#28](https://github.com/dooboolab/flutter_calendar_carousel/pull/28).

## [1.2.3]
* Add custom physics parameter. Feature in [#21](https://github.com/dooboolab/flutter_calendar_carousel/pull/21).

## [1.2.2]
* headerTextStyle fix[#17](https://github.com/dooboolab/flutter_calendar_carousel/issues/17).
* Can show or hide header button with `showHeaderButton` attribute.

## [1.2.1]
* Week-format shows current week [#15](https://github.com/dooboolab/flutter_calendar_carousel/issues/15).

## [1.2.0]
* Support carousel week calendar.

## [1.1.11]
* Ability to customize weekend days [#13](https://github.com/dooboolab/flutter_calendar_carousel/issues/13).

## [1.1.10]
* Support weekFormat but without carousel.

## [1.1.9]
* Updated readme.

## [1.1.8]
* Render multiple marked dates.
* `markedDates` is deprecated. Use `markedDatesMap` instead.

## [1.1.3]
* Mark dates with non-zero times.

## [1.1.2]
* Implemented a way to change the header text style.

## [1.1.1]
* Expose new variables.
  - headerMargin, childAspectRatio, weekDayMargin

## [1.1.0]
* Give proper text color in weekend when it is today.
* Compare month and year for marking today's date. Resolve #3.

## [1.0.3]
* Fixed pub broken image.

## [1.0.2]
* Use `Position` widget to mark the dates.

## [1.0.1]
* Show markedDates.

## [0.2.0]
* Customizable headerWidget.
* Setting weekdays visibility
* Customizable weekend color.

## [0.1.3]
* Rename the top-level "docs" directory to "doc".

## [0.1.1]
* Added readme.

## [0.1.0]
* First release

