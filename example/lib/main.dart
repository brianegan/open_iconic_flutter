import 'package:flutter/material.dart';
import 'package:open_iconic_flutter/open_iconic_flutter.dart';

void main() {
  runApp(new FontAwesomeGalleryApp());
}

class FontAwesomeGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Open Iconic Flutter Gallery',
      theme: new ThemeData(
        iconTheme: new IconThemeData(size: 32.0, color: Colors.black87),
        primarySwatch: Colors.blue,
        textTheme: new TextTheme(
          body1: new TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
      ),
      home: new FontAwesomeGalleryHome(),
    );
  }
}

class FontAwesomeGalleryHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new FontAwesomeGalleryHomeState();
}

class FontAwesomeGalleryHomeState extends State<FontAwesomeGalleryHome> {
  var _searchTerm = "";
  var _isSearching = false;

  @override
  Widget build(BuildContext context) {
    final filteredIcons = icons
        .where((icon) =>
            _searchTerm.isEmpty ||
            icon.title.toLowerCase().contains(_searchTerm.toLowerCase()))
        .toList();
    final orientation = MediaQuery.of(context).orientation;

    return new Scaffold(
      appBar: _isSearching ? _searchBar(context) : _titleBar(),
      body: new GridView.builder(
        itemCount: filteredIcons.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
        ),
        itemBuilder: (context, index) {
          final icon = filteredIcons[index];

          return new InkWell(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute<Null>(
                  builder: (BuildContext context) {
                    return new GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: new Container(
                        color: Colors.white,
                        child: new SizedBox.expand(
                          child: new Hero(
                            tag: icon,
                            child: new Icon(
                              icon.iconData,
                              size: 100.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Hero(
                  tag: icon,
                  child: new Icon(icon.iconData),
                ),
                new Container(
                  padding: new EdgeInsets.only(top: 16.0),
                  child: new Text(icon.title),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar _titleBar() {
    return new AppBar(
      title: new Text("Open Iconic Flutter Gallery"),
      actions: [
        new IconButton(
            icon: new Icon(OpenIconicIcons.magnifyingGlass),
            onPressed: () {
              ModalRoute.of(context)
                  .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: () {
                setState(() {
                  _searchTerm = "";
                  _isSearching = false;
                });
              }));

              setState(() {
                _isSearching = true;
              });
            })
      ],
    );
  }

  AppBar _searchBar(BuildContext context) {
    return new AppBar(
      leading: new IconButton(
        icon: new Icon(OpenIconicIcons.chevronLeft),
        onPressed: () {
          setState(
            () {
              Navigator.pop(context);
              _isSearching = false;
              _searchTerm = "";
            },
          );
        },
      ),
      title: new TextField(
        onChanged: (text) => setState(() => _searchTerm = text),
        autofocus: true,
        style: new TextStyle(fontSize: 18.0),
        decoration: new InputDecoration(border: InputBorder.none),
        keyboardType: TextInputType.text,
      ),
    );
  }
}

final List<IconDefinition> icons = <IconDefinition>[
  new IconDefinition(OpenIconicIcons.accountLogin, "accountLogin"),
  new IconDefinition(OpenIconicIcons.accountLogout, "accountLogout"),
  new IconDefinition(OpenIconicIcons.actionRedo, "actionRedo"),
  new IconDefinition(OpenIconicIcons.actionUndo, "actionUndo"),
  new IconDefinition(OpenIconicIcons.alignCenter, "alignCenter"),
  new IconDefinition(OpenIconicIcons.alignLeft, "alignLeft"),
  new IconDefinition(OpenIconicIcons.alignRight, "alignRight"),
  new IconDefinition(OpenIconicIcons.aperture, "aperture"),
  new IconDefinition(OpenIconicIcons.arrowBottom, "arrowBottom"),
  new IconDefinition(OpenIconicIcons.arrowCircleBottom, "arrowCircleBottom"),
  new IconDefinition(OpenIconicIcons.arrowCircleLeft, "arrowCircleLeft"),
  new IconDefinition(OpenIconicIcons.arrowCircleRight, "arrowCircleRight"),
  new IconDefinition(OpenIconicIcons.arrowCircleTop, "arrowCircleTop"),
  new IconDefinition(OpenIconicIcons.arrowLeft, "arrowLeft"),
  new IconDefinition(OpenIconicIcons.arrowRight, "arrowRight"),
  new IconDefinition(OpenIconicIcons.arrowThickBottom, "arrowThickBottom"),
  new IconDefinition(OpenIconicIcons.arrowThickLeft, "arrowThickLeft"),
  new IconDefinition(OpenIconicIcons.arrowThickRight, "arrowThickRight"),
  new IconDefinition(OpenIconicIcons.arrowThickTop, "arrowThickTop"),
  new IconDefinition(OpenIconicIcons.arrowTop, "arrowTop"),
  new IconDefinition(OpenIconicIcons.audioSpectrum, "audioSpectrum"),
  new IconDefinition(OpenIconicIcons.audio, "audio"),
  new IconDefinition(OpenIconicIcons.badge, "badge"),
  new IconDefinition(OpenIconicIcons.ban, "ban"),
  new IconDefinition(OpenIconicIcons.barChart, "barChart"),
  new IconDefinition(OpenIconicIcons.basket, "basket"),
  new IconDefinition(OpenIconicIcons.batteryEmpty, "batteryEmpty"),
  new IconDefinition(OpenIconicIcons.batteryFull, "batteryFull"),
  new IconDefinition(OpenIconicIcons.beaker, "beaker"),
  new IconDefinition(OpenIconicIcons.bell, "bell"),
  new IconDefinition(OpenIconicIcons.bluetooth, "bluetooth"),
  new IconDefinition(OpenIconicIcons.bold, "bold"),
  new IconDefinition(OpenIconicIcons.bolt, "bolt"),
  new IconDefinition(OpenIconicIcons.book, "book"),
  new IconDefinition(OpenIconicIcons.bookmark, "bookmark"),
  new IconDefinition(OpenIconicIcons.box, "box"),
  new IconDefinition(OpenIconicIcons.briefcase, "briefcase"),
  new IconDefinition(OpenIconicIcons.britishPound, "britishPound"),
  new IconDefinition(OpenIconicIcons.browser, "browser"),
  new IconDefinition(OpenIconicIcons.brush, "brush"),
  new IconDefinition(OpenIconicIcons.bug, "bug"),
  new IconDefinition(OpenIconicIcons.bullhorn, "bullhorn"),
  new IconDefinition(OpenIconicIcons.calculator, "calculator"),
  new IconDefinition(OpenIconicIcons.calendar, "calendar"),
  new IconDefinition(OpenIconicIcons.cameraSlr, "cameraSlr"),
  new IconDefinition(OpenIconicIcons.caretBottom, "caretBottom"),
  new IconDefinition(OpenIconicIcons.caretLeft, "caretLeft"),
  new IconDefinition(OpenIconicIcons.caretRight, "caretRight"),
  new IconDefinition(OpenIconicIcons.caretTop, "caretTop"),
  new IconDefinition(OpenIconicIcons.cart, "cart"),
  new IconDefinition(OpenIconicIcons.chat, "chat"),
  new IconDefinition(OpenIconicIcons.check, "check"),
  new IconDefinition(OpenIconicIcons.chevronBottom, "chevronBottom"),
  new IconDefinition(OpenIconicIcons.chevronLeft, "chevronLeft"),
  new IconDefinition(OpenIconicIcons.chevronRight, "chevronRight"),
  new IconDefinition(OpenIconicIcons.chevronTop, "chevronTop"),
  new IconDefinition(OpenIconicIcons.circleCheck, "circleCheck"),
  new IconDefinition(OpenIconicIcons.circleX, "circleX"),
  new IconDefinition(OpenIconicIcons.clipboard, "clipboard"),
  new IconDefinition(OpenIconicIcons.clock, "clock"),
  new IconDefinition(OpenIconicIcons.cloudDownload, "cloudDownload"),
  new IconDefinition(OpenIconicIcons.cloudUpload, "cloudUpload"),
  new IconDefinition(OpenIconicIcons.cloud, "cloud"),
  new IconDefinition(OpenIconicIcons.cloudy, "cloudy"),
  new IconDefinition(OpenIconicIcons.code, "code"),
  new IconDefinition(OpenIconicIcons.cog, "cog"),
  new IconDefinition(OpenIconicIcons.collapseDown, "collapseDown"),
  new IconDefinition(OpenIconicIcons.collapseLeft, "collapseLeft"),
  new IconDefinition(OpenIconicIcons.collapseRight, "collapseRight"),
  new IconDefinition(OpenIconicIcons.collapseUp, "collapseUp"),
  new IconDefinition(OpenIconicIcons.command, "command"),
  new IconDefinition(OpenIconicIcons.commentSquare, "commentSquare"),
  new IconDefinition(OpenIconicIcons.compass, "compass"),
  new IconDefinition(OpenIconicIcons.contrast, "contrast"),
  new IconDefinition(OpenIconicIcons.copywriting, "copywriting"),
  new IconDefinition(OpenIconicIcons.creditCard, "creditCard"),
  new IconDefinition(OpenIconicIcons.crop, "crop"),
  new IconDefinition(OpenIconicIcons.dashboard, "dashboard"),
  new IconDefinition(
      OpenIconicIcons.dataTransferDownload, "dataTransferDownload"),
  new IconDefinition(OpenIconicIcons.dataTransferUpload, "dataTransferUpload"),
  new IconDefinition(OpenIconicIcons.delete, "delete"),
  new IconDefinition(OpenIconicIcons.dial, "dial"),
  new IconDefinition(OpenIconicIcons.document, "document"),
  new IconDefinition(OpenIconicIcons.dollar, "dollar"),
  new IconDefinition(
      OpenIconicIcons.doubleQuoteSansLeft, "doubleQuoteSansLeft"),
  new IconDefinition(
      OpenIconicIcons.doubleQuoteSansRight, "doubleQuoteSansRight"),
  new IconDefinition(
      OpenIconicIcons.doubleQuoteSerifLeft, "doubleQuoteSerifLeft"),
  new IconDefinition(
      OpenIconicIcons.doubleQuoteSerifRight, "doubleQuoteSerifRight"),
  new IconDefinition(OpenIconicIcons.droplet, "droplet"),
  new IconDefinition(OpenIconicIcons.eject, "eject"),
  new IconDefinition(OpenIconicIcons.elevator, "elevator"),
  new IconDefinition(OpenIconicIcons.ellipses, "ellipses"),
  new IconDefinition(OpenIconicIcons.envelopeClosed, "envelopeClosed"),
  new IconDefinition(OpenIconicIcons.envelopeOpen, "envelopeOpen"),
  new IconDefinition(OpenIconicIcons.euro, "euro"),
  new IconDefinition(OpenIconicIcons.excerpt, "excerpt"),
  new IconDefinition(OpenIconicIcons.expandDown, "expandDown"),
  new IconDefinition(OpenIconicIcons.expandLeft, "expandLeft"),
  new IconDefinition(OpenIconicIcons.expandRight, "expandRight"),
  new IconDefinition(OpenIconicIcons.expandUp, "expandUp"),
  new IconDefinition(OpenIconicIcons.externalLink, "externalLink"),
  new IconDefinition(OpenIconicIcons.eye, "eye"),
  new IconDefinition(OpenIconicIcons.eyedropper, "eyedropper"),
  new IconDefinition(OpenIconicIcons.file, "file"),
  new IconDefinition(OpenIconicIcons.fire, "fire"),
  new IconDefinition(OpenIconicIcons.flag, "flag"),
  new IconDefinition(OpenIconicIcons.flash, "flash"),
  new IconDefinition(OpenIconicIcons.folder, "folder"),
  new IconDefinition(OpenIconicIcons.fork, "fork"),
  new IconDefinition(OpenIconicIcons.fullscreenEnter, "fullscreenEnter"),
  new IconDefinition(OpenIconicIcons.fullscreenExit, "fullscreenExit"),
  new IconDefinition(OpenIconicIcons.globe, "globe"),
  new IconDefinition(OpenIconicIcons.graph, "graph"),
  new IconDefinition(OpenIconicIcons.gridFourUp, "gridFourUp"),
  new IconDefinition(OpenIconicIcons.gridThreeUp, "gridThreeUp"),
  new IconDefinition(OpenIconicIcons.gridTwoUp, "gridTwoUp"),
  new IconDefinition(OpenIconicIcons.hardDrive, "hardDrive"),
  new IconDefinition(OpenIconicIcons.header, "header"),
  new IconDefinition(OpenIconicIcons.headphones, "headphones"),
  new IconDefinition(OpenIconicIcons.heart, "heart"),
  new IconDefinition(OpenIconicIcons.home, "home"),
  new IconDefinition(OpenIconicIcons.image, "image"),
  new IconDefinition(OpenIconicIcons.inbox, "inbox"),
  new IconDefinition(OpenIconicIcons.infinity, "infinity"),
  new IconDefinition(OpenIconicIcons.info, "info"),
  new IconDefinition(OpenIconicIcons.italic, "italic"),
  new IconDefinition(OpenIconicIcons.justifyCenter, "justifyCenter"),
  new IconDefinition(OpenIconicIcons.justifyLeft, "justifyLeft"),
  new IconDefinition(OpenIconicIcons.justifyRight, "justifyRight"),
  new IconDefinition(OpenIconicIcons.key, "key"),
  new IconDefinition(OpenIconicIcons.laptop, "laptop"),
  new IconDefinition(OpenIconicIcons.layers, "layers"),
  new IconDefinition(OpenIconicIcons.lightbulb, "lightbulb"),
  new IconDefinition(OpenIconicIcons.linkBroken, "linkBroken"),
  new IconDefinition(OpenIconicIcons.linkIntact, "linkIntact"),
  new IconDefinition(OpenIconicIcons.listRich, "listRich"),
  new IconDefinition(OpenIconicIcons.list, "list"),
  new IconDefinition(OpenIconicIcons.location, "location"),
  new IconDefinition(OpenIconicIcons.lockLocked, "lockLocked"),
  new IconDefinition(OpenIconicIcons.lockUnlocked, "lockUnlocked"),
  new IconDefinition(OpenIconicIcons.loopCircular, "loopCircular"),
  new IconDefinition(OpenIconicIcons.loopSquare, "loopSquare"),
  new IconDefinition(OpenIconicIcons.loop, "loop"),
  new IconDefinition(OpenIconicIcons.magnifyingGlass, "magnifyingGlass"),
  new IconDefinition(OpenIconicIcons.mapMarker, "mapMarker"),
  new IconDefinition(OpenIconicIcons.map, "map"),
  new IconDefinition(OpenIconicIcons.mediaPause, "mediaPause"),
  new IconDefinition(OpenIconicIcons.mediaPlay, "mediaPlay"),
  new IconDefinition(OpenIconicIcons.mediaRecord, "mediaRecord"),
  new IconDefinition(OpenIconicIcons.mediaSkipBackward, "mediaSkipBackward"),
  new IconDefinition(OpenIconicIcons.mediaSkipForward, "mediaSkipForward"),
  new IconDefinition(OpenIconicIcons.mediaStepBackward, "mediaStepBackward"),
  new IconDefinition(OpenIconicIcons.mediaStepForward, "mediaStepForward"),
  new IconDefinition(OpenIconicIcons.mediaStop, "mediaStop"),
  new IconDefinition(OpenIconicIcons.medicalCross, "medicalCross"),
  new IconDefinition(OpenIconicIcons.menu, "menu"),
  new IconDefinition(OpenIconicIcons.microphone, "microphone"),
  new IconDefinition(OpenIconicIcons.minus, "minus"),
  new IconDefinition(OpenIconicIcons.monitor, "monitor"),
  new IconDefinition(OpenIconicIcons.moon, "moon"),
  new IconDefinition(OpenIconicIcons.move, "move"),
  new IconDefinition(OpenIconicIcons.musicalNote, "musicalNote"),
  new IconDefinition(OpenIconicIcons.paperclip, "paperclip"),
  new IconDefinition(OpenIconicIcons.pencil, "pencil"),
  new IconDefinition(OpenIconicIcons.people, "people"),
  new IconDefinition(OpenIconicIcons.person, "person"),
  new IconDefinition(OpenIconicIcons.phone, "phone"),
  new IconDefinition(OpenIconicIcons.pieChart, "pieChart"),
  new IconDefinition(OpenIconicIcons.pin, "pin"),
  new IconDefinition(OpenIconicIcons.playCircle, "playCircle"),
  new IconDefinition(OpenIconicIcons.plus, "plus"),
  new IconDefinition(OpenIconicIcons.powerStandby, "powerStandby"),
  new IconDefinition(OpenIconicIcons.print, "print"),
  new IconDefinition(OpenIconicIcons.project, "project"),
  new IconDefinition(OpenIconicIcons.pulse, "pulse"),
  new IconDefinition(OpenIconicIcons.puzzlePiece, "puzzlePiece"),
  new IconDefinition(OpenIconicIcons.questionMark, "questionMark"),
  new IconDefinition(OpenIconicIcons.rain, "rain"),
  new IconDefinition(OpenIconicIcons.random, "random"),
  new IconDefinition(OpenIconicIcons.reload, "reload"),
  new IconDefinition(OpenIconicIcons.resizeBoth, "resizeBoth"),
  new IconDefinition(OpenIconicIcons.resizeHeight, "resizeHeight"),
  new IconDefinition(OpenIconicIcons.resizeWidth, "resizeWidth"),
  new IconDefinition(OpenIconicIcons.rssAlt, "rssAlt"),
  new IconDefinition(OpenIconicIcons.rss, "rss"),
  new IconDefinition(OpenIconicIcons.script, "script"),
  new IconDefinition(OpenIconicIcons.shareBoxed, "shareBoxed"),
  new IconDefinition(OpenIconicIcons.share, "share"),
  new IconDefinition(OpenIconicIcons.shield, "shield"),
  new IconDefinition(OpenIconicIcons.signal, "signal"),
  new IconDefinition(OpenIconicIcons.signpost, "signpost"),
  new IconDefinition(OpenIconicIcons.sortAscending, "sortAscending"),
  new IconDefinition(OpenIconicIcons.sortDescending, "sortDescending"),
  new IconDefinition(OpenIconicIcons.spreadsheet, "spreadsheet"),
  new IconDefinition(OpenIconicIcons.star, "star"),
  new IconDefinition(OpenIconicIcons.sun, "sun"),
  new IconDefinition(OpenIconicIcons.tablet, "tablet"),
  new IconDefinition(OpenIconicIcons.tag, "tag"),
  new IconDefinition(OpenIconicIcons.tags, "tags"),
  new IconDefinition(OpenIconicIcons.target, "target"),
  new IconDefinition(OpenIconicIcons.task, "task"),
  new IconDefinition(OpenIconicIcons.terminal, "terminal"),
  new IconDefinition(OpenIconicIcons.text, "text"),
  new IconDefinition(OpenIconicIcons.thumbDown, "thumbDown"),
  new IconDefinition(OpenIconicIcons.thumbUp, "thumbUp"),
  new IconDefinition(OpenIconicIcons.timer, "timer"),
  new IconDefinition(OpenIconicIcons.transfer, "transfer"),
  new IconDefinition(OpenIconicIcons.trash, "trash"),
  new IconDefinition(OpenIconicIcons.underline, "underline"),
  new IconDefinition(
      OpenIconicIcons.verticalAlignBottom, "verticalAlignBottom"),
  new IconDefinition(
      OpenIconicIcons.verticalAlignCenter, "verticalAlignCenter"),
  new IconDefinition(OpenIconicIcons.verticalAlignTop, "verticalAlignTop"),
  new IconDefinition(OpenIconicIcons.video, "video"),
  new IconDefinition(OpenIconicIcons.volumeHigh, "volumeHigh"),
  new IconDefinition(OpenIconicIcons.volumeLow, "volumeLow"),
  new IconDefinition(OpenIconicIcons.volumeOff, "volumeOff"),
  new IconDefinition(OpenIconicIcons.warning, "warning"),
  new IconDefinition(OpenIconicIcons.wifi, "wifi"),
  new IconDefinition(OpenIconicIcons.wrench, "wrench"),
  new IconDefinition(OpenIconicIcons.x, "x"),
  new IconDefinition(OpenIconicIcons.yen, "yen"),
  new IconDefinition(OpenIconicIcons.zoomIn, "zoomIn"),
  new IconDefinition(OpenIconicIcons.zoomOut, "zoomOut"),
];

class IconDefinition implements Comparable {
  final IconData iconData;
  final String title;

  IconDefinition(this.iconData, this.title);

  @override
  String toString() => 'IconDefinition{iconData: $iconData, title: $title}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IconDefinition &&
          runtimeType == other.runtimeType &&
          iconData == other.iconData &&
          title == other.title;

  @override
  int get hashCode => iconData.hashCode ^ title.hashCode;

  @override
  int compareTo(other) => title.compareTo(other.title);
}
