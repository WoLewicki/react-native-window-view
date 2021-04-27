import { requireNativeComponent, ViewStyle } from 'react-native';

type WindowViewProps = {
  color: string;
  style: ViewStyle;
};

export const WindowViewViewManager = requireNativeComponent<WindowViewProps>(
'WindowViewView'
);

export default WindowViewViewManager;
