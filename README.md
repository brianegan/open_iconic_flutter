# open_iconic_flutter

The [Open Iconic](https://useiconic.com/open) icon pack available as set of Flutter Icons.

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
  open_iconic_flutter: 0.1.0    
```

## Usage

```dart
import 'package:open_iconic_flutter/open_iconic_flutter.dart';

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return new IconButton(
      // Use the FontAwesomeIcons class for the IconData
      icon: new Icon(OpenIconicIcons.fork), 
      onPressed: () { print("Pressed"); }
     );
  }
}
```

## Example

View the Flutter app in the `example` directory to see all the available `OpenIconicIcons`.
