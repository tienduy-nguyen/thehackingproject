// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

window.onclick = function (event) {
  openCloseDropdown(event);
};

function closeAllDropdown() {
  let dropdowns = document.getElementsByClassName('dropdown-expand');
  for (let item of dropdowns) {
    item.classList.remove('dropdown-expand');
  }
}

function openCloseDropdown(event) {
  if (!event.target.matches('.dropdown-toggle--cus')) {
    // Close dropdown when click out of dropdown menu
    closeAllDropdown();
  } else {
    let toggle = event.target.dataset.toggle;
    let content = document.getElementById(toggle);
    if (content.classList.contains('dropdown-expand')) {
      closeAllDropdown();
    } else {
      closeAllDropdown();
      content.classList.add('dropdown-expand');
    }
  }
}
