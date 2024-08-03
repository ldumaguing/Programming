mod hexagon;

use hexagon as hx;

fn main() {
    println!("Hello, world!");
    hx::hello();
    hx::get_adjacent((10, 20), 'A');
}
