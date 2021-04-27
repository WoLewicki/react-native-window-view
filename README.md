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

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
