(function() {
  if (document.querySelector(".galleria")) {
    (function() {
      document.addEventListener("DOMContentLoaded", function() {
        Galleria.loadTheme(
          "https://cdnjs.cloudflare.com/ajax/libs/galleria/1.5.7/themes/classic/galleria.classic.min.js"
        );
        Galleria.run(".galleria", {
          autoplay: 5000,
          maxScaleRatio: 1
        });
      });
    })();
  }
})();
