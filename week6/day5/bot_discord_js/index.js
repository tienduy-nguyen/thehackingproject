const { Client, Collection } = require('discord.js');
require('dotenv').config();
const fs = require('fs');
const config = require('./config/config.json');

const client = new Client();
const token = process.env.TOKEN;
const client_id = process.env.CLIENT_ID;
const cooldowns = new Collection();

client.commands = new Collection();
const commandFiles = fs
  .readdirSync('./commands')
  .filter((file) => file.endsWith('.js'));

for (const file of commandFiles) {
  const command = require(`./commands/${file}`);

  // set a new item in the Collection
  // with the key as the command name and the value as the exported value
  client.commands.set(command.name, command);
}

// login to Discord with your app's token
client.login(token);

client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}!`);
});

client.on('message', (message) => {
  const args = message.content.slice(config.prefix.length);
  const commandName = args.trim().toLowerCase();
  const command = client.commands.get(commandName);

  if (message.author.bot) return;
  if (!command) return;
  try {
    command.execute(client, config, message, args);
  } catch (error) {
    console.error(error);
    message.reply('there was an error trying to execute the command!');
  }
});
