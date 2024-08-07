mod hexagon;

use hexagon::*;

fn main() {
    println!("Hello, world!");

    // Adjacent HexID
    let curr_hex: HexID = HexID(38, 15);

    println!("{},{}", curr_hex.0, curr_hex.1);
    let adjacent_hex_id: HexID = get_adjacent_hex_id(&curr_hex, Direction::SE);
    println!(
        "    adj  {},{} -> {}",
        adjacent_hex_id.0,
        adjacent_hex_id.1,
        Direction::SE as i8
    );

    // HexID to HexLoc
    let hex_loc: HexLoc = convert_hex_id_2_loc(&curr_hex);
    println!("    {},{}", hex_loc.0, hex_loc.1);

    // degrees
    let targ_hex: HexID = HexID(37, 15);

    let x: f32 = get_degrees(&curr_hex, &targ_hex);
    println!(">>> {x} degrees");

    // distance
    let x: f32 = get_distance(&curr_hex, &targ_hex);
    println!(">>> {x} distance");

    // hex distance
    let x: i32 = get_hex_distance(&curr_hex, &targ_hex);
    println!(">>> {x} hexes");
}
