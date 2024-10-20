// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

window.addEventListener("turbo:submit-start", (event) => {
  console.log("before submit!");

  const audio_element = document.querySelector("audio")
  audio_element.pause();
  audio_element.currentTime = 0;
});

window.addEventListener("turbo:frame-render", async (event) => {
  console.log("after render!");

  const audio_element = document.querySelector("audio")
  audio_element.play();
});
