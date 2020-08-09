const { MessageEmbed } = require('discord.js');
const fetch = require('node-fetch');
const { databaseURL, embedColor } = require('../config/config.json');
const types = ['multiple', 'boolean'];
const difficulties = ['easy', 'medium', 'hard'];
const choices = [':one:', ':two:', ':three:', ':four:'];
const { shuffle } = require('../utils/utility');
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
    let correctAnswer = decodeURIComponent(randomQuestion.correct_answer);
    let incorrectAnswers = randomQuestion.incorrect_answers;
    incorrectAnswers[incorrectAnswers.length] = correctAnswer;
    const allAnswers = shuffle(incorrectAnswers);

    //Get emoji for correct answers
    const emojiList = ['1️⃣', '2️⃣', '3️⃣', '4️⃣'];
    const emojiAnswer = emojiList[allAnswers.indexOf(correctAnswer)];
    const printQuestions = [];

    for (let i = 0; i < allAnswers.length; ++i) {
      printQuestions.push(
        `${choices[i]}: ${decodeURIComponent(allAnswers[i])}`
      );
    }

    const embed = new MessageEmbed()
      .setTitle(question)
      .setColor(embedColor)
      .setDescription(printQuestions)
      .setFooter(
        '**Notice**: Use the below reactions to answer this multiple choice question. And you have only one minutes to answer it.'
      );
    const questionDiscord = await message.channel.send(embed);

    try {
      await questionDiscord.react(emojiList[0]);
      await questionDiscord.react(emojiList[1]);
      await questionDiscord.react(emojiList[2]);
      await questionDiscord.react(emojiList[3]);
    } catch (error) {
      console.error('One of the emojis failed to react.');
    }

    const filter = (reaction, user) => {
      return (
        emojiList.includes(reaction.emoji.name) && user.id === message.author.id
      );
    };

    try {
      const collected = await questionDiscord.awaitReactions(filter, {
        max: 1,
        time: 60000,
        errors: ['time'],
      });
      const reaction = collected.first();
      if (reaction.emoji.name == emojiAnswer) {
        await questionDiscord.react('✅');

        const embed = new MessageEmbed()
          .setTitle(question)
          .setColor(embedColor)
          .setDescription(printQuestions)
          .setFooter('✅ Greeeeeeeeeeeeeeeeeeeeeeeet.');
        await questionDiscord.edit(embed);
        await message.reply('Nice job! 10/10! You deserve some cake!');
      } else {
        await questionDiscord.react('❌');

        const embed = new MessageEmbed()
          .setTitle(question)
          .setColor(embedColor)
          .setDescription(printQuestions)
          .setFooter('❌ Oh noooooooooooooooooooooooo.');
        await questionDiscord.edit(embed);
        await message.reply(
          `Nope, sorry, it's ${emojiAnswer} : ${correctAnswer}.`
        );
      }
    } catch (error) {
      console.error(error.message);
      message.reply('You did not reacted with the reactions.');
    }
  },
};
