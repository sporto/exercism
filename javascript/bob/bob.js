var Bob = function() {
  var self = {};

  function nothing(input) {
    if (input === '') return true;
    var ma = input.match(/\s+/);
    return ma && (ma.toString() === input);
  }

  function question(input) {
    return input.substr(-1) === '?'
  }

  function shout(input) {
    if (!input.match(/[A-Z]/)) return false;
    return !input.match(/[a-zäöü]/)
  }

  function hey(input) {
    if (nothing(input))  return 'Fine. Be that way!';
    if (shout(input))    return 'Woah, chill out!';
    if (question(input)) return 'Sure.';
    return "Whatever."
  }

  self.hey = hey;

  return self;
}; 



module.exports = Bob;