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

1. Clone the repository.

2. Install dependencies:

```bash
flutter pub get
Create a .env file in the project root directory.
Add your Gemini API key in the .env file:
GEMINI_API_KEY=your_gemini_api_key_here
Get your Gemini API key from Google AI Studio and replace your_gemini_api_key_here with your actual key.
Run the application:
flutter run
Folder Structure
lib/
├── models
├── providers
├── screens
├── services
├── widgets
└── main.dart