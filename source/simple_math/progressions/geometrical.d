/**
 * Copyright 2022 Dallas
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module simple_math.progressions.geometrical;

import std.math;

/**
 * Finds the difference of the geometric progression 
 * in an array consisting of numbers.
 * 
 * Params:
 * 	progression = (`T[]`) An array of numbers with a length of at least 2.
 * 
 * Returns: A number of type identical to the type of numbers in the array.
 * 
 * Throws: `Error` if progression `length < 2`.
 */
public T findGeometricQ(T)(T[] progression)
{
	if (progression.length < 2)
		throw new Error("Progression must contain 2 numbers or higher.");

	real a1 = cast(real) progression[0];
	real a2 = cast(real) progression[1];

	return cast(T) (a2 / a1);
}

unittest
{
	assert(findGeometricQ!ubyte([25, 50, 100]) == 2);
	assert(findGeometricQ!byte([-2, -6, -18]) == 3);
	assert(findGeometricQ!byte([2, -8, 32]) == -4);
}

/**
 * Checks whether the passed array is an geometric progression.
 * 
 * Params:
 * 	array = (`T[]`) An array of numbers with a length of at least 2.
 * 
 * Returns: A number of type identical to the type of numbers in the array.
 * 
 * Throws: `Error` if array `length < 2`.
 */
public bool isGeometricProgression(T)(T[] array)
{
	T q = findGeometricQ!T(array);
	T member = array[0];

	foreach (T arrayMember; array)
	{
		if (member != arrayMember)
			return false;
		
		member *= q;
	}

	return true;
}

unittest
{
	assert(isGeometricProgression!ubyte([10, 20, 40]));
	assert(isGeometricProgression!ubyte([1, 4, 16]));

	assert(!isGeometricProgression!ubyte([8, 10, 16]));
	assert(!isGeometricProgression!double([1, 3, 5]));
}

/**
 * Checks whether the array is a sequence (q = 1, [1, 1, 1, ...]).
 * 
 * Params:
 * 	array = (`T[]`) An array of numbers with a length of at least 2.
 * 
 * Returns: A number of type identical to the type of numbers in the array.
 * 
 * Throws: `Error` if progression `length < 2`.
 */
public bool isSequence(T)(T[] progression)
{
	return isGeometricProgression(progression) && findGeometricQ!T(progression) == 1;
}

unittest
{
	assert(isSequence([1, 1]));
	assert(isSequence([2, 2]));
	assert(!isSequence([1, 2]));
	assert(!isSequence([2, 4, 8]));
}

/**
 * Finds a member of the geometric progression at position N.
 * 
 * Params:
 * 	progression = (`T[]`) An array of numbers with a length of at least 2.
 * 	n = (`T`) The position of the number in the progression.
 * 
 * Returns: A number of type identical to the type of numbers in the array.
 * 
 * Throws: `Error` if progression length < 2.
 */
public T findBN(T)(T[] progression, T n)
{
	if (!isGeometricProgression(progression))
		throw new Error("Passed array is not an geometric progression.");

	T b1 = progression[0];
	T q = findGeometricQ!T(progression);
	
	return cast(T) (b1 * pow(q, n - 1));
}

unittest
{
	assert(findBN!byte([-2, -6], 3) == -18);
	assert(findBN!float([100, 50, 25], 4) == 12.5);
}

/**
 * Finds a member of the geometric progression at position N.
 * 
 * Params:
 * 	b1 = The first member of the progression.
 * 	q = The difference of the geometric progression.
 * 	n = (`T`) The position of the number in the progression.
 * 
 * Returns: A number of type identical to the type of numbers in the array.
 */
/// ditto
public T findBN(T)(T b1, T q, T n)
{
	return cast(T) (b1 * pow(q, n - 1)); 
}

unittest
{
	assert(findBN!byte(-2, 3, 3) == -18);
	assert(findBN!float(100, 0.5, 4) == 12.5);
}

/**
 * Finds the sum of N members of the geometric progression.
 * 
 * Params:
 * 	progression = (`T[]`) An array of numbers with a length of at least 2.
 * 	n = (`T`) The position of the number in the progression.
 * 
 * Returns: A number of type identical to the type of numbers in the array.
 * 
 * Throws: `Error` if progression length < 2.
 */
public T findGeometricSN(T)(T[] progression, T n)
{
	if (!isGeometricProgression(progression))
		throw new Error("Passed array is not an geometric progression.");

	T b1 = progression[0];
	T bn = findBN!T(progression, n);
	T q = findGeometricQ!T(progression);
	
	return cast(T) ((bn * q - b1) / (q - 1));
}

unittest
{
	assert(findGeometricSN!ubyte([1, 2], 3) == 7);
	assert(findGeometricSN!float([100, 25], 3) == 131.25);
}

/**
 * Finds the sum of N members of the geometric progression.
 * 
 * Params:
 * 	b1 = The first member of the progression.
 * 	q = The difference of the geometric progression.
 * 	n = (`T`) The position of the number in the progression.
 * 
 * Returns: A number of type identical to the type of numbers in the array.
 */
/// ditto
public T findGeometricSN(T)(T b1, T q, T n)
{
	T bn = findBN!T(b1, q, n);
	return cast(T) ((bn * q - b1) / (q - 1));
}

unittest
{
	assert(findGeometricSN!ubyte(1, 2, 3) == 7);
	assert(findGeometricSN!float(100, 0.25, 3) == 131.25);
}
