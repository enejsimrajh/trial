import { Provider } from 'app/provider'
import { SplashScreen, Stack } from 'expo-router'

// Prevent the splash screen from auto-hiding before getting the color scheme.
SplashScreen.preventAutoHideAsync()

export default function Root() {
  return (
    <Provider>
      <Stack />
    </Provider>
  )
}
