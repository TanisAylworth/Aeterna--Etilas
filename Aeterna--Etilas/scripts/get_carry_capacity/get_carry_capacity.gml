function get_carry_capacity(){
global.size_data = {};

global.size_data.tiny = {
    carry_base : 20,
    carry_per_strength : 10
};

global.size_data.small = {
    carry_base : 30,
    carry_per_strength : 15
};

global.size_data.medium = {
    carry_base : 40,
    carry_per_strength : 20
};

global.size_data.large = {
    carry_base : 60,
    carry_per_strength : 30
};

global.size_data.huge = {
    carry_base : 80,
    carry_per_strength : 40
};
}