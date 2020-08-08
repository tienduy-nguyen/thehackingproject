require('dotenv').config();
const { Client, MessageEmbed } = require('discord.js');
const fetch = require('node-fetch');

const client = new Client();
const token = process.env.TOKEN;
const client_id = process.env.CLIENT_ID;

client.login(token);

client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}!`);
});

client.on('message', async (message) => {
  if (message.author.bot) return;
  if (message.content.toLowerCase().startsWith('!quiz')) {
    //Fetch data from Trivia database
    const response = await fetch(
      'https://opentdb.com/api.php?amount=5&category=18&type=multiple'
    );
    const data = await response.json();
    let lenData = data.results.length;
    let randomNumber = Math.floor(Math.random() * lenData);
    let randomQuestion = data.results[randomNumber];
    let question = randomQuestion.question;
    let correctAnswer = randomQuestion.correct_answer;
    let incorrectAnswers = randomQuestion.incorrect_answers;
    incorrectAnswers[incorrectAnswers.length] = correctAnswer;
    const allAnswers = shuffle(incorrectAnswers);

    console.log(randomQuestion);
    console.log(allAnswers);
    console.log(correctAnswer);

    // TODO: Use String.fromCharCode(65+letter) instead of this array?
    const Letters = [':one:', ':two:', ':three:', ':four:'];

    printQuestions = [];
    for (let i = 0; i < allAnswers.length; ++i) {
      printQuestions.push(`${Letters[i]}: ${allAnswers[i]}`);
    }

    const embed = new MessageEmbed()
      .setTitle(question)
      .setColor(0xff0000)
      .setDescription(printQuestions)
      .setFooter(
        'You have one minutes to response this question',
        'https://i.imgur.com/wSTFkRM.png'
      );
    message.channel.send(embed);

    try {
      const filter = (m) => m.author.id == message.author.id;
      const answer = await message.channel.awaitMessages(filter, {
        max: 1,
        time: 60000,
      });
      console.log(`Your response answer is: ${answer.first()}`);
      const ans = answer.first();
      if (ans.content.toLowerCase() == correctAnswer.toLowerCase()) {
        message.reply('You got the question right');
      } else {
        message.reply('That is incorrect.');
      }
    } catch (error) {
      message.reply('No answer after 10 seconds, operation canceled.');
    }
  }
});

function shuffle(arr) {
  for (let i = arr.length - 1; i > 0; --i) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  return arr;
}

function onlyUnique(value, index, self) {
  return self.indexOf(value) === index;
}
