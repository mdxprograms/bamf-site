document.addEventListener("DOMContentLoaded", function() {
  (function() {
    if (document.querySelector(".mobile-toggle")) {
      const toggle = document.querySelector(".mobile-toggle");
      const nav = document.querySelector("nav");

      toggle.addEventListener("click", function() {
        if (site.nav.isOpen) {
          nav.classList.remove("open");
          site.nav.isOpen = false;
        } else {
          nav.classList.add("open");
          site.nav.isOpen = true;
        }
      });
    }
  })();
});
