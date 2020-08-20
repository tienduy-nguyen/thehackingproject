const name = prompt("Comment tu t'appelles?");
console.log('Bonjour monde!');
console.log(`Bonjour ${name}!`);

//------------------------------------
// Bonus: for running with nodejs
// Uncomment the code below and run it with : `node script_2.js`
//------------------------------------

// const readline = require('readline').createInterface({
//   input: process.stdin,
//   output: process.stdout,
// });

// readline.question("Comment tu t'appelle?\n", (name) => {
//   console.log(`Bonjour ${name}!`);
//   readline.close();
// });
