(function(riot) {
  const banner = document.querySelector('.banner')
  const contactCTA = document.querySelector('.banner a')
  const bannerWatch = function() {
    if (location.hash === '#services' || location.hash === '') {
      banner.classList.add('show')
    } else {
      banner.classList.remove('show')
    }
  }

  contactCTA.addEventListener('click', function (e) {
    e.preventDefault()
    const contactLink = document.getElementById('contact-link')
    contactLink.click()
  })

  bannerWatch()

  window.onhashchange = function(e) {
    bannerWatch()
  }
})()
