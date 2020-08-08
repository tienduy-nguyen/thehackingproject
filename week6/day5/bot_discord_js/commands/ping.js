module.exports = {
  name: 'ping',
  description: 'Bot will response you a message : "!Pong"',
  execute(client, config, message, args) {
    message.channel.send('Pong!');
  },
};
