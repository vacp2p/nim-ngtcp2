# ----- toolchain + includes -----
{.passc: "-I./libs/aws-lc/third_party/jitterentropy/jitterentropy-library".}
{.localPassC: "-ffunction-sections -fdata-sections".}
{.localPassC: "-O0".}

{.
  compile:
    "./libs/aws-lc/third_party/jitterentropy/jitterentropy-library/src/jitterentropy-base.c"
.}
{.
  compile:
    "./libs/aws-lc/third_party/jitterentropy/jitterentropy-library/src/jitterentropy-sha3.c"
.}
{.
  compile:
    "./libs/aws-lc/third_party/jitterentropy/jitterentropy-library/src/jitterentropy-health.c"
.}
{.
  compile:
    "./libs/aws-lc/third_party/jitterentropy/jitterentropy-library/src/jitterentropy-noise.c"
.}
{.
  compile:
    "./libs/aws-lc/third_party/jitterentropy/jitterentropy-library/src/jitterentropy-gcd.c"
.}
