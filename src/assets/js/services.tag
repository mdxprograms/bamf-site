<services>
  <section class="section" id="services">
    <h2>Gallery</h2>
    <div onclick={collapseImage} if={expandImageSet} class="expand-image">
      <button onclick={collapseImage} class="button button-white collapse-image">&times;</button>
      <img class="expanded-image" alt="" src="{expandedImage}"/>
    </div>
    <div if={showService} class="gallery-grid">
      <p>Click on an image to expand</p>
      <div onclick={() => expandImage(image)} if={(!image.includes('default.jpg') && !image.includes('default.jpeg'))} each="{image in images}" class="gallery-grid__item">
        <img src="{image}" alt="gallery-image" />
      </div>
    </div>
  </section>

  <script>
   let images = []
   this.showService = false
   this.expandImageSet = false
   this.expandImage = ''

   expandImage(path) {
     this.expandedImage = ''
     this.update({
       expandImageSet: true,
       expandedImage: path
     })
   }

   collapseImage() {
     this.update({
       expandImageSet: false,
       expandedImage: ''
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
</services>
