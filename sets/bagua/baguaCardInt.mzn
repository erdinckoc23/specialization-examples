% Attack on walls

int: nSpots;
set of int: SPOT = 1..nSpots; % spot set
array[SPOT] of int: damage;

enum SYMB; % property set
array[SYMB] of set of SPOT: group;

int: size;
array[1..size] of var SPOT: attacks; % decision variable (set variable)

constraint forall(s in SYMB)(sum(i in 1..size)(attacks[i] in group[s]) <= 1);
constraint forall(i in 1..size-1)(attacks[i] < attacks[i+1]);

var int: totalDamages = sum(p in attacks)(damage[p]);
solve maximize (totalDamages); % Goal: maximize attack reward

output["Attacks: ", show(attacks), " and damages: ", show(totalDamages)]