<reviews>
  <section class="section reviews" id="reviews" animate="fade" animate-duration="300ms" animate-delay="300ms">
    <h2>Reviews</h2>
    <div class="reviews__collection">
      <p class="lightbg has-radius" each={item in reviews}>
        <raw class="reviews__collection-text" html="{item.text}"></raw>
      </p>
    </div>
  </section>

  <script>
    this.reviews = []

    axios.get('/api/reviews.json')
      .then(res => {
        this.reviews = res.data
        this.update()
      })
      .catch(err => console.error(err))

    riot.tag('raw', '', function(opts) {
      this.root.innerHTML = opts.html
    })

    this.mixin(riotAnimate)
  </script>
</reviews>
