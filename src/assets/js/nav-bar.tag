<nav-bar>
  <nav>
    <ul class="items">
      <li each={navItems}>
        <a
          onclick={setActive}
          class={
            active: url === active,
            button: true,
            'button-white': true
          }
          id="{id}"
          href="{url}"
        >
          {title}
        </a>
      </li>
    </ul>
  </nav>

  <nav onclick={toggleMenu} class="mobile-toggle">
    <hr>
    <hr>
    <hr>
  </nav>

  <nav class={open: this.mobileShow} if={this.mobileShow}>
    <ul>
      <li each={navItems}>
        <a
          onclick={setActive}
          class={
            active: url === active,
            button: true,
            'button-white': true
          }
          id="{id}"
          href="{url}"
        >
          {title}
        </a>
      </li>
    </ul>
  </nav>

  <script>
    this.navItems = []
    this.active = null
    this.mobileShow = false

    toggleMenu() {
      this.mobileShow = !this.mobileShow
    }

    setActive(e) {
      this.active = e.item.url
      this.mobileShow = false
    }

    axios.get('/api/nav.json')
      .then(res => {
        this.navItems = res.data

        if (location.hash === '') {
          this.active = '/#services'
        } else {
          this.active = this.navItems.find(i => i.url === `/${location.hash}`).url
        }
        this.update()
      })
      .catch(err => console.error(err))

  </script>
</nav-bar>