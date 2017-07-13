<contact>
  <div class="contact section" id="contact" animate="fade" animate-duration="300ms" animate-delay="300ms">
    <h2>Contact</h2>
    <form class="form" action="https://formspree.io/contact@bamfgc.com" method="POST">
      <h4>Contact Us Today!</h4>
      <p>
        We are license bonded and insured with <u><em>free estimates</em></u>
      </p>
      <input type="text" name="_gotcha" style="display:none" />
      <input type="hidden" name="_subject" value="New form submission from bamfgc.com!" />
      <input type="hidden" name="_next" value="https://bamfgc.com">
      <input placeholder="Name" type="text" name="name" required>
      <input placeholder="Email" type="email" name="_replyto" required>
      <input placeholder="Phone" type="tel" name="phone" />
      <textarea placeholder="Project Details" name="details" required></textarea>
      <button class="button button-red" type="submit">Send</button>
    </form>
  </div>

  <script>
    this.mixin(riotAnimate)
  </script>
</contact>