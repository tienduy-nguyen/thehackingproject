function getDivOfCategory() {
  const fantasy = document.querySelector('.Fantasy').after(div);
  console.log(fantasy);
}

window.addEventListener('DOMContentLoaded', (event) => {
  getDivOfCategory();
});
