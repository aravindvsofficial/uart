# UART Transceiver in Verilog (RTL Design + Testbench)

A simple UART (Universal Asynchronous Receiver Transmitter) designed in Verilog with a modular architecture consisting of a Baud Rate Generator, Transmitter, Receiver, and Top-level integration. Demonstrates serial data transmission, reception, and loopback verification through simulation waveform for quick understanding of UART communication and FSM-based RTL design.

📁 Files Included

| File                    | Description                                     |
| ----------------------- | ----------------------------------------------- |
| `uart_top.v`            | Top-level UART integration module               |
| `baud_rate_generator.v` | Generates baud enable signal for UART operation |
| `transmitter.v`         | UART transmitter RTL implementation             |
| `receiver.v`            | UART receiver RTL implementation                |
| `uart_top_tb.v`         | Testbench for UART functional verification      |
| `waveform.png`          | Simulation waveform output                      |
| `schematic.png`         | RTL schematic representation *(Optional)*       |
| `implementation.png`    | Post-synthesis implementation *(Optional)*      |

# RTL Design

A modular and synthesizable UART design built using finite state machines (FSMs) for both transmission and reception. The design includes a Baud Rate Generator for timing control, an 8-bit UART Transmitter for serial data conversion, and a UART Receiver for reconstructing the transmitted data. The complete design is synchronous, lightweight, synthesizable, and suitable for FPGA and ASIC implementation.

View the full files: `baud_rate_generator.v`
                     `transmitter.v`
                     `receiver.v`
                     `uart_top.v`

# Testbench

A simple yet effective Verilog testbench that generates the system clock, applies reset, transmits multiple data bytes, and verifies successful reception using an internal loopback connection. The testbench monitors UART communication through waveform analysis, validating transmitter, receiver, busy, and ready signal functionality.

View the full file: `uart_top_tb.v`

# Conclusion

This project demonstrates a complete UART Transceiver implemented in Verilog using a modular RTL architecture. Functional verification through simulation confirms successful serial communication between the transmitter and receiver using loopback testing. By combining baud rate generation, FSM-based transmission and reception, top-level integration, and waveform validation, the design provides a solid foundation for understanding UART communication protocols and digital RTL design for FPGA and ASIC applications.
