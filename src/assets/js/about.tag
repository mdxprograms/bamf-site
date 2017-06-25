<about>
  <section class="section" id="about">
    <h2>About</h2>
    <div class="img-content-card">
      <div class="img-content-card__content">
        <h4>Why Choose BAMF</h4>
        <p each={aboutContent}>
          {why}
        </p>
      </div>
    </div>
  </section>

  <script>
    this.aboutContent = []

    axios.get('/api/about.json')
      .then(res => {
        res.data.map(d => this.aboutContent.push(d))
        this.update()
      })
      .catch(err => console.error(err))

    riot.tag('raw', '', function(opts) {
      this.root.innerHTML = opts.html
    })
  </script>
</about>
