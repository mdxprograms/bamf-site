<footer-bar>
  <footer>
    <a target="_blank" href="https://facebook.com/BAMFGeneralContracting">
      <img src="/assets/images/global/facebook.svg" alt="facebook">
    </a>
    <a tel="{phone}">{phone}</a>
    <address>
      {address}
    </address>
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
    this.address = "1278 Normandie Court, Avon IN 46123"
    this.phone = "317.281.2559"
  </script>
</footer-bar>