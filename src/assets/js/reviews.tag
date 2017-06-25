<reviews>
  <section class="section reviews" id="reviews">
    <h2>Reviews</h2>
    <div class="reviews__collection">
      <p each={item in reviews}>
        <raw html="{item.text}"></raw>
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
  </script>
</reviews>