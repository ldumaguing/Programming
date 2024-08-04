mod hexagon;

use hexagon::*;

fn main() {
    println!("Hello, world!");

    let curr_hex: HexID = HexID(1,0);
    let adjacent_hex_id: HexID = get_adjacent_hex_id(&curr_hex, Direction::SE);
    println!("...{},{}", adjacent_hex_id.0, adjacent_hex_id.1);

    //let curr_hex: HexID = HexID(1,0);
    foo(&curr_hex);
}
