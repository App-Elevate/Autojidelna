// Retrieve the FLUTTER_BASE_HREF from the HTML meta tag if it exists
var baseHref =
  document
    .querySelector('meta[name="FLUTTER_BASE_HREF"]')
    ?.getAttribute("content") || "/";

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
