use sdl2::controller::Button;

pub fn joystick_down(joystick_manager: &mut u16, button: Button) {
    match button {
        Button::DPadUp => *joystick_manager |= 1 << 0,
        Button::DPadDown => *joystick_manager |= 1 << 1,
        Button::DPadLeft => *joystick_manager |= 1 << 2,
        _ => {}
    }
}

pub fn joystick_up(joystick_manager: &mut u16, button: Button) {
    match button {
        Button::DPadUp => *joystick_manager ^= 1 << 0,
        Button::DPadDown => *joystick_manager ^= 1 << 1,
        Button::DPadLeft => *joystick_manager ^= 1 << 2,
        _ => {}
    }
}

/*
pub enum Button {
    A,
    B,
    X,
    Y,
    Back,
    Guide,
    Start,
    LeftStick,
    RightStick,
    LeftShoulder,
    RightShoulder,
    DPadUp,         1 << 0
    DPadDown,       1 << 1
    DPadLeft,       1 << 2
    DPadRight,
}
*/
