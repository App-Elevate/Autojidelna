importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts(
  "https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js"
);

firebase.initializeApp({
  apiKey: "AIzaSyBlMC15yTKNCS-J3Fncd3LxjiNaZgjKgaw",
  appId: "1:108088693003:web:0843b05cd66085bf96d20e",
  messagingSenderId: "108088693003",
  projectId: "autojidelna",
  authDomain: "autojidelna.firebaseapp.com",
  databaseURL:
    "https://autojidelna-default-rtdb.europe-west1.firebasedatabase.app",
  storageBucket: "autojidelna.appspot.com",
  measurementId: "G-3SKH2E1QEC",
});

const messaging = firebase.messaging();