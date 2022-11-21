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

module simple_math.progressions.arithmetical;

/**
 * Finds the difference of the arithmetic progression 
 * in an array consisting of numbers.
 * 
 * Params:
 *     progression = (`T[]`) An array of numbers with a length of at least 2.
 * 
 * Returns: A number of type identical to the type of numbers in the array.
 * 
 * Throws: `Error` if progression `length < 2`.
 */
public T findArithmeticalD(T)(T[] progression) 
{
    if (progression.length < 2)
        throw new Error("Progression must contain 2 numbers or higher.");
    
    real a1 = cast(real) progression[0];
    real a2 = cast(real) progression[1];

    return cast(T) (a2 - a1);
}

unittest
{
    assert(findArithmeticalD!ubyte([2, 3, 4, 5]) == 1);
    assert(findArithmeticalD!byte([5, 2]) == -3);
}

/**
 * Checks whether the passed array is an arithmetic progression.
 * 
 * Params:
 *     array = (`T[]`) An array of numbers with a length of at least 2.
 * 
 * Returns: A number of type identical to the type of numbers in the array.
 * 
 * Throws: `Error` if array `length < 2`.
 */
public bool isArithmeticProgression(T)(T[] array)
{
    T d = findArithmeticalD!T(array);
    T member = array[0];

    foreach (T arrayMember; array)
    {
        if (member != arrayMember)
            return false;
        
        member += d;
    }

    return true;
}

unittest
{
    assert(isArithmeticProgression!ubyte([1, 2, 3]));
    assert(isArithmeticProgression!ubyte([3, 2, 1]));

    assert(!isArithmeticProgression!ubyte([1, 5, 25]));
    assert(!isArithmeticProgression!float([100, 25, 6.25]));
}

/**
 * Finds a member of the arithmetic progression at position N.
 * 
 * Params:
 *     progression = (`T[]`) An array of numbers with a length of at least 2.
 *     n = (`T`) The position of the number in the progression.
 * 
 * Returns: A number of type identical to the type of numbers in the array.
 * 
 * Throws: `Error` if progression `length < 2`.
 */
public T findAN(T)(T[] progression, T n)
{
    if (!isArithmeticProgression(progression))
        throw new Error("Passed array is not an arithmetical progression.");

    T a1 = progression[0];
    T d = findArithmeticalD!T(progression);
    
    return cast(T) (a1 + d * (n - 1));
}

unittest
{
    assert(findAN!ubyte([2, 3], 3) == 4);
    assert(findAN!float([5, 1, -3], 6) == -15.0);
    assert(findAN!real([0, 10], 7) == 60.00);
}

/**
 * Finds a member of the arithmetic progression at position N.
 * 
 * Params:
 *     a1 = The first member of the progression.
 *     d = The difference of the arithmetic progression.
 *     n = (`T`) The position of the number in the progression.
 * 
 * Returns: A number of type identical to the type of numbers in the array.
 */
/// ditto
public T findAN(T)(T a1, T d, T n)
{
    return cast(T) (a1 + d * (n - 1));
}

unittest
{
    assert(findAN!ubyte(2, 1, 3) == 4);
    assert(findAN!float(5, -4, 6) == -15.0);
    assert(findAN!real(0, 10, 7) == 60.00);
}

/**
 * Finds the sum of N members of the arithmetic progression.
 * 
 * Params:
 *     progression = (`T[]`) An array of numbers with a length of at least 2.
 *     n = (`T`) The position of the number in the progression.
 * 
 * Returns: A number of type identical to the type of numbers in the array.
 * 
 * Throws: `Error` if progression length < 2.
 */
public T findArithmeticSN(T)(T[] progression, T n)
{
    if (!isArithmeticProgression(progression))
        throw new Error("Passed array is not an arithmetical progression.");

    T a1 = progression[0];
    T an = findAN(progression, n);

    return cast(T) ((a1 + an) / 2 * n);
}

unittest
{
    assert(findArithmeticSN!ubyte([1, 2, 3], 5) == 15);
    assert(findArithmeticSN!byte([1, -2], 4) == -12);
}

/**
 * Finds the sum of N members of the arithmetic progression.
 * 
 * Params:
 *     a1 = The first member of the progression.
 *     d = The difference of the arithmetic progression.
 *     n = (`T`) The position of the number in the progression.
 * 
 * Returns: A number of type identical to the type of numbers in the array.
 */
/// ditto
public T findArithmeticSN(T)(T a1, T d, T n)
{
    T an = findAN!T(a1, d, n);
    return cast(T) ((a1 + an) / 2 * n);
}

unittest
{
    assert(findArithmeticSN!ubyte(1, 1, 5) == 15);
    assert(findArithmeticSN!byte(1, -3, 4) == -12);
}
