(function() {
  const banner = document.querySelector('.banner')
  const bannerWatch = function() {
    if (location.hash === '#services') {
      banner.classList.add('show')
    } else {
      banner.classList.remove('show')
    }
  }

  window.onload = function() {
    bannerWatch()
  }

  window.onhashchange = function(e) {
    e.preventDefault()
    bannerWatch()
  }
})()
