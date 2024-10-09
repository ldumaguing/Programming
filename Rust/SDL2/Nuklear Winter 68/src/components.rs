// ***** components.rs
use specs::prelude::*;
use specs_derive::Component;

#[derive(Component)]
pub struct Position {
    pub x: f64,
    pub y: f64,
    pub rot: f64,
}

#[derive(Component)]
pub struct Renderable {
    pub tex_name: String,
    pub i_w: u32,
    pub i_h: u32,
    pub o_w: u32,
    pub o_h: u32,
    pub frame: u32,
    pub total_frames: u32,
    pub rot: f64,
}

#[derive(Component)]
pub struct GameBoard {
    pub scale: f32,
}

#[derive(Component)]
pub struct Cursor {}

#[derive(Component)]
pub struct Player {}
