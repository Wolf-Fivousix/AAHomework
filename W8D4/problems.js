let spitFire = function (name) {
    return `Ancient ${name} Dragon Breather`;
};

function dragonize(names_array, cheesecake_function)
{
    let dragon_names = names_array.map(spitFire);
    dragon_names.forEach(cheesecake_function);
}


let roar = function(name)
{
    console.log(name);
}

dragonize(["Wolf", "Bunny"], roar);

function Wolf(name, power, spells)
{
  this.name = name;
  this.power = power;
  this.spells = spells;
}

Wolf.prototype.howl = function ()
{
  console.log(`${this.name} the wolf goes AaaauuUUUUuUUuuu`);
};

Wolf.prototype.powerUp = function(boost)
{
  this.power += boost;
};

Wolf.prototype.addSpell = function(spell)
{
  this.spells.push(spell);
};

Wolf.prototype.randomCast = function()
{
  const randomSpell = Math.random() * this.spells.length;
  return this.spells[Math.round(randomSpell) - 1];
};
let wolf1 = new Wolf("Black", 100, ["Fire Ball", "Ice Wall"]);
wolf1.howl();
wolf1.powerUp(8000);
console.log(wolf1.power);
wolf1.addSpell("Death Stride");
console.log(wolf1.spells);
console.log(wolf1.randomCast());