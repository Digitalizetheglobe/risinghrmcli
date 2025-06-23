const staticCacheName = "pwa-v" + new Date().getTime();
const filesToCache = [
    '/',
    '/css/app.css',
    '/js/app.js',
    '/icons/icon-72x72.png',
    '/icons/icon-96x96.png',
    '/icons/icon-128x128.png',
    '/icons/icon-144x144.png',
    '/icons/icon-152x152.png',
    '/icons/icon-192x192.png',
    '/icons/icon-384x384.png',
    '/icons/icon-512x512.png',
];

self.addEventListener("install", event => {
    event.waitUntil(
        caches.open(staticCacheName)
            .then(cache => cache.addAll(filesToCache))
    );
});

self.addEventListener('activate', event => {
    event.waitUntil(
        caches.keys().then(cacheNames => {
            return Promise.all(
                cacheNames
                    .filter(cacheName => cacheName.startsWith("pwa-"))
                    .filter(cacheName => cacheName !== staticCacheName)
                    .map(cacheName => caches.delete(cacheName))
            );
        })
    );
});

self.addEventListener("fetch", event => {
    // Network first strategy for API calls
    if (event.request.url.includes('/api/')) {
        return fetch(event.request)
            .then(res => {
                const clonedRes = res.clone();
                caches.open(staticCacheName)
                    .then(cache => cache.put(event.request, clonedRes));
                return res;
            })
            .catch(() => caches.match(event.request));
    }
    
    // Cache first strategy for static assets
    event.respondWith(
        caches.match(event.request)
            .then(response => response || fetch(event.request))
    );
});