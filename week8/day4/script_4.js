const entrepreneurs = [
  { first: 'Steve', last: 'Jobs', year: 1955 },
  { first: 'Oprah', last: 'Winfrey', year: 1954 },
  { first: 'Bill', last: 'Gates', year: 1955 },
  { first: 'Sheryl', last: 'Sandberg', year: 1969 },
  { first: 'Mark', last: 'Zuckerberg', year: 1984 },
  { first: 'Beyonce', last: 'Knowles', year: 1981 },
  { first: 'Jeff', last: 'Bezos', year: 1964 },
  { first: 'Diane', last: 'Hendricks', year: 1947 },
  { first: 'Elon', last: 'Musk', year: 1971 },
  { first: 'Marissa', last: 'Mayer', year: 1975 },
  { first: 'Walt', last: 'Disney', year: 1901 },
  { first: 'Larry', last: 'Page', year: 1973 },
  { first: 'Jack', last: 'Dorsey', year: 1976 },
  { first: 'Evan', last: 'Spiegel', year: 1990 },
  { first: 'Brian', last: 'Chesky', year: 1981 },
  { first: 'Travis', last: 'Kalanick', year: 1976 },
  { first: 'Marc', last: 'Andreessen', year: 1971 },
  { first: 'Peter', last: 'Thiel', year: 1967 },
];

//Filter list of entrepreneurs of 70s ;
function filter70(arr) {
  return arr.filter((x) => x.year.toString().split('')[2] == 7);
}
function compareFirstName(a, b) {
  aName = a.first.toLowerCase();
  bName = b.first.toLowerCase();

  if (aName > bName) return 1;
  if (aName < bName) return -1;
  return 0;
}
function compareLastName(a, b) {
  aName = a.last.toLowerCase();
  bName = b.last.toLowerCase();

  if (aName > bName) return 1;
  if (aName < bName) return -1;
  return 0;
}

//Sort array which contains name of entrepreneur ;
function sortByFirstName(arr) {
  return arr.sort(compareFirstName).map(({ first, last }) => ({ first, last }));
}

//Age of each entrepreneur ;
function addAge(arr) {
  const currentYear = new Date().getFullYear();
  return arr.map((item) => ({ ...item, age: currentYear - item.year }));
}

//Sort array by lastname ;
function sortByLastName(arr) {
  return arr.sort(compareLastName);
}

console.log('\n----------------------------------------------------');
console.log(
  'Filtre dans cette liste les entrepreneurs qui sont nés dans les années 70 ;'
);
console.log(filter70(entrepreneurs));

console.log('\n----------------------------------------------------');
console.log(
  'Sors une array qui contient le prénom et le nom des entrepreneurs ;'
);
console.log(sortByFirstName(entrepreneurs));

console.log('\n----------------------------------------------------');
console.log("Quel âge aurait chaque inventeur aujourd'hui ?");
console.log(addAge(entrepreneurs));

console.log('\n----------------------------------------------------');
console.log('Trie les entrepreneurs par ordre alphabétique du nom de famille.');
console.log(sortByLastName(entrepreneurs));
