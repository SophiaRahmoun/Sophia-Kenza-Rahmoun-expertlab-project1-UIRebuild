# 🚲 Villo Brussels – iOS App Rebuild (UIRebuild)

This is my personal redesign and rebuild of the **Villo Brussels** bike-sharing app, created as part of the ExpertLab course at Erasmushogeschool Brussel.  
My objective was to challenge myself to grow as an **iOS Developer**, both technically and in terms of user experience.

This app is a newer version of the Villo app, with:
- Full SwiftUI interface
- Live map integration
- User authentication via my own backend
- Favorite stations, subscription management, and more

It connects to my own [Node.js + MongoDB backend API](https://github.com/SophiaRahmoun/Sophia-Kenza-Rahmoun-expertlab-project1-UIRebuild/tree/main/back-end) and the official public data API from the Brussels Region.

---

## 🛠 Tech Stack (Frontend)

- **SwiftUI** (iOS 17)
- **MVVM Architecture**
- **MapKit**
- **CoreLocation**
- **UserDefaults** (local state management)
- **Custom components** (Filter panel, modal sheets, etc.)
- **External API**:  
  Brussels open data:  
  `https://opendata.brussels.be/api/explore/v2.1/catalog/datasets/stations-villo-bruxelles-rbc/records?limit=100`

---

## Features ✨ 

-  MapView with real-time bike station data  
-  Custom FilterView (mechanical, electric, parking)  
-  Subscription system with plan selection and custom quantity logic  
-  Favorites management  
-  User authentication with token (via backend)  
-  Payment method UI  
-  Adaptive, intuitive UI in SwiftUI  
-  All views connected via custom modal logic or navigation stack  
-  Uses my own backend for real-time data sync

---

## 🚀 How to Run (Xcode)

1. Clone the repo:
   ```bash
   git clone https://github.com/SophiaRahmoun/Sophia-Kenza-Rahmoun-expertlab-project1-UIRebuild.git
   ```

2. Open the `.xcodeproj` in the root folder.

3. Make sure your **Simulator runtime is up to date**  
   > For iOS 18 errors: Go to Xcode > Settings > Platforms and download iOS 18.3 runtime

4. Launch the app on Simulator (iPhone 16 Pro recommended)

---

## 🔗 Backend API Setup

This app connects to a custom-built backend API hosted separately.  
Find full setup instructions and code here:
>[Backend Repo (Node.js + Express + MongoDB)](https://github.com/SophiaRahmoun/Sophia-Kenza-Rahmoun-expertlab-project1-UIRebuild/tree/main/back-end)

You’ll need to:
- Clone the backend
- Create a `.env` file with Mongo URI and JWT secret
- Run with `npm run dev`
- Use Postman to test `/api/auth/register` and `/api/auth/login`
- Use the token in your app (stored in UserDefaults for now)

---

## 💡 What I Learned

This was my **first ExpertLab project**, and it taught me to:

- Build a functional iOS app from scratch using SwiftUI and MVVM
- Implement dynamic features like filtering, map interactions, and modals
- Improve user experience by modernizing an outdated interface
- Connect my frontend to my own Node.js backend API
- Understand how APIs, token security, and real user states work
- Debug and test efficiently with Postman + SwiftUI previews

I focused on giving this app a cleaner, more modern look, while preserving the practical features Villo users care about.

---

## 📚 Frontend Sources & Help

These resources helped me build the frontend:

- [How to turn MKMapView dark](https://stackoverflow.com/questions/58565004/how-can-i-turn-the-mkmapview-for-dark-mode) — used to enable dark mode in MapKit  
- [Use hex color in SwiftUI](https://stackoverflow.com/questions/56874133/use-hex-color-in-swiftui) — used to implement custom hex-based Color extension  
- [Build Node.js in Xcode IDE](https://stackoverflow.com/questions/17654939/how-to-build-nodejs-in-xcode-ide) — used to integrate backend into Xcode build  
- GitHub Copilot; used for suggestions and overall bug fixes in SwiftUI components
- [ChatGPT ](https://chatgpt.com/share/69245806-2f30-8006-aa02-54cbfced486f)

---

## 🧪 Status

✅ App UI & logic done  
✅ API connected  
🔜 Bike rent confirmation popup still to be implemented

---

Feel free to explore the repo or contact me for more details!!! ;)

— *Sophia Kenza Rahmoun*
