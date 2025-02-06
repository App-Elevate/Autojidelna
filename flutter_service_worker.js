'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"privacy-policy/index.html": "25f5741dbfbac9b33fc382a0f75750c9",
"flutter.js": "f393d3c16b631f36852323de8e583132",
".well-known/apple-app-site-association": "c28d5dd618d9d665b14a05e870a4764e",
".well-known/assetlinks.json": "bda4b060282dd2fa732bf45b1991f235",
"assets/NOTICES": "ed2f64a631d37673984f1112625a58d8",
"assets/AssetManifest.json": "a4a023af4b3d9aaa5ee632d6e5312b4a",
"assets/AssetManifest.bin": "1d99fd8b8ae7e6d16da0794a9cd705ac",
"assets/packages/material_symbols_icons/lib/fonts/MaterialSymbolsOutlined.ttf": "7aea00f7c54c353801bfaf736e7d3e01",
"assets/packages/material_symbols_icons/lib/fonts/MaterialSymbolsRounded.ttf": "a746d9cbef2bb51727505533df736e70",
"assets/packages/material_symbols_icons/lib/fonts/MaterialSymbolsSharp.ttf": "a740229d3d430189bb3ba036011d6735",
"assets/packages/awesome_notifications/test/assets/images/test_image.png": "c27a71ab4008c83eba9b554775aa12ca",
"assets/packages/flutter_octicons/lib/fonts/octicons48.ttf": "899653286225aa8e1e6002fac6d4ab31",
"assets/packages/flutter_octicons/lib/fonts/octicons12.ttf": "7775d37fdb1296048c73e860a4089eb9",
"assets/packages/flutter_octicons/lib/fonts/octicons24.ttf": "b026a2b0a58ec2f150a0fda886c3ba01",
"assets/packages/flutter_octicons/lib/fonts/octicons16.ttf": "a4bdbdba0999592976a6ce936eef83dd",
"assets/packages/flutter_octicons/lib/fonts/octicons96.ttf": "a19b2e77a1a509bc7a7fa528df270166",
"assets/FontManifest.json": "39ea14662dd828f9f0e138f1af48026c",
"assets/assets/logo.svg": "d80cda793f5ff991babd97be0738b2cb",
"assets/assets/fonts/Inter-VariableFont_slnt,wght.ttf": "32204736a4290ec41200abe91e5190d1",
"assets/assets/fonts/Lexend-VariableFont_wght.ttf": "a5144e9ee41f343224a9efc3efcbf1bc",
"assets/assets/app_favicon.webp": "33f24aff6e037324fbec457a8544e1d5",
"assets/assets/app_elevate.webp": "54018d4b04ac979b01040e3afc81e24e",
"assets/fonts/MaterialIcons-Regular.otf": "18ee09fe9225a2d0437ea14c1cfc2ce5",
"assets/AssetManifest.bin.json": "a508d8f13a69799ae6c376be055c1b49",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shorebird.yaml": "ac22c7d7221301c73d982f3cd43ab99d",
"flutter_bootstrap.js": "7c0cfda3bf8802cadeaa7f76b1aafab3",
"redirect.js": "5796bb6e5906aff3e582ad3b780f627e",
"main.dart.js": "3862d512c4222804faf9679994147af5",
"manifest.json": "620d362b862df3a78fb9832e14d2e788",
"version.json": "219fe2140adff04970022aebc1ae89a0",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"icons/apple-icon-72x72.png": "5a4412d5cb1b9fdc24e68551265374e9",
"icons/ms-icon-150x150.png": "2b455a4a0d52ca93ce61f9e6519467c2",
"icons/favicon-16x16.png": "a73e5532fa848c2671db5c1ff2449ebf",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/favicon.ico": "9b31a4405454c1d6e5a46e0760b9a67b",
"icons/ms-icon-144x144.png": "33733a18613319a051a2e799d7f4f73a",
"icons/android-icon-48x48.png": "4d3edf9a93e78e4b6bdf718b537c9063",
"icons/ms-icon-70x70.png": "d1f5f9df6d5b7ac6b7e4b8c0073dd294",
"icons/android-icon-36x36.png": "ce0cde956d1f5e32dfbcb14f455b08fe",
"icons/android-icon-192x192.png": "aa881afdceec5442a00aa3317672792c",
"icons/apple-icon-57x57.png": "60d31225dc0c76b36f29de2baf393081",
"icons/apple-icon-120x120.png": "6516664eb119bcf65176a72c81286e8a",
"icons/apple-icon-76x76.png": "1c1d14bd039d250009ac3fce5881cff1",
"icons/android-icon-96x96.png": "1d85cdafcb139df913e551be071546ff",
"icons/ms-icon-310x310.png": "ffe731a562e7f3b5aa75e0b973cfad44",
"icons/favicon-32x32.png": "7dc3e4115f38875d2e5ac2e4b12eb144",
"icons/apple-icon-180x180.png": "57b586ac0a7609bf2cd5835ee779ed59",
"icons/android-icon-72x72.png": "5a4412d5cb1b9fdc24e68551265374e9",
"icons/apple-icon-precomposed.png": "d6a0df6a0990e8fee34a3aa7b58b046e",
"icons/apple-icon-144x144.png": "1da03c758354f4433696d30f6e22c52f",
"icons/android-icon-144x144.png": "1da03c758354f4433696d30f6e22c52f",
"icons/apple-icon-152x152.png": "c8870b01cd3928d74212b2441feda7e7",
"icons/apple-icon.png": "d6a0df6a0990e8fee34a3aa7b58b046e",
"icons/favicon-96x96.png": "afbf9794f2b66f4ba84cfe3116912e4e",
"icons/apple-icon-60x60.png": "06432705070214c4e49512fd8ff71382",
"icons/apple-icon-114x114.png": "972d3ce198fc04888eaeaac8b1f2dfde",
"index.html": "d4c3d18e744cedeb2c7347b8db4cf2ec",
"/": "d4c3d18e744cedeb2c7347b8db4cf2ec"};
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
