'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "d062f8f84f5d457aba314240e48a2b10",
"index.html": "855525e2c69ab20b038cd0f43a2f003d",
"/": "855525e2c69ab20b038cd0f43a2f003d",
"main.dart.js": "b7250f6a7f84c0899cd84c38ba3bb08f",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "6576ea2d861043c0b5bca0506d261172",
"assets/AssetManifest.json": "fd4e72399fbccaab794ebbd09b65203e",
"assets/NOTICES": "b0155d7a75bd95f33433a202c153ed92",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.smcbin": "420145140a4a6c9cb2b9483b63e231b5",
"assets/fonts/MaterialIcons-Regular.otf": "d5301c38dee4f4fb2f2b2cb1372f3233",
"assets/assets/trofeo.json": "af797d0f2981fac807aa31ae3ed09738",
"assets/assets/carrito.png": "d0e36ab5f411e76701e89d4145e494a8",
"assets/assets/trompo.png": "3abcf92ad362d09f4e4173db664894a6",
"assets/assets/barco.png": "48430402dbd01c535ea64290f408112c",
"assets/assets/tacha.png": "11b3e72b9667d412e6205c20eff5c31a",
"assets/assets/quienes_somos.png": "593e7b0210c2d90df7401edd70217a29",
"assets/assets/arbol.png": "0b2c7f7a9c8c1dbd2fd8bce4ee8a65fb",
"assets/assets/buho.png": "15c9212e4b693d0c66e5a1e26037cdf0",
"assets/assets/equis.png": "2b1d7add8075fd6f5376b5d7ff09c1b3",
"assets/assets/igualicono.png": "71d86738b8e983ad359ac03763cbbb52",
"assets/assets/btnquienessomos.png": "ac4c311ec865c104cc26f0ea6a07915c",
"assets/assets/finalizar.png": "161e320b0d5ecf2068396d4e489f395f",
"assets/assets/banana.json": "8dd5be8235d25a735855e8243f0f9ada",
"assets/assets/muneca.png": "d3690f76b53cae358a11650916605b56",
"assets/assets/animate_fruit.json": "125c44f2750cf6492a49cd024cadd564",
"assets/assets/sandia.png": "8f7b22eef1b82bf567a1922cc921cb35",
"assets/assets/btnmision.png": "ba97b7a68a8773ecdad5c2cc067e55f9",
"assets/assets/estrella.png": "d8f87896b0a5dbfeceb8bb2422c58b35",
"assets/assets/nino.png": "64d3e87b69b004fff1fe365abdb66f68",
"assets/assets/osito.png": "c7f9af9df06f8d7ed44d8816a0a91410",
"assets/assets/btnservicio.png": "45c2ba7aa6d9cef388ca9ef231da29b8",
"assets/assets/mango.png": "00904287f2907308b4216b65c83ae0ce",
"assets/assets/mision_vision.png": "5a684d8cec8ea9ca3702c392ab948406",
"assets/assets/manzana.png": "bb610e91adee7122fc9063aff3c8b4c8",
"assets/assets/ejerciciosResta.png": "84141208201d4f7d55673ac8deadd336",
"assets/assets/juguete.png": "45e97b474ba396fb5c37f11f7fe7bc8b",
"assets/assets/pelota.png": "6f524a43ced15bd1f680a6cf2de392e2",
"assets/assets/trex.png": "3082c9bbccb78aab083f5be8442d4261",
"assets/assets/cerrar.png": "b3f911e7afa8721a5b0726d4847f3b18",
"assets/assets/lapicito.png": "cfc66c57b3ea62875186ea6c1ed14cb1",
"assets/assets/patito.png": "07ddeff578e5d1656b6dd0fb936d3cf9",
"assets/assets/camion.png": "17f9854a4eb9a0152fe0fe1491deb472",
"assets/assets/suma.mp4": "ba6d39ba951493ff92604f2c2aec28bf",
"assets/assets/verificar.png": "40279678c6075c668b9d47f99cc9342d",
"assets/assets/platano.png": "bdc25381a2f8a671383f29a9e1df8bdd",
"assets/assets/nube.png": "79a21b81fc58bb784a6d996905d074c6",
"assets/assets/escuchar_audio.png": "bbf7effb97aa8d408b4ad7ffca123222",
"assets/assets/boton_vacio.png": "9d02518f7ace0e20741042f28df79d2c",
"assets/assets/avionsito.png": "8b53e11163c53d6420892e008acd5bd2",
"assets/assets/siguientes_problemas.png": "3404dabddca4c7a63857a569d6d658c8",
"assets/assets/avioneta.png": "f7a660c09f95b4592f979f200cb7def2",
"assets/assets/boton_suma.png": "783b3af37ccf37ad12ea89ceb417df85",
"assets/assets/zanahoria.png": "967ea7de70c2cb13b115ec72fc8e450b",
"assets/assets/restaicono.png": "8ddbcf3266395e389cc86ad13c94e73d",
"assets/assets/cong_example.json": "575e06cd4e763626fdfe2579022a4448",
"assets/assets/ejercicios_refuerzo.png": "3834a708b2bdd1452cb0f12eced8c76c",
"assets/assets/encabezado_suma.png": "109ebaf6026cd8118a0649e012bf897c",
"assets/assets/robot.png": "1b6c22dd87407e62a8889d67e27bb705",
"assets/assets/tambor.png": "7d07e0500a01e122a67f84c99bfd1975",
"assets/assets/frase.png": "27cc150b7ab087eac63566d2b46db179",
"assets/assets/canoa.png": "1148f75778ebaa2c06f0325efbfa41c9",
"assets/assets/fresa.png": "351e9140bc4f784113fbfc28b07e5a8f",
"assets/assets/sirema.png": "11e577f5e66f117a335c2240b8cf3e98",
"assets/assets/sumaicono.png": "bafd38c878b514346c76dbf9e02a8090",
"assets/assets/lapiz.png": "19c791fff89721b03bf257908a473dfe",
"assets/assets/ejerciciosSuma.png": "43c47c0f0ebfb06431de71e4d8be10e9",
"assets/assets/encabezado_botones.png": "a4efa0a772f1443b6b229bb0efd545fc",
"assets/assets/palomita.png": "bc0a2c52280300250a84d1e00650883a",
"assets/assets/btnejercicios.png": "2bd81bc718c3c36109ea4546859e23f8",
"assets/assets/lapices.png": "e8d4cfa721f6ead12828c18da691fb5a",
"assets/assets/ganador.json": "ba40674ea720c6da8550f19a34a3eb47",
"assets/assets/boton_resta.png": "cf699039caebc5e615c38bbb78194349",
"assets/assets/caracol.png": "53e6d6a214d0a49a6a0f31681be9a215",
"assets/assets/lapiz_servicio.png": "b27d6172aa6f836994d596a6e259e0aa",
"assets/assets/helicoptero.png": "9239eac6d9e77346cddf5734374f5121",
"assets/assets/restas.mp4": "3b3e939b064d5f1d67b496fb74fa6e89",
"assets/assets/btndiscalculia.png": "1d44d455e8e13f49d48fad17bbee0ea2",
"assets/assets/discalculia.png": "05948a6ce50802e4673837ffcb30806c",
"assets/assets/avion.png": "90ef083f297b47bfc3ada986ba7de724",
"assets/assets/fondo.png": "1517cb44022ef71b37804a6f324f9296",
"assets/assets/cohete.png": "e278096b72a51ca0cd0399dd3c03ff59",
"assets/assets/inforacion_discalculia.png": "24bf759091039639cc5d542ee899a90c",
"assets/assets/aprender_sumar.png": "76502eb9c0302345e25c84b3e747095f",
"assets/assets/libro.png": "2737f1f3f2c5cbdf05d8558e8aca027c",
"assets/assets/motivar.png": "9138b441636a0560edf1cb7e71b937b6",
"assets/assets/nuestro_servicio.png": "f2d28c16dc4c0b82b16c8a598a10bcc8",
"assets/assets/aprender_resta.png": "2cab06110a250d9dd21f5dcee498f68e",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
