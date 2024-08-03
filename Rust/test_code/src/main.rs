fn main() {
    use std::f32::consts::PI as PI;
    const PI2: f32 = PI*2.0;

    let deg: f32 = 30.0;
    let rad: f32 = (deg/360.0) * PI2;
    let y: f32 = rad.cos();
    println!("{rad}, {y}");
}
