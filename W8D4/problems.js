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