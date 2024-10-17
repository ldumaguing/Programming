use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();

    let aaa = &args[0];
    let bbb = &args[1];
    let ccc = &args[2];

    println!("0: {aaa}");
    println!("1: {bbb}");
    println!("2: {ccc}");
}
