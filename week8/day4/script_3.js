let num = prompt(
  "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
);

function displayPyramid(num) {
  for (i = 1; i <= num; ++i) {
    let str = '';
    for (let j = 1; j <= num - i; ++j) {
      str += ' ';
    }
    for (let k = 1; k <= i; ++k) {
      str += '#';
    }
    console.log(str);
  }
}

console.log('Réssultat de pyramide:');
displayPyramid(num);
// displayPyramid(10);
