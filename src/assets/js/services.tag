<services>
  <div class="services section" id="services" animate="fade" animate-duration="300ms" animate-delay="300ms">
    <h2>Services</h2>
    <div class="services__offered-service lightbg has-radius" each="{service, i in services}">
      <figure class={'is-right': i % 2 === 0, 'is-left': i % 2 !== 0}>
        <img src="{service.image}" alt="{service.title}" />
      </figure>
      <raw html="{service.content}"></raw>
    </div>
  </div>

  <script>
    this.services = []

    axios.get('/api/home.json')
      .then(e => this.update({services: e.data}))

    riot.tag('raw', '', function(opts) {
      this.root.innerHTML = opts.html
    })

    this.mixin(riotAnimate)
  </script>
</services>