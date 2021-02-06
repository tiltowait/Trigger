#  Trigger

A dead-simple macOS menu bar utility for quickly launching a Finder window upon receiving a global hotkey. Requires [HotKey](https://github.com/soffes/HotKey).

## Configuration

There is none! If you wish to change the behavior, you will need to modify this line:

```swift
let hotKey = HotKey(key: .grave, modifiers: [.control])
```

You will also need to modify the `keyDownHandler` starting at line 38 of the app delegate.
