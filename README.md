📱 QuoteVault — AI-Powered Quotes App

QuoteVault is a full-featured quote discovery and personalization app built with Flutter and Supabase, demonstrating clean architecture, enterprise-level state management, and effective AI-assisted development.

⸻

🚀 Features Overview

🔐 Authentication
•	Email/password signup & login
•	Password reset
•	Session persistence
•	Secure logout
•	Supabase Auth

📜 Quotes
•	Infinite scroll home feed
•	Browse by category
•	Search by text & author
•	Pull-to-refresh
•	Offline-safe UI states

❤️ Favorites & Collections
•	Save/remove favorite quotes
•	Dedicated Favorites screen
•	Create custom collections
•	Add/remove quotes from collections
•	Cloud-synced across devices

🌟 Quote of the Day
•	Daily random quote
•	Auto refresh once per day
•	Local push notification at user-selected time

🎨 Personalization
•	Dark / Light / System theme
•	Accent color selection
•	Font size adjustment (safe limits)
•	Settings persisted locally + synced to profile

🧩 Widgets
•	Android home screen widget
•	iOS WidgetKit
•	Tap widget → opens app → Home screen

👤 Profile
•	Update name
•	Upload avatar image (jpg/png)
•	Secure Supabase Storage with RLS

⸻

🧱 Tech Stack

Frontend
•	Flutter
•	flutter_bloc
•	freezed
•	flutter_hooks
•	go_router
•	flutter_local_notifications

Backend
•	Supabase
•	Auth
•	Postgres Database
•	Storage
•	Row Level Security (RLS)
•	RPC functions

⸻

🗂️ Project Structure

lib/
├── core/
│   ├── constants/
│   ├── theme/
│   ├── utils/
│   └── supabase_client.dart
├── features/
│   ├── auth/
│   ├── quotes/
│   ├── favorites/
│   ├── collections/
│   ├── profile/
│   ├── settings/
│   └── daily_quote/
├── router/
│   └── app_router.dart
└── main.dart

Architecture:
•	Clean Architecture
•	SOLID principles
•	Feature-based modularization
•	UI → Bloc → UseCase → Repository → Supabase

⸻

🛠️ Setup Instructions

✅ Prerequisites
•	Flutter 3.19+
•	Dart 3+
•	Supabase account
•	Android Studio / Xcode

⸻

🔹 Backend Setup (Supabase)

1️⃣ Create Supabase Project
•	Go to https://supabase.com
•	Create a new project
•	Copy:
•	Project URL
•	Anon Public Key

⸻

2️⃣ Database & Policies

Open Supabase Dashboard → SQL Editor
Run the provided SQL file to create:
•	quotes
•	profiles
•	favorites
•	collections
•	collection_quotes
•	RLS policies
•	random_quote() RPC

✅ SQL file included in /supabase/schema.sql

⸻

3️⃣ Storage Setup (Avatars)
•	Create bucket: avatars
•	Public access: ❌ Disabled
•	Run storage policies SQL (provided)

Avatar path format:

avatars/{user_id}/avatar.png

Allowed types:
•	.jpg
•	.jpeg
•	.png

⸻

🔹 Frontend Setup (Flutter)

1️⃣ Clone Repository

git clone https://github.com/your-username/quotevault.git
cd quotevault


⸻

2️⃣ Install Dependencies

flutter pub get


⸻

3️⃣ Configure Supabase

Create file:

// lib/core/supabase_client.dart
class SupabaseService {
static const url = 'https://YOUR_PROJECT_ID.supabase.co';
static const anonKey = 'YOUR_PUBLIC_ANON_KEY';
}


⸻

4️⃣ Code Generation

dart run build_runner build --delete-conflicting-outputs


⸻

5️⃣ Run App

flutter run


⸻

🔔 Notifications Setup

Android
•	Permissions handled automatically
•	Exact alarms fallback handled gracefully

iOS
•	Enable Push Notifications
•	Enable Background Modes
•	WidgetKit enabled

⸻

🧩 Widget Setup

Android
•	Home screen widget auto-updates daily
•	Tap → opens app → Home screen

iOS
•	WidgetKit extension
•	Uses shared App Group storage
•	Updates daily

⸻

🤖 AI-Assisted Development

AI tools were intentionally used as part of the workflow:
•	ChatGPT — architecture decisions, debugging
•	Cursor — rapid refactors
•	Claude — code review & optimization
•	Supabase AI — SQL & RLS assistance

Example AI Tasks:
•	Supabase RLS policy design
•	Bloc state flow debugging
•	Notification edge-case handling
•	Theme persistence logic

AI was used as a productivity accelerator, not a replacement for architectural decisions.

⸻

🎥 Loom Video (Submission)

The Loom demo covers:
1.	App walkthrough
2.	Auth flow
3.	Favorites & collections
4.	Daily quote + notification
5.	Widget demo
6.	AI workflow explanation

⸻

⚠️ Known Limitations
•	Image compression not implemented (optional)
•	Widget refresh interval depends on OS scheduling
•	No offline write-back queue

⸻

🏁 Conclusion

QuoteVault demonstrates:
•	Enterprise-grade Flutter architecture
•	Secure Supabase integration
•	Clean UX with performance optimizations
•	Strong understanding of state, lifecycle, and backend security

⸻

📩 Contact

Developer: Mahesh Sharma
Role: Senior Mobile Application Developer
Tech: Flutter, Android, iOS, Supabase