<footer-bar>
  <footer>
    <p>&copy; BAMF General Contracting {currentDate}</p>
    <p>
      Created by <a target="_blank" href="https://joshwaller.me">Josh Waller</a>
    </p>
  </footer>

  <style>
    footer {
      display: flex;
      justify-content: center;
      flex-direction: column;
    }

    footer a {
      color: red;
      text-decoration: none;
    }
  </style>

  <script>
    this.currentDate = moment().year()
  </script>
</footer-bar>