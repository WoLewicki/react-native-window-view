# react-native-window-view

Native component for rendering views straight under the Window. Based on `RCTPerfMonitor`.

## Installation

```sh
npm install react-native-window-view
```

## Usage

```tsx
import * as React from 'react';

import { Button, StyleSheet, View } from 'react-native';
import RNWindowView from 'react-native-window-view';

export default function App() {
  const [shown, setShown] = React.useState(true);

  return (
    <View style={styles.container}>
      <Button title="Show/hide window view" onPress={() => setShown(!shown)} />
      <RNWindowView shown={shown}>
        <View style={styles.box} />
      </RNWindowView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'flex-start',
    justifyContent: 'center',
  },
  box: {
    width: 40,
    height: 40,
    borderRadius: 10,
    borderWidth: 2,
    borderColor: 'black',
    backgroundColor: 'red',
  },
});

```

To make the compoent stay on top even after pushing modals, you need to add the following code to your `appDelegate.m`

```objc
#import <react-native-window-view/RNWindowView.h>



// to ignore touches on RNWindow
- (UIView *) hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitTestResult = [super hitTest:point withEvent:event];
    if ([hitTestResult isKindOfClass:[RNWindow class]]) {
      return nil;
    }
    return hitTestResult;
}

- (void)didAddSubview:(UIView *)subview
{
  if (![subview isKindOfClass:[RNViewContainer class]]) {
    for (UIView *view in self.subviews) {
      if ([view isKindOfClass:[RNViewContainer class]]) {
        [self bringSubviewToFront:view];
      }
    }
  }
}

@end

@implementation AppDelegate


// inside didFinishLaunchingWithOptions replace this line

self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

// with this

self.window = [[RNWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

```


## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
