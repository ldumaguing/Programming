struct HexID(i32, i32);

fn main() {
    let mut v: Vec<HexID> = Vec::new();
    v.push(HexID(0, 0));
    v.push(HexID(1, 1));
    v.push(HexID(2, 2));
    println!("> push( HexID(0, 0) )");
    println!("> push( HexID(1, 1) )");
    println!("> push( HexID(2, 2) )");

/*
    let x: &HexID = v.get(10).expect("***** Out of range. *****");
    println!("> ({}, {})", x.0, x.1);
    println!("> {} len", v.len());
    v.pop();
    println!("> pop");
    println!("> {} len", v.len());
    println!("> LIFO; i.e., HexID(2, 2) is gone.");
*/

    println!("> {} len", v.len());
    let p = v.pop().unwrap();
    println!("> {} len", v.len());
    println!("> {},{}", p.0, p.1);

    let p = v.pop().unwrap();
    println!("> {} len", v.len());
    println!("> {},{}", p.0, p.1);
}
