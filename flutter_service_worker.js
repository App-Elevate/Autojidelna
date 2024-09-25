'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "dbe130943c116a37a491f0895bf42230",
"assets/assets/app_favicon.webp": "33f24aff6e037324fbec457a8544e1d5",
"assets/assets/app_elevate.webp": "54018d4b04ac979b01040e3afc81e24e",
"assets/AssetManifest.bin.json": "41d5f6acd251d003ce6de70b1f3524c3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "f1b2f1cb3ca85675ff27fb7bd74e2c9b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/shorebird.yaml": "ac22c7d7221301c73d982f3cd43ab99d",
"assets/NOTICES": "827148ec6a406c4520cddf0890fd6d41",
"assets/fonts/MaterialIcons-Regular.otf": "1b70a1d380b55a6b4b4872a8782f0393",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"main.dart.js": "0889f65b51182a5a1eafa8e3b1af2a36",
"icons/ms-icon-310x310.png": "ffe731a562e7f3b5aa75e0b973cfad44",
"icons/apple-icon.png": "d6a0df6a0990e8fee34a3aa7b58b046e",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/apple-icon-180x180.png": "57b586ac0a7609bf2cd5835ee779ed59",
"icons/apple-icon-60x60.png": "06432705070214c4e49512fd8ff71382",
"icons/favicon-16x16.png": "a73e5532fa848c2671db5c1ff2449ebf",
"icons/ms-icon-150x150.png": "2b455a4a0d52ca93ce61f9e6519467c2",
"icons/apple-icon-144x144.png": "1da03c758354f4433696d30f6e22c52f",
"icons/favicon-32x32.png": "7dc3e4115f38875d2e5ac2e4b12eb144",
"icons/apple-icon-76x76.png": "1c1d14bd039d250009ac3fce5881cff1",
"icons/android-icon-192x192.png": "aa881afdceec5442a00aa3317672792c",
"icons/android-icon-48x48.png": "4d3edf9a93e78e4b6bdf718b537c9063",
"icons/android-icon-36x36.png": "ce0cde956d1f5e32dfbcb14f455b08fe",
"icons/ms-icon-70x70.png": "d1f5f9df6d5b7ac6b7e4b8c0073dd294",
"icons/apple-icon-114x114.png": "972d3ce198fc04888eaeaac8b1f2dfde",
"icons/apple-icon-72x72.png": "5a4412d5cb1b9fdc24e68551265374e9",
"icons/apple-icon-precomposed.png": "d6a0df6a0990e8fee34a3aa7b58b046e",
"icons/favicon.ico": "9b31a4405454c1d6e5a46e0760b9a67b",
"icons/ms-icon-144x144.png": "33733a18613319a051a2e799d7f4f73a",
"icons/android-icon-72x72.png": "5a4412d5cb1b9fdc24e68551265374e9",
"icons/apple-icon-57x57.png": "60d31225dc0c76b36f29de2baf393081",
"icons/android-icon-96x96.png": "1d85cdafcb139df913e551be071546ff",
"icons/apple-icon-120x120.png": "6516664eb119bcf65176a72c81286e8a",
"icons/apple-icon-152x152.png": "c8870b01cd3928d74212b2441feda7e7",
"icons/favicon-96x96.png": "afbf9794f2b66f4ba84cfe3116912e4e",
"icons/android-icon-144x144.png": "1da03c758354f4433696d30f6e22c52f",
"flutter_bootstrap.js": "9be6e5404d0e209a75a3a6e9f546652c",
".well-known/assetlinks.json": "2c04df9865a0f66af9cc16949e4a5724",
".well-known/apple-app-site-association": "c28d5dd618d9d665b14a05e870a4764e",
"firebase-messaging-sw.js": "d166d0730b359e67417a35aac2abd5a5",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"redirect.js": "5796bb6e5906aff3e582ad3b780f627e",
"index.html": "0270c0c34baf64a23287ff552392976d",
"/": "0270c0c34baf64a23287ff552392976d",
"version.json": "7978c6f44ff7dd942d70066fac361641",
"manifest.json": "620d362b862df3a78fb9832e14d2e788",
"privacy-policy/index.html": "25f5741dbfbac9b33fc382a0f75750c9"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
