import {
  AlertCircle,
  CheckCircle,
  LucideIcon,
  XCircle,
  MoonStar,
  Sun,
} from "lucide-react-native";
import { cssInterop } from "nativewind";

function interopIcon(icon: LucideIcon) {
  cssInterop(icon, {
    className: {
      target: "style",
      nativeStyleToProp: {
        color: true,
        opacity: true,
      },
    },
  });
}

interopIcon(AlertCircle);
interopIcon(CheckCircle);
interopIcon(XCircle);
interopIcon(MoonStar);
interopIcon(Sun);

export { AlertCircle, CheckCircle, XCircle, MoonStar, Sun };
