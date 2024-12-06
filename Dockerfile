# Menggunakan image Node.js versi 18
FROM node:18.17.1-alpine

# Menentukan direktori kerja di dalam container
WORKDIR /usr/src/app

# Menyalin file package.json dan package-lock.json (jika ada)
COPY package*.json ./

# Menginstall dependensi aplikasi frontend
RUN npm install

# Menyalin seluruh file aplikasi frontend (HTML, CSS, JS)
COPY . .

# Mengekspos port yang akan digunakan oleh http-server (default 8080)
EXPOSE 8080

# Menjalankan http-server untuk melayani file statis
CMD ["npx", "http-server", ".", "-p", "8080"]
