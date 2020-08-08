require('dotenv').config();
const emojis = require('./emojiCharacters');
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

    const printQuestions = [];
    const printEmojis = [];
    const eOne = client.emojis.cache.get('741604359258767441');

    for (let i = 0; i < allAnswers.length; ++i) {
      printQuestions.push(`${Letters[i]}: ${allAnswers[i]}`);
    }

    const embed = new MessageEmbed()
      .setTitle(question)
      .setColor(0xff0000)
      .setDescription(printQuestions);
    const questionDiscord = await message.channel.send(embed);
    questionDiscord.react(emojis[1]).then((r) => {
      questionDiscord.react(emojis[2]);
      questionDiscord.react(emojis[3]);
      questionDiscord.react(emojis[4]);
    });

    try {
      const filter = (reaction, user) =>
        user.id == message.author.id &&
        (reaction.emoji.name == '👍' || reaction.emoji.name == '👎');

      const answer = await message.awaitReactions(filter, {
        max: 1,
        time: 30000,
      });

      const ans = answer.first();
      if (ans.emoji.name == '👍') {
        message.reply('You got the question right');
      } else {
        message.reply('That is incorrect.');
      }
    } catch (error) {
      message.reply('No answer after 30 seconds, operation canceled.');
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
