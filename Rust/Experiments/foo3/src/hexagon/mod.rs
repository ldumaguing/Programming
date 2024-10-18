pub struct Hexagon {
	pub id: (i64, i64),
}

impl Hexagon {
	pub fn foo(&self) {
		println!("in foo");
		bar();         // calling outside
		Self::bar();   // calling inward associative function
		self.mad();    // calling inward function
	}
	fn bar() {
		println!("in Hexagon::bar");
	}
	fn mad(&self) {
		println!("in mad");
	}
}

fn bar() {
	println!("in bar");
}

