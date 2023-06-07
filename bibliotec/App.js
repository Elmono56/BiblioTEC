import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import { WebView } from 'react-native-webview';
export default function App() {
  return (
    <>
    <View style={styles.container}>
      <StatusBar style="auto" />
    </View>
    <WebView source={{ uri: 'https://bibliotecapp.azurewebsites.net/' }} style={{ flex: 1 }} />
    </>
  );
}

const styles = StyleSheet.create({
  container: {
    height: 45,
    backgroundColor: "black",
  },
});
