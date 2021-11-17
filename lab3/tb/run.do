if [file exists work] {vdel -all}
vlib work
vlog -f files.f
onbreak {resume}
set NoQuitOnFinish 1
#vsim -voptargs=+acc work.flipflop 
vsim -voptargs=+acc work.flipflop 
do wave.do
run 130ms
