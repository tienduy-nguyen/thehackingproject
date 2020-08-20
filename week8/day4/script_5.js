const books = [
  { title: 'Gatsby le magnifique', id: 133712, rented: 39 },
  { title: 'A la recherche du temps,perdu', id: 237634, rented: 28 },
  { title: 'Orgueil & Préjugés', id: 873495, rented: 67 },
  { title: 'Les frères Karamazov', id: 450911, rented: 55 },
  { title: 'Dans les forêts de Sibérie', id: 8376365, rented: 15 },
  { title: "Pourquoi j'ai mangé mon père", id: 450911, rented: 45 },
  { title: 'Et on tuera tous les affreux', id: 67565, rented: 36 },
  { title: 'Le meilleur des mondes', id: 88847, rented: 58 },
  { title: 'La disparition', id: 364445, rented: 33 },
  { title: 'La lune seule le sait', id: 63541, rented: 43 },
  { title: 'Voyage au centre de la Terre', id: 4656388, rented: 38 },
  { title: 'Guerre et Paix', id: 748147, rented: 19 },
];

function isAllRented(arr) {
  return arr.every((x) => x.rented >= 1);
}
function bookMaxRented(arr) {
  return arr.reduce((maxRented, book) =>
    maxRented.rented > book.rented ? maxRented : book
  );
}
function bookMinRented(arr) {
  return arr.reduce((minRented, book) =>
    minRented.rented < book.rented ? minRented : book
  );
}
function compareTitle(a, b) {
  aTitle = a.title.toLowerCase();
  bTitle = b.title.toLowerCase();
  if (aTitle > bTitle) return 1;
  if (aTitle < bTitle) return -1;
  return 0;
}

// Est-ce que tous les livres ont été au moins empruntés une fois ?
console.log('\n----------------------------------------------------');
console.log('Est-ce que tous les livres ont été au moins empruntés une fois ?');
console.log(isAllRented(books));

// Quel est livre le plus emprunté ?
console.log('\n----------------------------------------------------');
console.log('Quel est livre le plus emprunté ?');
console.log(bookMaxRented(books));

// Quel est le livre le moins emprunté ?
console.log('\n----------------------------------------------------');
console.log('Quel est le livre le moins emprunté ?');
console.log(bookMinRented(books));

// Trouve le livre avec l'ID: 873495 ;
console.log('\n----------------------------------------------------');
console.log("Trouve le livre avec l'ID: 873495 ;");
console.log(books.find((x) => x.id == '873495'));

// Supprime le livre avec l'ID: 133712 ;
console.log('\n----------------------------------------------------');
console.log("Supprime le livre avec l'ID: 133712 ;");
let newBooks = books.filter((x) => x.id != '133712');
console.log(newBooks);

// Trie les livres par ordre alphabétique (sans celui avec l'ID 133712 car il est supprimé).
console.log('\n----------------------------------------------------');
console.log(
  "Trie les livres par ordre alphabétique (sans celui avec l'ID 133712 car il est supprimé)."
);
console.log(newBooks.sort(compareTitle));
