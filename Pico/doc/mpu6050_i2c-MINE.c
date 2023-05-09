#include <stdio.h>
#include <string.h>
#include "pico/stdlib.h"
#include "pico/binary_info.h"
#include "hardware/i2c.h"

static int addr = 0x68;

#ifdef i2c_default
static void mpu6050_reset() {
    uint8_t buf[] = {0x6B, 0x00};
    i2c_write_blocking(i2c_default, addr, buf, 2, false);
}

static void mpu6050_read_raw(int16_t accel[3], int16_t gyro[3], int16_t *temp) {
    // For this particular device, we send the device the register we want to read
    // first, then subsequently read from the device. The register is auto incrementing
    // so we don't need to keep sending the register we want, just the first.

    uint8_t buffer[6];

    // Start reading acceleration registers from register 0x3B for 6 bytes
    uint8_t val = 0x3B;
    i2c_write_blocking(i2c_default, addr, &val, 1, true); // true to keep master control of bus
    i2c_read_blocking(i2c_default, addr, buffer, 6, false);

    for (int i = 0; i < 3; i++) {
        accel[i] = (buffer[i * 2] << 8 | buffer[(i * 2) + 1]);
    }

    // Now gyro data from reg 0x43 for 6 bytes
    // The register is auto incrementing on each read
    val = 0x43;
    i2c_write_blocking(i2c_default, addr, &val, 1, true);
    i2c_read_blocking(i2c_default, addr, buffer, 6, false);  // False - finished with bus

    for (int i = 0; i < 3; i++) {
        gyro[i] = (buffer[i * 2] << 8 | buffer[(i * 2) + 1]);;
    }

    // Now temperature from reg 0x41 for 2 bytes
    // The register is auto incrementing on each read
    val = 0x41;
    i2c_write_blocking(i2c_default, addr, &val, 1, true);
    i2c_read_blocking(i2c_default, addr, buffer, 2, false);  // False - finished with bus

    *temp = buffer[0] << 8 | buffer[1];
}
#endif

int main() {
    stdio_init_all();
#if !defined(i2c_default) || !defined(PICO_DEFAULT_I2C_SDA_PIN) || !defined(PICO_DEFAULT_I2C_SCL_PIN)
    #warning i2c/mpu6050_i2c example requires a board with I2C pins
    puts("Default I2C pins were not defined");
#else
    printf("Hello, MPU6050! Reading raw data from registers...\n");

    // This example will use I2C0 on the default SDA and SCL pins (4, 5 on a Pico)
    i2c_init(i2c_default, 400 * 1000);
    gpio_set_function(PICO_DEFAULT_I2C_SDA_PIN, GPIO_FUNC_I2C);
    gpio_set_function(PICO_DEFAULT_I2C_SCL_PIN, GPIO_FUNC_I2C);
    gpio_pull_up(PICO_DEFAULT_I2C_SDA_PIN);
    gpio_pull_up(PICO_DEFAULT_I2C_SCL_PIN);
    // Make the I2C pins available to picotool
    // bi_decl(bi_2pins_with_func(PICO_DEFAULT_I2C_SDA_PIN, PICO_DEFAULT_I2C_SCL_PIN, GPIO_FUNC_I2C));

    mpu6050_reset();

    int16_t acceleration[3], gyro[3], temp;
/*
    int maxAX = 0;
    int maxAY = 0;
    int maxAZ = 0;
    int minAX = 0;
    int minAY = 0;
    int minAZ = 0;

    int maxGX = 0;
    int maxGY = 0;
    int maxGZ = 0;
    int minGX = 0;
    int minGY = 0;
    int minGZ = 0;
*/
    int maxAX = 24116 / 90;
    int maxAY = 11864 / 90;
    int maxAZ = 23460 / 90;
    int minAX = -21468;
    int minAY = -23016;
    int minAZ = -21340;

    int maxGX = 24116;
    int maxGY = 11864;
    int maxGZ = 23460;
    int minGX = -21468;
    int minGY = -23016;
    int minGZ = -21340;



    while (1) {
        mpu6050_read_raw(acceleration, gyro, &temp);
/*
if (maxAX < acceleration[0]) maxAX = acceleration[0];
if (maxAY < acceleration[1]) maxAY = acceleration[1];
if (maxAZ < acceleration[2]) maxAZ = acceleration[2];
if (minAX > acceleration[0]) minAX = acceleration[0];
if (minAY > acceleration[1]) minAY = acceleration[1];
if (minAZ > acceleration[2]) minAZ = acceleration[2];

if (maxGX < acceleration[0]) maxGX = acceleration[0];
if (maxGY < acceleration[1]) maxGY = acceleration[1];
if (maxGZ < acceleration[2]) maxGZ = acceleration[2];
if (minGX > acceleration[0]) minGX = acceleration[0];
if (minGY > acceleration[1]) minGY = acceleration[1];
if (minGZ > acceleration[2]) minGZ = acceleration[2];
*/


        // These are the raw numbers from the chip, so will need tweaking to be really useful.
        // See the datasheet for more information
        printf("Acc. X = %5d, Y = %5d, Z = %5d\n", acceleration[0] * maxAX, acceleration[1] * maxAY, acceleration[2] * maxAZ);
//        printf("MAX. X = %5d, Y = %5d, Z = %5d\n", maxAX, maxAY, maxAZ);
//        printf("MIN. X = %5d, Y = %5d, Z = %5d\n", minAX, minAY, minAZ);

        printf("Gyro. X = %5d, Y = %5d, Z = %5d\n", gyro[0], gyro[1], gyro[2]);
//        printf("MAX . X = %5d, Y = %5d, Z = %5d\n", maxGX, maxGY, maxGZ);
//        printf("MIN . X = %5d, Y = %5d, Z = %5d\n", minGX, minGY, minGZ);

        // Temperature is simple so use the datasheet calculation to get deg C.
        // Note this is chip temperature.
        // printf("Temp. = %f\n", (temp / 340.0) + 36.53);
        printf("Temp. = %f\n", temp / 1.0);
        sleep_ms(100);
    }

#endif
    return 0;
}
