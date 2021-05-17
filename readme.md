# Time Test

#### This is a simple experiment I did that lead to some surprising results!

simply execute the time.sh (POSIX) in the root dir to test for yourself.
I also added dart for comparison

### RESULT
1. While C was the fastest almost always,
2. C and Rust suffered terribly iterating through huge numbers.
3. Dart and Go proved to be optimised for situations like that.
#### TL;DR
```
3.for_1000000000/
# Executing..

        sys       user      real
  C     0m0.000s  0m1.331s  0m1.332s
  Dart  0m0.000s  0m0.459s  0m0.459s
  Go    0m0.000s  0m0.231s  0m0.231s
  Rust  0m0.000s  0m21.346s  0m21.356s
```
Granted: Maybe they can and or have to be optimised with the 
quirks and special features of the respective languages but 
this test relies on the code being as similar as possible 


#### Full Result

```
❯ ./time.sh
1.hello_world/
# Compiling..

        sys       user      real
  C     0m0.015s  0m0.016s  0m0.100s
  Dart  0m0.280s  0m2.187s  0m1.781s
  Go    0m0.020s  0m0.063s  0m0.050s
  Rust  0m0.094s  0m0.156s  0m0.555s


# Executing..

        sys       user      real
  C     0m0.000s  0m0.001s  0m0.001s
  Dart  0m0.000s  0m0.003s  0m0.004s
  Go    0m0.000s  0m0.002s  0m0.001s
  Rust  0m0.000s  0m0.001s  0m0.001s

2.for_1000/
# Compiling..

        sys       user      real
  C     0m0.016s  0m0.015s  0m0.055s
  Dart  0m0.360s  0m2.235s  0m1.875s
  Go    0m0.028s  0m0.056s  0m0.042s
  Rust  0m0.034s  0m0.173s  0m0.402s


# Executing..

        sys       user      real
  C     0m0.000s  0m0.001s  0m0.001s
  Dart  0m0.003s  0m0.000s  0m0.004s
  Go    0m0.000s  0m0.001s  0m0.001s
  Rust  0m0.001s  0m0.000s  0m0.001s

3.for_1000000000/
# Compiling..

        sys       user      real
  C     0m0.004s  0m0.026s  0m0.046s
  Dart  0m0.305s  0m2.163s  0m1.784s
  Go    0m0.023s  0m0.059s  0m0.042s
  Rust  0m0.043s  0m0.179s  0m0.376s


# Executing..

        sys       user      real
  C     0m0.000s  0m1.331s  0m1.332s
  Dart  0m0.000s  0m0.459s  0m0.459s
  Go    0m0.000s  0m0.231s  0m0.231s
  Rust  0m0.000s  0m21.346s  0m21.356s
```
