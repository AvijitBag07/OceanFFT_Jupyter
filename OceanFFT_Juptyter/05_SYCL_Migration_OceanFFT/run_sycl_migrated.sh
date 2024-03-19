#!/bin/bash
source /opt/intel/oneapi/setvars.sh > /dev/null 2>&1
cd sycl_migrated/Samples/4_CUDA_Libraries/oceanFFT
cp ../../../data/ref_slopeShading.bin .
cp ../../../data/ref_spatialDomain.bin .
icpx -fsycl -fsycl-targets=intel_gpu_pvc -I ../../../Common -I ../../../include *.cpp -qmkl -w
clear
if [ $? -eq 0 ]; then ./a.out qatest; fi

