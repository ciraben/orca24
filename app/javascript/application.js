// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

window.addEventListener("DOMContentLoaded", () => {
  const audio_element = document.querySelector("audio")
  const button = document.querySelector("button")

  button.addEventListener("click", (event) => {
    event.preventDefault();
    audio_element.play();
  });
});
