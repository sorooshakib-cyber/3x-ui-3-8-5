FROM alpine:latest

# نصب پکیج‌های ضروری برای دانلود و راه‌اندازی
RUN apk update && apk add --no-cache ca-certificates curl wget tzdata tar bash

WORKDIR /app

# دانلود و استخراج نسخه مورد نظر 3x-ui (نسخه 3.8.5 یا آخرین نسخه پایدار)
RUN wget https://github.com/MHSanaei/3x-ui/releases/download/v3.8.5/x-ui-linux-amd64.tar.gz && \
    tar -zxvf x-ui-linux-amd64.tar.gz && \
    mv x-ui/* /app/ && \
    rm -rf x-ui x-ui-linux-amd64.tar.gz

# کپی کردن اسکریپت استارت به داخل پوشه
COPY entrypoint.sh /app/entrypoint.sh

# دادن دسترسی اجرایی
RUN chmod +x x-ui entrypoint.sh

# پورت پیش‌فرض پنل
EXPOSE 54321

# اجرای اسکریپت ورود
ENTRYPOINT ["/app/entrypoint.sh"]
