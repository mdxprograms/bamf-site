<about>
  <section class="section" id="about" animate="fade" animate-duration="300ms" animate-delay="300ms">
    <h2>About</h2>
    <div class="img-content-card">
      <div class="img-content-card__content">
        <img src="/assets/images/about/jamescourtney.jpg" alt="">
        <p class="lightbg has-radius" if={typeof aboutContent !== 'undefined'}>
          {aboutContent.why}
        </p>
      </div>
    </div>
    <a href="#contact" class="button button-red">Contact Us Today!</a>
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

    this.mixin(riotAnimate)
  </script>
</about>
