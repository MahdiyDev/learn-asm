# Assembly Language Learning with GNU Assembly

## Examples

1. Simple assembly program. Exits with given value. [see](1_intro)
2. Find maximum value from array. Exits with maximum value. [see](find_max_value)
3. Function and Stack. Compute the value of a number raised to a power and exits with result. [see](functions_and_stack)

### Compile

If you are using mingw replace this with mingw lib path

```sh
MINGW_LIB="C:\Program Files\mingw\mingw64\x86_64-w64-mingw32\lib"
```

To compile:

```sh
./build.sh
```

### Execution

Run program:

```sh
./exit.exe
```

To see return code in shell (or git-bash)

```sh
echo $?
```

In cmd:

```sh
echo %errorlevel%
```
