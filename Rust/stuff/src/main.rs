mod hexagon;

use hexagon::*;

fn main() {
    println!("Hello, world!");

    // Adjacent HexID
    let curr_hex: HexID = HexID(0, 0);
    println!("{},{}", curr_hex.0, curr_hex.1);
    let adjacent_hex_id: HexID = get_adjacent_hex_id(&curr_hex, Direction::SE);
    println!(
        "    adj  {},{} -> {}",
        adjacent_hex_id.0,
        adjacent_hex_id.1,
        Direction::SE as i8
    );

    // HexLoc
    let hex_loc: HexLoc = convert_hex_id_2_loc(&curr_hex);
    println!("    {},{}", hex_loc.0, hex_loc.1);

    // degrees
    let targ_hex: HexID = HexID(2, 1);
    let x: f32 = get_degrees(&curr_hex, &targ_hex);
    println!(">>> {x} degrees");
}
