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

//----------------------------------------
// Function : 6
//----------------------------------------
function mouseOverBtnView() {
  const cards = document.querySelectorAll('.card.box-shadow');
  for (let card of cards) {
    const btnView = card.querySelector('.btn-success');
    const cardText = card.querySelector('.card-text');
    const cardImg = card.querySelector('img');
    actionBtnView(btnView, cardText, cardImg);
  }
}
function actionBtnView(btnView, cardText, cardImg) {
  btnView.addEventListener('mouseenter', (x) => {
    cardText.style.color = '#fff';
    cardImg.style.transform = 'scale(0.8)';
  });
  btnView.addEventListener('mouseleave', (x) => {
    cardText.style.color = '';
    cardImg.style.transform = 'scale(1)';
  });
}

//----------------------------------------
// Function : 7
//----------------------------------------
function nextBtn() {
  const cards = document.querySelectorAll('.col-md-4');
  const nextBtn = document
    .querySelector('main')
    .querySelector('a.btn.btn-secondary');
  nextBtn.addEventListener('click', () => {
    const lastCard = cards[cards.length - 1];
    const firstCard = cards[0];
    const parent = lastCard.parentNode;
    parent.removeChild(lastCard);
    parent.insertBefore(lastCard, parent.firstChild);
  });
}

//----------------------------------------
// Function : 8
//----------------------------------------
function previousBtn() {
  const cards = document.querySelectorAll('.col-md-4');
  const nextBtn = document
    .querySelector('main')
    .querySelector('a.btn.btn-primary');
  nextBtn.addEventListener('click', () => {
    const firstCard = cards[0];
    const parent = firstCard.parentNode;
    parent.removeChild(firstCard);
    const lastCard = cards[cards.length - 1];
    parent.insertBefore(firstCard, lastCard.nextSibling);
  });
}

//Already functions
window.addEventListener('DOMContentLoaded', (event) => {
  footerClickCount = 0;
  makeFirstCardInRed();
  makeAllCardInGreen();
  disableTagLinkBootstrap();
  mouseOverBtnView();
  nextBtn();
  previousBtn();
});