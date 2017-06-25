<services>
  <section class="section" id="services">
    <h2>Services</h2>
    <div class="gallery-grid">
      <div each={services} class="gallery-grid__item">
        <raw html="{content}"></raw>
      </div>
    </div>
  </section>

  <script>
    this.services = []

    axios.get('/api/services.json')
      .then(res => {
        res.data.map(d => this.services.push(d))
        this.update()
      })
      .catch(err => console.error(err))

    riot.tag('raw', '', function(opts) {
      this.root.innerHTML = opts.html
    })
  </script>
</services>