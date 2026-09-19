#!/bin/bash

# اگر پورت از طریق محیط پلتفرم (مثل PORT) ست شده باشد، آن را اعمال می‌کنیم
if [ -n "$PORT" ]; then
    ./x-ui setting -port $PORT
fi

# شروع اجرای اصلی پنل x-ui
exec ./x-ui
