FROM ghcr.io/cirruslabs/flutter:latest

WORKDIR /app

COPY . .

RUN flutter pub get

RUN flutter build apk --release

CMD ["flutter", "run", "--release"]
