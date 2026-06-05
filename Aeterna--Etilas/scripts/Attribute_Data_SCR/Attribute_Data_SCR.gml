function Attribute_data(){



global.attribute_data = {

    Strength: function(val) {
		
		if (val >= 10) {
			
	        car  = 40 + ((val - 10) * 20);
	        dmg  = floor((val - 10) / 2);
			

	    } else {

	        // different scaling for low stats
	        car  = 40 - ((10 - val) * 5); // negative penalty
	        dmg  = ceil((val - 10) / 2); // less harsh damage penalty
	    }
		if(val <= 0){
			car  = 0;
	        dmg  = 0;
		}
        return [
            "Carry Capacity: " + string(car) +" lbs",
            "Strength Damage Bonus: " + string(floor(dmg))
        ];
    },

    Dexterity: function(val) {
		if (val >= 10) {

	        atk  = val;
	        move = floor(30 + ((val - 10) * 5));
	        dmg  = floor((val - 10) / 3);

	    } else {

	        // different scaling for low stats
	        atk  = val; // negative penalty
	        move = ceil(30 + (ceil((val - 10)/2) * 5)); // softer penalty
	        dmg  = ceil((val - 10) / 2); // less harsh damage penalty
	    }
		if(val <= 0){
			atk  = 0;
	        move = 0;
	        dmg  = 0;
		}
        return [
            "Base Attack Check: " + string(atk),
            "Move Speed: " + string(floor(move)) + " ft",
            "Dexterity Damage Bonus: " + string(floor((dmg)))
        ];
    },

    Endurance: function(val) {
		if (val >= 10) {

	        fat  = (5 + floor((val - 10) / 2));
	        rec = (3 + floor(((val - 10) /3)));

	    } else {

	        // different scaling for low stats
	        fat  = (5 - floor((10 - val) / 2));
	        rec = (3 - floor(((10 - val) /4)));
	    }
		if(val <= 0){
			fat = 0;	
			rec = 0;
		}
        return [
            "Fatigue Limit: " + string(fat),
            "Fatigue Recovery Rate: " + string(rec)
        ];
    },
	
	
	Reflexes: function(val) {
		if (val >= 10) {

	        int  = (val + (val - 10));
	        def = val;

	    } else {

	        // different scaling for low stats
	        int  = (val - (10 - val));
	        def = val;
	    }
		if(val <= 0){
			int  = 0;
	        def = 0;
		}
        return [
            "Initiative Check: " + string(int),
            "Base Defense Check: " + string(def)
        ];
    },
	
	
	Intelligence: function(val) {
		
		if (val >= 10) {

	        slot  = (20 + (val - 10));
	        logi  = (val + (val - 10));

	    } else {

	        // different scaling for low stats
	        slot  = 20 + ceil((val - 10) / 2); 
	        logi  = ceil(val + (val - 10)); 
	    }
		if(val <= 0){
			slot  = 0;
	        logi  = 0;
		}
        return [
            "Character Points: " + string(slot),
            "Logic Test: " + string(logi)
        ];
    },
	
	
	Perception: function(val) {
		
		if (val >= 10) {

	        pass  = (val - 10);
	        act  = ((val - 10) + val);

	    } else {

	        // different scaling for low stats
	        pass  = (val - 10); 
	        act  = (val); 
	    }
		if(val <= 0){
			pass  = 0;
	        act  = 0;
		}
        return [
            "Passive Degrees of Success: " + string(pass),
            "Active Perception Check: " + string(act)
        ];
    },
	
	
	
	Willpower: function(val) {
		
		if (val >= 10) {

	        con  = (floor(((val - 10) / 2) + val));
	        psy  = floor((val - 10) / 3);

	    } else {

	        // different scaling for low stats
	        con  = (floor((1+(val - 10) / 2) + val)); 
	        psy  = floor(1+(val - 10) / 3); 
	    }
		if(val <= 0){
			con  = 0;
	        psy  = 0;
		}
        return [
            "Consciousness Save: " + string(con),
            "Psychic Damage Reduction: " + string(psy)
        ];
    },
	
	
	
	Charm: function(val) {
		
		if (val >= 10) {

	        per  = floor(((val - 10) / 2) + val);
	        app  = (val - 10);

	    } else {

	        // different scaling for low stats
	        per  = floor(((val - 10) / 2) + val); 
	        app  = (val - 10); 
	    }
		if(val <= 0){
			per  = 0;
	        app  = 0;
		}
        return [
            "Persuasion Check: " + string(per),
            "Appeal Reaction Adjustment: " + string(app)
        ];
    },
	
	
	
	Leadership: function(val) {
		
		if (val >= 10) {

	        com  = floor(((val - 10) / 2) + val);
	        fol  = 2 + (val - 10);

	    } else {

	        // different scaling for low stats
	        com  = ceil((1 + (val - 10) / 2) + val); 
	        fol  = ceil(2 + (1 + (val - 10) / 4)); 
	    }
		if(val <= 0){
			com  = 0;
	        fol  = 0;
		}
        return [
            "Command Check: " + string(com),
            "Follower Unit Size Limit: " + string(fol)
        ];
    },
	
	Toughness: function(val) {
		
		if (val >= 10) {

	        cdt  = floor(((val - 10) / 2));
	        heal  = 2 + floor((val - 10) / 4);

	    } else {

	        // different scaling for low stats
	        cdt  = ceil(((val - 10) / 2)); 
	        heal  = 2 + ceil(((val - 10) / 4)); 
	    }
		if(val <= 0){
			cdt  = 0;
	        heal  = 0;
		}
        return [
            "CDT Bonus: " + string(cdt),
            "Natural Healing Rate: " + string(heal)
        ];
    },

};

}