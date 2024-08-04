fn main() {
    use std::f64::consts::PI as PI;
    const PI2: f64 = PI*2.0;

    let deg: f64 = 30.0;
    let rad: f64 = (deg/360.0) * PI2;
    let y: f64 = rad.cos();
    println!("{rad}, {y}");
}
