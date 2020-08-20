function acneBot() {
  let ans = 'first';
  console.log(
    `Bienvenue! Vous voulez rencontrer notre robot. 
    Si vous ne voulez parler plus avec lui, 
    donnez une réponse en 'q' ou en 'quit'. 
    Ou vous pouvez juste cliquer sur le button 'Cancel'.`
  );
  console.log("Comment vous sentez aujoud'hui?");
  while (ans != 'quit' || ans != 'q') {
    ans = prompt('Tapper votre phrase ici: ');
    ans = ans.trim();

    switch (true) {
      case ans[ans.length - 1] == '?':
        console.log('Ouais Ouais...');
        break;
      case ans && ans == ans.toUpperCase():
        console.log('Pwa, calme-toi...');
        break;
      case ans.toLowerCase().includes('fortnite'):
        console.log("On s' fait une partie soum-soum ?");
        break;
      case !ans:
        console.log("t'es en PLS ?");
        break;
      case ans == 'quit' || ans == 'q':
        console.log('Merci. A bientôt');
        return;
      default:
        console.log('balek.');
        break;
    }
  }
}

acneBot();
