mod hexagon;

use hexagon as hx;
use hexagon::*;

fn main() {
    println!("Hello, world!");
    hx::hello();
    hx::get_adjacent((10, 20), 'A');

    let dir = Direction::SW;

    match dir {
        Direction::N => {
            println!("...1");
        }
        Direction::S => {
            println!("...2");
        }
        Direction::NW => {
            println!("...3");
        }
        Direction::NE => {
            println!("...4");
        }
        Direction::SW => {
            println!("...5");
        }
        Direction::SE => {
            println!("...6");
        }
    }

    let hexID = hexagon::HexID(3, 4);
    println!("...{},{}", hexID.0, hexID.1);
}
