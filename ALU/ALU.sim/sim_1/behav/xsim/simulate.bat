@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Wed Jan 29 13:18:46 +0100 2020
REM SW Build 2700185 on Thu Oct 24 18:46:05 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim ice_uart_tb_behav -key {Behavioral:sim_1:Functional:ice_uart_tb} -tclbatch ice_uart_tb.tcl -view D:/Datos/Desktop/Vivado/Vivado/ALU/ice_uart_tb_behav.wcfg -log simulate.log"
call xsim  ice_uart_tb_behav -key {Behavioral:sim_1:Functional:ice_uart_tb} -tclbatch ice_uart_tb.tcl -view D:/Datos/Desktop/Vivado/Vivado/ALU/ice_uart_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
