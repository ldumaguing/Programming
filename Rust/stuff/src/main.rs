mod hexagon;

use hexagon::*;

fn main() {
    println!("Hello, world!");

    let curr_hex: HexID = HexID(1,0);
    println!("{},{}", curr_hex.0, curr_hex.1);
    let adjacent_hex_id: HexID = get_adjacent_hex_id(&curr_hex, Direction::SE);
    println!("    adj  {},{} -> {}", adjacent_hex_id.0, adjacent_hex_id.1, Direction::SE as i8);


    convert_hex_id_2_loc(&curr_hex);
}
