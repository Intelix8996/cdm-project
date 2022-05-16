# CdM8-Based Modular Platform 
## Group project
### [Documentation](https://github.com/Intelix8996/cdm-project/wiki/platform-description)
### [Headers](include/)
### [Sources](src/)
### [Schemes](logisim/) (main scheme - [cdm-platform.circ](logisim/cdm-platform.circ))

## Quick start 
+ Clone the repository
+ Open `logisim/cdm-platform.circ` with `logisim`
+ Load `output/battleship.img` to **ROM**
+ Navigate to `User Area`
+ Select keyboard *(under terminal)*, type `4` and then press `Enter`
+ ["Battleship"](https://github.com/Intelix8996/cdm-project/wiki/Platform-Description#code-overview) will run 

---
### Repin Nikolay - Hardware Design
### Nikita Tatarinov - Software Design
---
## File Structure
+ `cocas` - assembler
+ `cocoide ` - CocoIDE
+ `cocol` - linker
+ `config` - build configuration files for cocomake
+ `docs` - documentation for project
+ `include` - include directory
+ `logisim` - logisim schemes and libraries
+ `mcpp` - mcpp C preprocessor
+ `output` - compiled image files for logisim
+ `src` - source files
+ `temp` - temporary files for cocomake

---
#### Digital Platforms
#### NSU 2022