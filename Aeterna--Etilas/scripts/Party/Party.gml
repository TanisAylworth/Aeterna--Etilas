function Party() constructor{
	
	_party = [];
	_max_party_slots = 6;
	
	add = function(_sprite, _name, _species, _strength, _dexterity, _endurance, _willpower, _perception, _intelligence, _reflexes, _toughness, _leadership, _charm)
	{
		if(array_length(_party) < _max_party_slots){
			array_push(_party, {
				sprite: _sprite,
				name: _name,
				species: _species,
				strength: _strength,
				dexterity: _dexterity,
				endurance: _endurance,
				willpower: _willpower,
				perception: _perception,
				intelligence: _intelligence,
				reflexes: _reflexes,
				toughness: _leadership,
				charm: _charm,
				
			});
		}
	}
	
	getAll = function() {
		return _party;	
	}
	
	
	remove = function(index) {
		array_delete(_party, index, 1);
	}


	select = function(index) {
		deselect();
		_party[index].hover = true;
	}
	
	
	deselect = function() {
		for(var i = 0; i < array_length(_party); i++) {
			_party[i].hover = false;	
			
		}
	}






}