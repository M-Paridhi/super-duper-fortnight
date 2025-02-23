The Campus Marketplace App for IIT Mandi is a comprehensive platform that enables users to buy, sell, and exchange items and services securely. Key features include:

Search: Easily navigate to find items or services.
Real-time Notifications & Authentication : Secure login processes.
Scam Prevention: Implemented safeguards to minimize fraudulent activities.
Modern, Minimal Design: A visually appealing interface featuring university branding, infographics, and an intuitive UI.
Usage Examples:

Selling Electronics: List gadgets or electronic accessories.
Book Exchange: Swap textbooks or other reading materials.
This app is engineered to create a safe and dynamic marketplace, enhancing the campus experience by merging practical functionality with a sleek, modern design.
repo struct
.
├── frontend/                      # Flutter mobile application
│   ├── android/                   # Android-specific configurations
│   ├── ios/                       # iOS-specific configurations
│   ├── lib/                       # Main Flutter source code
│   │   ├── main.dart              # Application entry point
│   │   ├── screens/               # UI screens (Home, Chat, Listings, etc.)
│   │   ├── widgets/               # Reusable UI components
│   │   ├── services/              # Integration with Firebase (auth, notifications, etc.)
│   │   └── models/                # Data models (User, Listing, Review, etc.)
│   ├── assets/                    # Visual assets (images, infographics, fonts)
│   ├── test/                      # Unit and widget tests
│   └── pubspec.yaml               # Flutter configuration and dependencies
│
├── backend/                       # Firebase backend services
│   ├── functions/                 # Cloud Functions for Firebase
│   │   ├── index.js               # Main backend functions file
│   │   └── package.json           # Node dependencies for cloud functions
│   ├── firestore.rules            # Security rules for Firestore
│   └── firebase.json              # Firebase project configuration
│
├── README.md                      # This file
└── .gitignore                     # Git ignore file
