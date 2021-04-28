import { Platform, requireNativeComponent, View } from 'react-native';

type WindowViewProps = {
  shown: boolean;
  draggable: boolean;
};

export const RNWindowView =
  Platform.OS === 'ios'
    ? requireNativeComponent<WindowViewProps>('RNWindowView')
    : View;

export default RNWindowView;
