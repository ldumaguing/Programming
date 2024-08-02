mod bar;

pub mod fish {
    use crate::bar as X;

    pub fn yo() {
        println!("yo");
    }
    
    pub fn yo2() {
        X::blabla();
        X::blabla2();
    }
}
