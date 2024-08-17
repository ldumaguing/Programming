mod aaa;
mod bbb;

use aaa::*;
use bbb::*;

fn main() {
    println!("Hello, world!");

    let hex0 = Hexagon { id: (4, 5) };
    println!("{},{}", hex0.id.0, hex0.id.1);

    let unit0 = Unit { id: 45 };
    println!("{}", unit0.id);
    unit0.foo();
}
