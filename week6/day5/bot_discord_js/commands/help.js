const config = require('../config/config.json');
const fs = require('fs');

module.exports = {
  name: 'help',
  description: 'Show list of all commands.',
  execute(client, config, message, args) {
    const data = [];
    const commandFiles = fs
      .readdirSync('./commands')
      .filter((file) => file.endsWith('.js'));
    data.push(
      '---------------------------------------------------------------------------'
    );
    data.push('**Welcome to THP bot.**\n');
    data.push('Here is all of list commands you can do: \n');
    for (const file of commandFiles) {
      const command = require(`./${file}`);
      data.push(
        `**${config.prefix}${command.name}** :      ${command.description}`
      );
    }
    data.push(
      '---------------------------------------------------------------------------'
    );
    message.channel.send(data, { split: true });
  },
};
