mod hexagon;

use hexagon::*;

fn main() {
    println!("Hello, world!");
	let hex0 = Hexagon {
		id: (4,5),
	};

	println!("{},{}", hex0.id.0, hex0.id.1);
	hex0.foo();
}
