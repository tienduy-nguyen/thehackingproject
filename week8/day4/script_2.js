function factorial(num) {
  let result = 1;
  for (let i = 2; i <= num; ++i) {
    result *= i;
  }
  return console.log(result);
}

console.log('\n-----------------------------------------------------');

console.log(
  "Vous pouvez utiliser la méthode: factorial(num) to calculer les factoriels d'un numéro que vous avez besoin."
);

console.log(
  'Dans le console, juste taper factorial(num) et voir les résultats.'
);
