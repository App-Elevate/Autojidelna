importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts(
  "https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js"
);

firebase.initializeApp({
  apiKey: 'AIzaSyARLbCza3INmFGD3P62q7Bl0H_Hag_Ndzg',
  authDomain: 'app-elevate-core.firebaseapp.com',
  projectId: 'app-elevate-core',
  storageBucket: 'app-elevate-core.appspot.com',
  messagingSenderId: '466976066624',
  appId: '1:466976066624:web:6591f71f8c1987b75423a5',
  measurementId: 'G-GQN6RGH7K1',
});

const messaging = firebase.messaging();