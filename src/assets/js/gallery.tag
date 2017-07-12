<gallery>
  <section class="section gallery" id="gallery">
    <h2>Gallery</h2>
    <button if={expandImageSet} onclick={prevImage} class="button button-white prev-button">&larr;</button>
    <div onclick={collapseImage} if={expandImageSet} class="expand-image">
      <button onclick={collapseImage} class="button button-white collapse-image">&times;</button>
      <div if={loading}>Loading...</div>
      <img if={!loading} class="expanded-image" alt="" src="{expandedImage}" />
    </div>
    <button if={expandImageSet} onclick={nextImage} class="next-button button button-white">&rarr;</button>
    <div if={showService} class="gallery-grid lightbg has-radius">
      <p>* Click on an image to expand</p>
      <div onclick={() => expandImage(i, v)} each="{v, i in images}" class="gallery-grid__item">
        <img src="{v}" alt="gallery-image" />
      </div>
    </div>
  </section>

  <script>
    this.images = []
    this.index = 0
    this.showService = false
    this.expandImageSet = false
    this.expandedImage = ''

    expandImage(index, path) {
      this.expandedImage = ''
      this.update({
        index,
        expandImageSet: true,
        expandedImage: path.replace('_thumb', '')
      })
    }

    collapseImage() {
      this.update({
        expandImageSet: false,
        expandedImage: ''
      })
    }

    prevImage() {
      const expandedImage = this.images[this.index - 1] || this.images.pop(this.images[this.index - 1])
      this.loading = true;
      this.update({
        expandedImage: expandedImage.replace('_thumb', ''),
        index: this.index - 1 || this.images.length,
        loading: false
      })
    }

    nextImage() {
      const expandedImage = this.images[this.index + 1] || this.images[0]
      this.update({
        expandedImage: expandedImage.replace('_thumb', ''),
        index: (this.images.length === this.index && this.index !== 0) ? 0 : this.index + 1
      })
    }

    axios.get('/api/service-images.json')
      .then(res => {
        this.update({
          images: res.data,
          showService: true
        })
      })
      .catch(err => console.error(err))
  </script>
</gallery>