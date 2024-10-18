use sdl2::controller::Button;

pub fn button_down(joystick_manager: &mut u16, button: Button) {
    match button {
        Button::DPadUp => *joystick_manager |= 1 << 0,
        Button::DPadDown => *joystick_manager |= 1 << 1,
        Button::DPadLeft => *joystick_manager |= 1 << 2,
        Button::DPadRight => *joystick_manager |= 1 << 3,
        Button::A => *joystick_manager |= 1 << 4,
        Button::B => *joystick_manager |= 1 << 5,
        Button::X => *joystick_manager |= 1 << 6,
        Button::Y => *joystick_manager |= 1 << 7,
        Button::Back => *joystick_manager |= 1 << 8,
        Button::Guide => *joystick_manager |= 1 << 9,
        Button::Start => *joystick_manager ^= 1 << 10, // ***** toggle
        Button::LeftStick => *joystick_manager |= 1 << 11,
        Button::RightStick => *joystick_manager |= 1 << 12,
        Button::LeftShoulder => *joystick_manager |= 1 << 13,
        Button::RightShoulder => *joystick_manager |= 1 << 14,
        _ => {}
    }
}

pub fn button_up(joystick_manager: &mut u16, button: Button) {
    match button {
        Button::DPadUp => *joystick_manager &= !(1 << 0),
        Button::DPadDown => *joystick_manager &= !(1 << 1),
        Button::DPadLeft => *joystick_manager &= !(1 << 2),
        Button::DPadRight => *joystick_manager &= !(1 << 3),
        Button::A => *joystick_manager &= !(1 << 4),
        Button::B => *joystick_manager &= !(1 << 5),
        Button::X => *joystick_manager &= !(1 << 6),
        Button::Y => *joystick_manager &= !(1 << 7),
        Button::Back => *joystick_manager &= !(1 << 8),
        Button::Guide => *joystick_manager &= !(1 << 9),
        // Button::Start => *joystick_manager &= !(1 << 10),
        Button::LeftStick => *joystick_manager &= !(1 << 11),
        Button::RightStick => *joystick_manager &= !(1 << 12),
        Button::LeftShoulder => *joystick_manager &= !(1 << 13),
        Button::RightShoulder => *joystick_manager &= !(1 << 14),

        _ => {}
    }
}

pub fn is_button_pressed(joystick_manager: &mut u16, button: &Button) -> bool {
    match button {
        Button::DPadUp => (*joystick_manager & 1 << 0) != 0,
        Button::DPadDown => (*joystick_manager & 1 << 1) != 0,
        Button::DPadRight => (*joystick_manager & 1 << 3) != 0,
        Button::DPadLeft => (*joystick_manager & 1 << 2) != 0,
        Button::A => (*joystick_manager & 1 << 4) != 0,
        Button::RightStick => (*joystick_manager & 1 << 12) != 0,
        _ => false,
    }
}

/*
pub enum Button {
    A,              1 << 4
    B,              1 << 5
    X,              1 << 6
    Y,              1 << 7
    Back,           1 << 8
    Guide,          1 << 9
    Start,          1 << 10
    LeftStick,      1 << 11
    RightStick,     1 << 12
    LeftShoulder,   1 << 13
    RightShoulder,  1 << 14
    DPadUp,         1 << 0
    DPadDown,       1 << 1
    DPadLeft,       1 << 2
    DPadRight,      1 << 3
}
*/
