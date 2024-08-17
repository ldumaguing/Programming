mod hexagon;

use hexagon::*;

fn main() {
    println!("Hello, world!");
    let hex0 = Hexagon { id: (2, 2), placement: -1 };
    let hex1 = Hexagon { id: (1, 0), placement: -1 };

    let loc: (f64, f64) = hex0.get_loc();
    println!("hex0 location: {},{}", loc.0, loc.1);

    let deg = hex0.get_degrees(&hex1);
    println!("hex0 - hex1: {} degrees", deg);

    let dist = hex0.get_distance(&hex1);
    println!("hex0 - hex1: {} distance", dist);

    let adj = hex0.get_adjacent_id(Direction::N);
    println!("hex0: ({},{}) adjacent ID", adj.0, adj.1);
    let adj = hex0.get_adjacent_id(Direction::NE);
    println!("hex0: ({},{}) adjacent ID", adj.0, adj.1);
    let adj = hex0.get_adjacent_id(Direction::SE);
    println!("hex0: ({},{}) adjacent ID", adj.0, adj.1);

    let hex_dist = hex0.get_hex_distance(&hex1);
    println!("hex0 - hex1: {} hex distance", hex_dist);

    let mut path: Vec<(i64, i64)> = Vec::new();
    path = hex0.get_path(&hex1);
    let x = &path.get(0).expect("***** Out of range. *****");
    println!("> ({}, {})", x.0, x.1);
    println!("> {} len", path.len());
    for hx in path.iter() {
        println!("({},{})", hx.0, hx.1);
    }

    let s = hex0.get_spine_id(Direction::N);
    println!(">>> ({},{},{}) N", s.0, s.1, s.2);

    let s = hex0.get_spine_id(Direction::NE);
    println!(">>> ({},{},{}) NE", s.0, s.1, s.2);

    let s = hex0.get_spine_id(Direction::SE);
    println!(">>> ({},{},{}) SE", s.0, s.1, s.2);

    let s = hex0.get_spine_id(Direction::S);
    println!(">>> ({},{},{}) S", s.0, s.1, s.2);

    let s = hex0.get_spine_id(Direction::SW);
    println!(">>> ({},{},{}) SW", s.0, s.1, s.2);

    let s = hex0.get_spine_id(Direction::NW);
    println!(">>> ({},{},{}) NW", s.0, s.1, s.2);

    // ************************* odd
    let s = hex1.get_spine_id(Direction::N);
    println!(".>>> ({},{},{})", s.0, s.1, s.2);

    let s = hex1.get_spine_id(Direction::NE);
    println!(".>>> ({},{},{})", s.0, s.1, s.2);

    let s = hex1.get_spine_id(Direction::SE);
    println!(".>>> ({},{},{})", s.0, s.1, s.2);

    let s = hex1.get_spine_id(Direction::S);
    println!(".>>> ({},{},{})", s.0, s.1, s.2);

    let s = hex1.get_spine_id(Direction::SW);
    println!(".>>> ({},{},{})", s.0, s.1, s.2);

    let s = hex1.get_spine_id(Direction::NW);
    println!(".>>> ({},{},{})", s.0, s.1, s.2);
    //let s = hex1.get_spine_id(Direction::S);
    //println!(">>> ({},{},{})", s.0, s.1, s.2);
}
