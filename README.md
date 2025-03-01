# ShopSwift - E-Commerce App Documentation

## 📌 Introduction
ShopSwift is a modern, scalable, and user-friendly **Flutter e-commerce application** designed to offer a seamless shopping experience. Built using **Flutter and Firebase**, it supports both **mobile and web**, ensuring a fast and efficient online store.

---

## 🎨 UI/UX & Color Scheme
- **Primary Color:** `#1E3A8A` (Deep Blue – Trust & professionalism)
- **Background:** `#F9FAFB` (Soft White – Clean & minimal)
- **Text & Icons:** `#111827` (Dark Grey – Readability)
- **Accent Color:** `#FACC15` (Gold – Highlights, CTA buttons, discounts)

### **Typography**
- **Headings:** Poppins (Bold & Modern)
- **Body Text:** Inter (Clean & Readable)

---

## 🚀 Features
### **User Authentication**
- ✅ Sign in with Google, Email & Password, Guest Checkout  
- ✅ Firebase Authentication (Secure & Scalable)  

### **Product Management**
- ✅ List of Products (Images, Name, Price, Rating)  
- ✅ Product Details Page (Gallery, Reviews, Add to Cart)  
- ✅ Categories & Filters  

### **Shopping Cart & Checkout**
- ✅ Add to Cart, Remove, Adjust Quantity  
- ✅ Secure Payment (Mpesa, Stripe, PayPal)  
- ✅ Order Summary & Confirmation  

### **Order Management**
- ✅ Track Order Status (Pending, Shipped, Delivered)  
- ✅ Order History & Receipts  
- ✅ Push Notifications for Order Updates  

### **Wishlist & Favorites**
- ✅ Save products for later  
- ✅ Sync across devices  

### **Search & Filters**
- ✅ Smart Search (By Name, Category, Price, Rating)  
- ✅ Sort by Price, Popularity, New Arrivals  

### **Admin Dashboard**
- ✅ Add/Edit/Delete Products  
- ✅ Manage Orders & Customers  
- ✅ Sales Analytics  

---

## 🏗️ Tech Stack
### **Frontend**
- **Flutter** (Cross-platform framework)
- **State Management:** Riverpod
- **UI Framework:** Material 3 + Custom Components
- **Animations:** Lottie + Hero Animations

### **Backend & Database**
- **Firebase Firestore** (NoSQL Database)
- **Firebase Authentication** (Secure Login)
- **Cloud Functions** (Order & Payment Processing)

### **Payments & Transactions**
- **Mpesa Daraja API** (Kenyan Users)
- **Stripe/PayPal** (Global Payments)

### **Storage & Notifications**
- **Firebase Storage** (For Product Images)
- **Firebase Cloud Messaging (FCM)** (Push Notifications)

---

## 📌 Setup & Installation
### **Prerequisites**
- Flutter SDK installed ([Get Flutter](https://flutter.dev/docs/get-started/install))
- Firebase account set up ([Firebase Console](https://console.firebase.google.com/))
- Android/iOS emulator or physical device
- Stripe/Mpesa API credentials (for payments)

### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/brooke2384/shopswift.git
cd shopswift
2️⃣ Install Dependencies
bash
Copy
Edit
flutter pub get
3️⃣ Set Up Firebase
Create a new Firebase project
Enable Firestore, Authentication, and Storage
Download google-services.json (Android) and GoogleService-Info.plist (iOS)
Place them in respective android/app/ and ios/Runner/ directories
4️⃣ Run the App
bash
Copy
Edit
flutter run
📌 API Configuration
Firebase Firestore Structure
yaml
Copy
Edit
users/
  userId/
    name: "John Doe"
    email: "johndoe@example.com"
    orders: [orderId1, orderId2]
products/
  productId/
    name: "Wireless Headphones"
    price: 99.99
    category: "Electronics"
    imageUrl: "https://..."
carts/
  userId/
    items: [
      { productId: "p1", quantity: 2 },
      { productId: "p2", quantity: 1 }
    ]
orders/
  orderId/
    userId: "userId"
    items: [
      { productId: "p1", quantity: 2 }
    ]
    status: "pending"
