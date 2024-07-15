// Retrieve the FLUTTER_BASE_HREF from the HTML meta tag if it exists

const baseElement = document.querySelector('base');
let baseHref = "/";

// Check if the <base> element exists
if (baseElement) {
  // Retrieve the value of the href attribute
  const baseUrl = baseElement.getAttribute('href');
  if(baseUrl) {
    baseHref = baseUrl;
  }
}

// Ensure baseHref ends with a slash
if (!baseHref.endsWith("/")) {
  baseHref += "/";
}

// Get the current path and search (query parameters) from the window location
var path = window.location.pathname;
var search = window.location.search;

// Check if the current URL path is not already in hash format
if (path && !window.location.hash && path !== "/") {
  // Ensure the path does not include the base href prefix
  if (path.startsWith(baseHref)) {
    path = path.slice(baseHref.length);
  }

  // Redirect to the hash-based URL with the base href and query parameters
  window.location.replace(baseHref + "#/" + path + search);
}
