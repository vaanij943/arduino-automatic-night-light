# Arduino Automatic Night Light

An Arduino based automatic night light system that uses a light dependent resistor (LDR) to detect ambient lighting conditions and control an LED accordingly. The project demonstrates basic embedded systems concepts, sensor interfacing, and data visualization using MATLAB.

This project was developed as part of a Computer Engineering course and focuses on clean control logic, documentation, and verification through plotted sensor data.

---

## Features

- Automatic LED control based on ambient light levels
- Analog sensor input using an LDR
- Threshold based decision logic
- MATLAB data visualization of sensor behavior
- Flowchart documented control logic

---

## Project Overview

The system continuously reads analog input from a light dependent resistor connected to the Arduino. The measured value represents ambient light intensity and is compared against a predefined threshold.

- When ambient light is low, the LED turns ON
- When ambient light is sufficient, the LED turns OFF

This logic runs continuously in a loop, allowing the system to respond in real time to changes in lighting conditions.

---

## Control Logic

The control logic for the system is defined using a flowchart that outlines the program structure and decision making process.

<img width="393" height="501" alt="image" src="https://github.com/user-attachments/assets/ea8d217b-bd38-4249-bed5-0ab7c21fb55a" />

### Logic Summary
- Initialize input and output pins
- Read analog value from the LDR
- Compare sensor value to threshold
- Turn LED ON or OFF based on comparison
- Repeat continuously

---

## MATLAB Data Visualization

MATLAB was used to analyze and visualize the sensor data collected from the Arduino during operation.

<img width="894" height="295" alt="image" src="https://github.com/user-attachments/assets/3a0d952b-dfc7-4c49-8819-a437e1fcd11b" />

The plots demonstrate:
- Light sensor readings over time
- LED state changes based on threshold crossings
- Repeated transitions between light and dark conditions

These results confirm that the control logic functions as intended.

---

## Repository Structure

```
arduino-automatic-night-light/
├── arduino/
│   └── night_light_controller.ino
├── matlab/
│   ├── plot_light_sensor_data.m
│   ├── led_state_vs_time.m
│   └── real_time_ldr_plot.m
├── docs/
│   ├── night_light_flowchart.png
│   └── matlab_graphs.png
└── README.md
```
---

## Technologies Used

- Arduino IDE using C
- MATLAB
- Analog light sensor (LDR)
- LED and basic electronic components

---

## Learning Outcomes

- Embedded C programming using Arduino
- Analog sensor interfacing and ADC usage
- Threshold based control systems
- Data visualization using MATLAB
- Clear technical documentation

---

## Possible Improvements

- Adaptive or dynamic thresholding
- PWM based LED brightness control
- Long term data logging
- Enclosure or physical housing for the circuit

---

## Notes

This project is intended for educational purposes and demonstrates fundamental concepts in embedded systems and data analysis.
