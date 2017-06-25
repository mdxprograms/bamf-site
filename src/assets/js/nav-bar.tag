<nav-bar>
  <nav>
    <ul class="items">
      <li each={navItems}>
        <a id="{id}" class="button button-white" href="{url}">{title}</a>
      </li>
    </ul>
  </nav>

  <script>
    this.navItems = []

    axios.get('/api/nav.json')
      .then(res => {
        this.navItems = res.data
        this.update()
      })
      .catch(err => console.error(err))

  </script>
</nav-bar>