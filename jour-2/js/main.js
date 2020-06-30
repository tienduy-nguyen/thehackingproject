function toggleUserMenu(isOverlay = false) {
  const userMenu = document.querySelector('.navbar__user-menu');
  const overlay = document.querySelector('.navbar__user-overlay');
  if (!isOverlay) {
    if (userMenu.style.display == 'block') {
      userMenu.style.display = 'none';
      overlay.style.display = 'none';
    } else {
      userMenu.style.display = 'block';
      overlay.style.display = 'block';
    }
    return;
    //If click to overlay, we hide the menu and overlay
  } else {
    userMenu.style.display = 'none';
    overlay.style.display = 'none';
  }
}

function toggleMenu() {
  const userMenu = document.querySelector('.navbar__user-menu');
  const overlay = document.querySelector('.navbar__user-overlay');
  if (userMenu.style.display == 'block') {
    userMenu.style.display = 'none';
    overlay.style.display = 'none';
  } else {
    userMenu.style.display = 'block';
    overlay.style.display = 'block';
  }
}

function toggleGoogleAppsList() {
  const appList = document.getElementById('google-apps-list');
  const overlay = document.querySelector('.google-apps__overlay');
  if (appList.style.display == 'block') {
    appList.style.display = 'none';
    overlay.style.display = 'none';
  } else {
    appList.style.display = 'block';
    overlay.style.display = 'block';
  }
}
function toggleOverlayAppsList(isOverlay = false) {
  const appList = document.getElementById('google-apps-list');
  const overlay = document.querySelector('.google-apps__overlay');
  if (!isOverlay) {
    if (appList.style.display == 'block') {
      appList.style.display = 'none';
      overlay.style.display = 'none';
    } else {
      appList.style.display = 'block';
      overlay.style.display = 'block';
    }
    return;
    //If click to overlay, we hide the menu and overlay
  } else {
    appList.style.display = 'none';
    overlay.style.display = 'none';
  }
}
