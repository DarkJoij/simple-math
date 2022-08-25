/*
	Copyright 2022 Dallas

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
*/

module simple_math.square_equations;

import std.math;
import std.format;

/*
	Finds the discriminant of the square equation 
	based on the coefficients `a`, `b` and `c'.

	Params:
		a = (`T`) The coefficient `a` in the square equation.
		b = (`T`) The coefficient `b` in the square equation.
		c = (`T`) The coefficient `c` in the square equation.

	Returns: A number of type identical to the type of other parameters.
*/
public T findDesc(T)(T a, T b, T c)
{
	return cast(T) (pow(b, 2) - 4 * a * c);
}

unittest
{
	assert(findDesc!byte(-1, 4, -3) == 4);
	assert(findDesc!byte(1, -1, 0) == 1);
}

/*
	Finds the roots of the full square equation and, 
	if there are none, throws an error.

	Params:
		a = (`T`) The coefficient `a` in the square equation.
		b = (`T`) The coefficient `b` in the square equation.
		c = (`T`) The coefficient `c` in the square equation.

	Returns: An array with one or two roots of a square equation.

	Throws: `Error` if discriminant lower than 0.
*/
public T[] resolveFull(T)(T a, T b, T c)
{
	real desc = findDesc!real(a, b, c);

	if (desc > 0)
		return cast(T[]) [
			(-b + sqrt(desc)) / 2 * a, 
			(-b - sqrt(desc)) / 2 * a
		];
	else if (desc == 0)
		return cast(T[]) [
			(-b + sqrt(desc)) / 2 * a
		];
	else 
		throw new Error(format("The task (%7.2f, %7.2f, %7.2f) has no answers.", a, b, c));
}

unittest
{
	int[] result = resolveFull!int(-1, 4, -3);
	int[] expectedResults = [1, 3];

	foreach (ubyte i; 0 .. 2)
		assert(result[i] == expectedResults[i]);
}

/*
	Finds the roots of an incomplete square equation (`a`, `b`).

	Params:
		a = (`T`) The coefficient `a` in the square equation.
		b = (`T`) The coefficient `b` in the square equation.

	Returns: An array with one or two roots of a square equation.

	Throws: `Error` if discriminant lower than 0.
*/
public T[] resolveAB(T)(T a, T b)
{
	try
		return resolveFull!T(a, b, 0);
	catch (Exception e)
		throw new Error(format("The task (%7.2f, %7.2f) has no answers.", a, b));
}

unittest
{
	int[] result = resolveAB!int(1, -1);
	int[] expectedResults = [1, 0];

	foreach (ubyte i; 0 .. 2)
		assert(result[i] == expectedResults[i]);
}
