//----------------------------------------
// Function : 1
//----------------------------------------
let footerClickCount = 0;
function footerClick() {
  footerClickCount += 1;
  if (footerClickCount <= 1) {
    console.log(`Footer clicked - ${footerClickCount} time`);
  } else {
    console.log(`Footer clicked - ${footerClickCount} times`);
  }
}

//----------------------------------------
// Function : 2
//----------------------------------------
function collapseNavbar() {
  const navHeader = document.getElementById('navbarHeader');
  navHeader.classList.toggle('collapse');
  console.log(navHeader.classList);
}

//----------------------------------------
// Function : 3
//----------------------------------------
function editCard(num = 'all', color) {
  const cards = document.querySelectorAll('.card-body');
  if (num == 'all') {
    const [head, ...tail] = cards;
    for (let card of tail) {
      const btnEdit = card.querySelector('.btn-outline-secondary');
      const cardText = card.querySelector('.card-text');
      editCardText(btnEdit, cardText, color);
    }
    return;
  } else {
    const card = cards[num];
    const btnEdit = card.querySelector('.btn-outline-secondary');
    const cardText = card.querySelector('.card-text');
    editCardText(btnEdit, cardText, color);
  }
}
function editCardText(btnEdit, cardText, color) {
  btnEdit.addEventListener('click', (x) => {
    if (cardText.style.color != color) {
      cardText.style.color = color;
    } else {
      cardText.style.color = '';
    }
  });
}

function makeFirstCardInRed() {
  editCard(0, 'red');
}

//----------------------------------------
// Function : 4
//----------------------------------------
function makeAllCardInGreen() {
  editCard('all', 'green');
}

//----------------------------------------
// Function : 5
//----------------------------------------
function disableTagLinkBootstrap() {
  const navBar = document.querySelector('.navbar.box-shadow');
  const link = document.querySelector('link');
  navBar.addEventListener('dblclick', () => {
    link.toggleAttribute('disabled');
  });
}

//Already functions
window.addEventListener('DOMContentLoaded', (event) => {
  footerClickCount = 0;
  makeFirstCardInRed();
  makeAllCardInGreen();
  disableTagLinkBootstrap();
});
