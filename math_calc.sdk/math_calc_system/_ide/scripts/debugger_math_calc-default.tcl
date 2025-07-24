# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\86198\ee_race\zynq_learn\prj\math_calc\math_calc.sdk\math_calc_system\_ide\scripts\debugger_math_calc-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source D:\86198\ee_race\zynq_learn\prj\math_calc\math_calc.sdk\math_calc_system\_ide\scripts\debugger_math_calc-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-HS2 201706300081" && level==0 && jtag_device_ctx=="jsn-JTAG-HS2-201706300081-13722093-0"}
fpga -file D:/86198/ee_race/zynq_learn/prj/math_calc/math_calc.sdk/math_calc/_ide/bitstream/system_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw D:/86198/ee_race/zynq_learn/prj/math_calc/math_calc.sdk/system_wrapper/export/system_wrapper/hw/system_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source D:/86198/ee_race/zynq_learn/prj/math_calc/math_calc.sdk/math_calc/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow D:/86198/ee_race/zynq_learn/prj/math_calc/math_calc.sdk/math_calc/Debug/math_calc.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
