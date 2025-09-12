# Digital Design Automation Scripts

This directory contains two scripts for automating synthesis and simulation tasks using Cadence tools. 
## Scripts Overview

### 1. `run_sim`
This script is used for running simulations using Cadence Xcelium.

#### Features:
- Supports cleaning the work directory.
- Allows compiling source files and standard cells.
- Enables simulation with or without GUI.
- Supports waveform viewing.

#### Usage:
```bash
./run_sim [options]
```

#### Options:
- `-clean`: Cleans the work directory.
- `-compile`: Compiles the source files.
- `-sim`: Runs the simulation (also triggers compilation).
- `-cells`: Includes standard cells during compilation.
- `-gui`: Runs the simulation in GUI mode.
- `-waveform`: Opens the waveform viewer.
- `-top <module_name>`: Specifies the top module for simulation.

#### Example:
```bash
./run_sim -sim -gui -top my_top_module
```

---

### 2. `run_syn`
This script is used for running synthesis using Cadence Genus.

#### Features:
- Supports GUI and non-GUI modes.
- Allows specifying the top module for synthesis.

#### Usage:
```bash
./run_syn [options]
```

#### Options:
- `-gui`: Launches the synthesis process in GUI mode.
- `-top <module_name>`: Specifies the top module for synthesis.

#### Example:
```bash
./run_syn -gui -top my_top_module
```

---


### 3. `run_PnR`
This script is used for running place and route using Cadence Innovus.

#### Features:
- Supports GUI and non-GUI modes.
- Allows specifying the top module for place and route.

#### Usage:
```bash
./run_PnR [options]
```

#### Options:
- `-gui`: Launches the place and route process in GUI mode.
- `-top <module_name>`: Specifies the top module for place and route.

#### Example:
```bash
./run_PnR -gui -top my_top_module
```

---

## Notes
- Ensure that the required Cadence tools (Genus, Xcelium, and Innovus) are installed and properly configured in your environment.
- The scripts assume specific directory structures for source files, testbenches, and synthesis outputs. Adjust paths in the scripts if necessary.
