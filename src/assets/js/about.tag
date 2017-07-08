<about>
  <section class="section" id="about">
    <h2>About</h2>
    <div class="img-content-card">
      <div class="img-content-card__content">
        <h4>Choose <span>BAMF</span></h4>
        <p if={typeof aboutContent !== 'undefined'}>
          {aboutContent.why}
        </p>
      </div>
    </div>
  </section>

  <script>
    this.aboutContent = []

    axios.get('/api/about.json')
      .then(res => {
        this.aboutContent = res.data[1]
      }).then(() => this.update())

    riot.tag('raw', '', function(opts) {
      this.root.innerHTML = opts.html
    })
  </script>
</about>
