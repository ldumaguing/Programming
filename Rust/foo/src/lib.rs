mod bar;

pub mod fish {
    pub fn yo() {
        println!("yo");
    }
    
    pub fn yo2() {
        crate::bar::blabla();
    }
}

