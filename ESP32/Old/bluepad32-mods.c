***************************************************************************************************************
void dumpGamepad(ControllerPtr ctl) {
    Console.printf(
        "idx%4d;%4d;%4d;%4d,%4d;%4d,%4d;%4d;%4d;%4d\n",
        ctl->index(),        // Controller Index
        ctl->dpad(),         // DPAD
        ctl->buttons(),      // bitmask of pressed buttons
        ctl->axisX(),        // (-511 - 512) left X Axis
        ctl->axisY(),        // (-511 - 512) left Y axis
        ctl->axisRX(),       // (-511 - 512) right X axis
        ctl->axisRY(),       // (-511 - 512) right Y axis
        ctl->brake(),        // (0 - 1023): brake button
        ctl->throttle(),     // (0 - 1023): throttle (AKA gas) button
        ctl->miscButtons()  // bitmak of pressed "misc" buttons
    );
}


vTaskDelay(1);














