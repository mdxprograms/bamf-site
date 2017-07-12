<services>
  <div class="services section" id="services">
    <div class="services__offered">
      <div if={images} class="services__offered-service" each={image in images}>
        <div class="service-background" style="background: url({image}) center/cover no-repeat;"></div>
      </div>
    </div>
  </div>

  <script>
    // this.images = []

    // setStyle(e, image) {
    //   console.log(e, image)
    // }
    // axios.get('/api/home.json')
    //   .then(e => this.update({ images: e.data }))
  </script>
</services>