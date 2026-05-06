# Chatbot Feature

## Overview
The Chatbot feature provides an AI-powered assistant for students and teachers using the Google Gemini API.

## Architecture
- **Presentation Layer**:
  - **Manager**: `ChatbotCubit` manages the chat history and communication with the Gemini service.
  - **Screens**:
    - `ChatbotView`: The main chat interface.
  - **Widgets**:
    - `ChatbotBody`: Handles the list of messages.
    - `ChatbotTextField`: Custom input field for sending messages.
    - `ChatbotBubble`: Specialized chat bubbles for the AI and the user.

## Logic
- Uses `GeminiService` from the core layer to send and receive messages.
- Maintains a local list of `ChatbotModel` objects for the session's conversation history.
- Supports both English and Arabic queries.
