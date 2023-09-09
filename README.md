# react-native-previous-app-switcher

Enables React Native apps on iOS and Android to swiftly return to the previously used application.

## Installation

```sh
npm install @sleiv/react-native-previous-app-switcher

or

yarn add @sleiv/react-native-previous-app-switcher
```

## Usage

```ts
import PreviousAppSwitcher from '@sleiv/react-native-previous-app-switcher';

// ...
PreviousAppSwitcher.switchBack().catch((e) => {
  console.error(e);
});
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
