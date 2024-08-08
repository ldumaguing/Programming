mod hexagon;

use hexagon::*;

fn main() {
    println!("Hello, world!");
	let hex0 = Hexagon {
		id: (4,5),
	};

	let hex1 = Hexagon {
		id: (14,15),
	};

	//println!("{},{}", hex0.id.0, hex0.id.1);
	//hex0.foo();

	let loc: (f64, f64) = hex0.get_loc();
	println!("{},{}", loc.0, loc.1);
/*
    let curr_hex: HexID = HexID(38, 15);
    let targ_hex: HexID = HexID(8, 14);


    // Adjacent HexID
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
    let x: f64 = get_degrees(&curr_hex, &targ_hex);
    println!(">>> {x} degrees");

    // distance
    let x: f64 = get_distance(&curr_hex, &targ_hex);
    println!(">>> {x} distance");

    // hex distance
    let x: i64 = get_hex_distance(&curr_hex, &targ_hex);
    println!(">>> {x} hexes");
    
    // path
    let mut path: Vec<HexID> = Vec::new();
    path = get_path(&curr_hex, &targ_hex);
    //let x: &HexID = &path[1];
    let x: &HexID = &path.get(0).expect("***** Out of range. *****");
    println!("> ({}, {})", x.0, x.1);
    println!("> {} len", path.len());
    for hx in path.iter() {
    	println!("{},{}", hx.0, hx.1);
    }
*/
}
