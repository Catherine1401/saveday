#!/bin/bash

cat <<EOF > env_config.json
{
  "ENV": "prod",
  "API_KEY_WEB": "$API_KEY_WEB",
  "APP_ID_WEB": "$APP_ID_WEB",
  "MESSAGING_SENDER_ID": "$MESSAGING_SENDER_ID",
  "PROJECT_ID": "$PROJECT_ID",
  "AUTH_DOMAIN": "$AUTH_DOMAIN",
  "STORAGE_BUCKET": "$STORAGE_BUCKET",
  "API_KEY_ANDROID": "$API_KEY_ANDROID",
  "APP_ID_ANDROID": "$APP_ID_ANDROID",
  "API_KEY_IOS": "$API_KEY_IOS",
  "APP_ID_IOS": "$APP_ID_IOS",
  "IOS_BUNDLE_ID": "$IOS_BUNDLE_ID",
  "API_KEY_MACOS": "$API_KEY_MACOS",
  "APP_ID_MACOS": "$APP_ID_MACOS",
  "API_KEY_WINDOWS": "$API_KEY_WINDOWS",
  "APP_ID_WINDOWS": "$APP_ID_WINDOWS"
}
EOF
# Tự động tìm đường dẫn của flutter
FLUTTER_PATH=$(which flutter)

# Nếu tìm thấy, dùng đường dẫn đó để build, nếu không thì dùng lệnh 'flutter' mặc định
if [ -n "$FLUTTER_PATH" ]; then
  $FLUTTER_PATH build web --release --dart-define-from-file=env_config.json
else
  flutter build web --release --dart-define-from-file=env_config.json
fi
