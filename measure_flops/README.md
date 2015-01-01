## Measure GFLOPS that can be achieved for a element-wise matrix multiplication plus an upper bound

Simply run the script `run.sh`. It will compile a binary which measures the memory throughput to estimate the maximum number of GLFOPS that can be achieved on your system for an element-wise matrix multiplication.

After that an Octave script is executed which determines the actual number of GLFOPS that can be achieved with Octave for doing an element-wise matrix multiplication.

The output should look as follows.

```
292 milliseconds to copy 512MB memory
theoretical GFLOPS: 0.229825
Measured GFLOPS: 0.209149
```

Here, 292ms are required to copy 512MB from one memory location to another memory location. Because this amount of memory must be moved to do a double-precision element-wise matrix multiplication with 64 millions floating point multiplications this is an upper bound for the number of GFLOPS that can be achieved (theoretical GFLOPS) for that operation.

Finally, Octave is used to do an element-wise matrix multiplication and the GFLOPS for that is reported on the third line of output.
