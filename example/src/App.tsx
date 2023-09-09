import * as React from 'react';

import { StyleSheet, View, Button } from 'react-native';
import { PreviousAppSwitcher } from '@sleiv/react-native-previous-app-switcher';

export default function App() {
  const backToPreviousApp = async () => {
    PreviousAppSwitcher.switchBack().catch((e) => {
      console.error(e);
    });
  };

  return (
    <View style={styles.container}>
      <Button title="Back to Previous App" onPress={backToPreviousApp} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
