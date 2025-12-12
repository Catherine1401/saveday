#!/bin/bash
set -e # Dừng script ngay lập tức nếu có bất kỳ lệnh nào bị lỗi

# Lấy đường dẫn thư mục hiện tại (Project Root)
BASE_DIR=$(pwd)
FLUTTER_DIR="$BASE_DIR/flutter"
FLUTTER_BIN="$FLUTTER_DIR/bin/flutter"

echo "🐧 Detected Linux Environment. Current Dir: $BASE_DIR"

# -----------------------------------------------------------
# 1. KIỂM TRA VÀ CÀI ĐẶT FLUTTER (Tự động hóa)
# -----------------------------------------------------------
if [ ! -d "$FLUTTER_DIR" ]; then
    echo "⬇️ Flutter chưa được cài đặt. Đang tiến hành Clone..."
    git clone https://github.com/flutter/flutter.git -b stable "$FLUTTER_DIR"
else
    echo "✅ Flutter đã tồn tại tại: $FLUTTER_DIR"
fi

# Đảm bảo file thực thi có quyền chạy (Fix lỗi Permission denied trên Linux)
chmod +x "$FLUTTER_BIN"

# -----------------------------------------------------------
# 2. TẠO FILE CẤU HÌNH JSON (Biến môi trường)
# -----------------------------------------------------------
echo "📝 Đang tạo file env_config.json từ biến môi trường Vercel..."
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

# -----------------------------------------------------------
# 3. TIẾN HÀNH BUILD
# -----------------------------------------------------------
echo "🔧 Cấu hình Flutter cho Web..."
"$FLUTTER_BIN" config --enable-web

echo "🚀 Bắt đầu Build Web Release..."
"$FLUTTER_BIN" build web --release --dart-define-from-file=env_config.json --verbose

echo "🎉 Build hoàn tất!"
