when not defined(windows):
  # use the C++ linker profile because it's a C++ library
  when defined(macosx):
    switch("clang.linkerexe", "clang++")
  else:
    switch("gcc.linkerexe", "g++")

--styleCheck:usages
if (NimMajor, NimMinor) < (1, 6):
  --styleCheck:hint
else:
  --styleCheck:error
