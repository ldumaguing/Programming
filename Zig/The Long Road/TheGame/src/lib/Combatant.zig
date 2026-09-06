pub const Combatant = struct {
    instanceID: i32,
    hex_x: i32,
    hex_y: i32,
    hex_z: i32,
    flag1: i32,
    id: i32, // Combatant ID
    currState: i32,

    pub fn init(instanceID: i32, hex_x: i32, hex_y: i32, id: i32, currState: i32) Combatant {
        return Combatant{
            .instanceID = instanceID,
            .hex_x = hex_x,
            .hex_y = hex_y,
            .flag1 = 0,
            .id = id,
            .currState = currState,
        };
    }
};
