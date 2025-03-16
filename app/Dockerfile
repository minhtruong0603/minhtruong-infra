# # Sử dụng image Python làm base image
# FROM python:3.9-slim

# # Thiết lập thư mục làm việc trong container
# WORKDIR /app

# # Sao chép file requirements.txt vào container
# COPY requirements.txt .

# # Cài đặt các dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# # Sao chép toàn bộ mã nguồn vào container
# COPY . .

# # Cài đặt lệnh mặc định khi container chạy
# CMD ["python", "app.py"]

FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .