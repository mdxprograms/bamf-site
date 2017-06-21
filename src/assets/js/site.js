(function() {
  const navItems = document.querySelectorAll('nav li a');
  const sections = document.querySelectorAll('.section');

  window.onload = function() {
    navItems[0].classList.add('active');
    sections[0].classList.add('active');
  }
  window.onhashchange = function(e) {
    document.getElementById(
      location.hash.replace('#', '') + '-link'
    ).click();
  }
  const navigation = function () {
    function toggleActive(clickedItem) {
      navItems.forEach(function(item) {
        if (item.id !== clickedItem.id) {
          item.classList.remove('active');
        } else {
          item.classList.add('active');
        }
      });

      sections.forEach(function(section) {
        if (section.id !== clickedItem.id.replace('-link', '')) {
          section.classList.remove('active');
        } else {
          section.classList.add('active');
        }
      });
    }

    navItems.forEach(function(item) {
      item.addEventListener('click', function(evt) {
        evt.preventDefault();
        toggleActive(item)
      });
    });
  };
  navigation();
})();
