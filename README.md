# AI Chatbot App

A simple AI chatbot built with Flutter and Gemini API. Users can send messages and receive AI-generated responses through a clean chat interface.

## Features

- Chat with Gemini AI
- Display chat history during session
- Loading indicator while waiting for responses
- Error handling
- Auto scroll to latest message
- Secure API key handling using `.env`

## Tech Stack

- Flutter
- Dart
- Riverpod
- Gemini API

## Setup Instructions

1. Install dependencies:

```bash
flutter pub get
```

2. Create a `.env` file in the project root and add your Gemini API key:

```env
GEMINI_API_KEY=your_api_key_here
```

3. Run the app:

```bash
flutter run
```

## Folder Structure

lib/
├── models
├── providers
├── screens
├── services
├── widgets
└── main.dart
```

