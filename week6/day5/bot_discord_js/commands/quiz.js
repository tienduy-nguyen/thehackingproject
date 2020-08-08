const { Client, MessageEmbed } = require('discord.js');
const fetch = require('node-fetch');
const { prefix, databaseURL, embedColor } = require('../config/config.json');
const emojis = require('../config/emojiCharacters');
const { execute } = require('./help');
const types = ['multiple', 'boolean'];
const difficulties = ['easy', 'medium', 'hard'];
const choices = [':one:', ':two:', ':three:', ':four:'];
const { shuffle, onlyUnique } = require('../utils/utility');
module.exports = {
  name: 'quiz',
  description: 'Pick what type of quiz you want',

  async execute(client, config, message, args) {
    //Fetch data from Trivia database
    const body = await fetch(
      `${databaseURL}/api.php?amount=5&category=18&type=multiple&encode=url3986`
    );
    const data = await body.json();
    let lenData = data.results.length;
    let randomNumber = Math.floor(Math.random() * lenData);
    let randomQuestion = data.results[randomNumber];
    let question = decodeURIComponent(randomQuestion.question);
    let correctAnswer = randomQuestion.correct_answer;
    let incorrectAnswers = randomQuestion.incorrect_answers;
    incorrectAnswers[incorrectAnswers.length] = correctAnswer;
    const allAnswers = shuffle(incorrectAnswers);

    const printQuestions = [];
    const printEmojis = [];

    for (let i = 0; i < allAnswers.length; ++i) {
      printQuestions.push(
        `${choices[i]}: ${decodeURIComponent(allAnswers[i])}`
      );
    }

    const embed = new MessageEmbed()
      .setTitle(question)
      .setColor(embedColor)
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
      console.log('No answer after 30 seconds, operation canceled.');
    }
  },
};
