# simple-math library
A library that includes functions for solving equations and tasks using formulas from a school mathematics course.

# Installition
* Using DUB in console:
```bash
dub add simple-math
```

* Using `dub.json`:
```json
"dependecies": {
	"simple-math": "~>1.0.0"
}
```

* Using `dub.sdl`:
```bash
dependency "simple-math" version="~>1.0.0"
```

# Tools
## Module `progressions`
#### Arithmetical
* `public T findArithmeticalD(T)(T[] progression)`\
Finds the difference of the arithmetic progression in an array consisting of numbers.

* `public bool isArithmeticProgression(T)(T[] array)`\
Checks whether the passed array is an arithmetic progression.

* `public T findAN(T)(T[] progression, T n)`
* `public T findAN(T)(T a1, T d, T n)`\
Finds a member of the arithmetic progression at position N.

* `public T findArithmeticSN(T)(T[] progression, T n)`
* `public T findArithmeticSN(T)(T a1, T d, T n)`\
Finds the sum of N members of the arithmetic progression.

#### Example
```d
// findArithmeticalD:
assert(findArithmeticalD!ubyte([2, 3, 4, 5]) == 1);
assert(findArithmeticalD!byte([5, 2]) == -3);

// isArithmeticProgression:
assert(isArithmeticProgression!ubyte([3, 2, 1]));
assert(!isArithmeticProgression!ubyte([1, 5, 25]));

// findAN(T)(T[] progression, T n):
assert(findAN!ubyte([2, 3], 3) == 4);
assert(findAN!float([5, 1, -3], 6) == -15.0);

// findAN(T)(T a1, T d, T n):
assert(findAN!ubyte(2, 1, 3) == 4);
assert(findAN!float(5, -4, 6) == -15.0);

// findArithmeticSN(T)(T[] progression, T n):
assert(findArithmeticSN!ubyte([1, 2, 3], 5) == 15);
assert(findArithmeticSN!byte([1, -2], 4) == -12);

// findArithmeticSN(T)(T a1, T d, T n):
assert(findArithmeticSN!ubyte(1, 1, 5) == 15);
assert(findArithmeticSN!byte(1, -3, 4) == -12);
```

### Geometrical
* `public T findGeometricQ(T)(T[] progression)`\
Finds the difference of the geometric progression in an array consisting of numbers.

* `public bool isGeometricProgression(T)(T[] array)`\
Checks whether the passed array is an geometric progression.

* `public bool isSequence(T)(T[] progression)`\
Checks whether the array is a sequence (q = 1, [1, 1, 1, ...]).

* `public T findBN(T)(T[] progression, T n)`
* `public T findBN(T)(T b1, T q, T n)`\
Finds a member of the geometric progression at position N.

* `public T findGeometricSN(T)(T[] progression, T n)`
* `public T findGeometricSN(T)(T b1, T q, T n)`\
Finds the sum of N members of the geometric progression.

#### Example
```d
// findGeometricQ:
assert(findGeometricQ!ubyte([25, 50, 100]) == 2);
assert(findGeometricQ!byte([-2, -6, -18]) == 3);

// isGeometricProgression:
assert(isGeometricProgression!ubyte([1, 4, 16]));
assert(!isGeometricProgression!ubyte([8, 10, 16]));

// isSequence:
assert(isSequence([2, 2]));
assert(!isSequence([1, 2]));

// findBN(T)(T[] progression, T n):
assert(findBN!byte([-2, -6], 3) == -18);
assert(findBN!float([100, 50, 25], 4) == 12.5);

// findBN(T)(T b1, T q, T n):
assert(findBN!byte(-2, 3, 3) == -18);
assert(findBN!float(100, 0.5, 4) == 12.5);

// findGeometricSN(T)(T[] progression, T n):
assert(findGeometricSN!ubyte([1, 2], 3) == 7);
assert(findGeometricSN!float([100, 25], 3) == 131.25);

// findGeometricSN(T)(T b1, T q, T n):
assert(findGeometricSN!ubyte(1, 2, 3) == 7);
assert(findGeometricSN!float(100, 0.25, 3) == 131.25);
```

## Module `chances`
* `public T chance(T)(T value, T from)`\
Finds the chance of `value` shares falling out of `from`.

#### Example
```d
assert(chance!byte(5, 25) == 20);
assert(chance!byte(19, 20) == 95);
```

## Module `percents`
* `public T percents(T)(real value, real from)`\
Finds the percentage of `value` from `from` parameter.

* `public T[] percentsCaptures(T)(T[] captures, T from)`\
Finds the percentage for each element in the array relative to the `from` parameter.

#### Example
```d
// percents:
assert(percents!ubyte(5, 10) == 50);
assert(percents!float(2.5, 10) == 25.0);

// percentsCaptures:
float[] percentsOfTen = percentsCaptures!float([2.5, 7.5], 10);
float[] expectedResults = [25.0, 75.0];

foreach (ubyte i; 0 .. 2)
	assert(percentsOfTen[i] == expectedResults[i]);
```

## Module `square_equations`
* `public T findDesc(T)(T a, T b, T c)`\
Finds the discriminant of the square equation based on the coefficients `a`, `b` and `c'.

* `public T[] resolveFull(T)(T a, T b, T c)`\
Finds the roots of the full square equation and, if there are none, throws an error.

* `public T[] resolveAB(T)(T a, T b)`\
Finds the roots of an incomplete square equation (`a`, `b`).

#### Example
```d
// findDesc:
assert(findDesc!byte(-1, 4, -3) == 4);
assert(findDesc!byte(1, -1, 0) == 1);

// resolveFull:
int[] result = resolveFull!int(-1, 4, -3);
int[] expectedResults = [1, 3];

foreach (ubyte i; 0 .. 2)
	assert(result[i] == expectedResults[i]);

// resolveAB:
int[] result = resolveAB!int(1, -1);
int[] expectedResults = [1, 0];

foreach (ubyte i; 0 .. 2)
	assert(result[i] == expectedResults[i]);
```

## Module `trigonometry`
* `public double sine(T)(T angleMeasure)`\
Finds the sine of the angle by its degree measure.

* `public double cosine(T)(T angleMeasure)`\
Finds the cosine of the angle by its degree measure.

#### Example
```d
assert(sine(30) == 0.5);
assert(cosine(60) == 0.5);
```

# Feedback
Open [issues](https://github.com/DarkJoij/simple-math/issues) and [pull requests](https://github.com/DarkJoij/simple-math/pulls) if it's mandatory. Thanks for reading and downloading.
