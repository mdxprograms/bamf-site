<services>
  <section class="section" id="services">
    <h2>Services</h2>
    <div class="gallery-grid">
      <div each={services} class="gallery-grid__item">
        <raw html="{content}"></raw>
      </div>
    </div>
    <div if={showService} class="carousel">
      <div each="{image in images}" class="carousel-item">
        <img src="{image}" alt=""/>
      </div>
    </div>
  </section>

  <script>
    this.services = []
    this.images = []
    this.showService = false

    initCarousel(service) {
      this.images = []
      axios.get('/api/service-images.json')
        .then(res => {
          if (res.data[service] && res.data[service].length) {
            this.images = res.data[service]
            this.showService = true
            this.update()
          }
        })
        .catch(err => console.error(err))
    }

    axios.get('/api/services.json')
      .then(res => {
        this.services = res.data
        this.update()
      })
      .catch(err => console.error(err))

    riot.tag('raw', '', function (opts) {
      this.root.innerHTML = opts.html
    })
  </script>
</services>