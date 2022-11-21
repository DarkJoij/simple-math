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

module simple_math.percents;

import std.array;
import std.algorithm;

/**
 * Finds the percentage of `value` from `from` parameter.
 * 
 * Params:
 *     value = (`real`) The number whose percentage will be found in `from`.
 *     from = (`real`) Absolute value (100% relative to `value`).
 * 
 * Returns: A number of type identical to the type of other parameters.
 */
public T percents(T)(real value, real from)
{
    return cast(T) (value / from * 100);
}

unittest
{
    assert(percents!ubyte(5, 10) == 50);
    assert(percents!float(2.5, 10) == 25.0);
}

/**
 * Finds the percentage for each element in the
 * array relative to the `from` parameter.
 * 
 * Params:
 *     captures = (`T[]`) Array of numbers.
 *     from = (`T`) Absolute value.
 * 
 * Returns: An array of numbers of type identical to the type of numbers in the array.
 */
public T[] percentsCaptures(T)(T[] captures, T from)
{
    return cast(T[]) captures
        .map!(capture => percents!T(capture, from))
        .array;
}

unittest
{
    float[] percentsOfTen = percentsCaptures!float([2.5, 7.5], 10);
    float[] expectedResults = [25.0, 75.0];

    foreach (ubyte i; 0 .. 2)
        assert(percentsOfTen[i] == expectedResults[i]);
}
