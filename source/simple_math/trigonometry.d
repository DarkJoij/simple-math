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
 * 
 * NOTE: To use classic trigonometry functions use standard module 
 * [std.math](/usr/include/dmd/phobos/std/math/trigonometry.d).
 */

module simple_math.trigonometry;

import std.math;

/**
 * Finds the sine of the angle by its degree measure.
 * 
 * Params:
 *     angleMeasure = (`T`) Degree measure of the angle.
 * 
 * Returns: A number of type `double` is the sine of the angle in radians.
 */
public double sine(T)(T angleMeasure)
{
    return sin(angleMeasure * (PI / 180));
}

unittest
{
    assert(sine(30) == 0.5);
    assert(sine(300) == -sqrt(3.0) / 2);
    assert(sine(60) == sqrt(3.0) / 2);
}

/**
 * Finds the cosine of the angle by its degree measure.
 * 
 * Params:
 *     angleMeasure = (`T`) Degree measure of the angle.
 * 
 * Returns: A number of type `double` is the cosine of the angle in radians.
 */
public double cosine(T)(T angleMeasure)
{
    return cos(angleMeasure * (PI / 180));
}

unittest
{
    assert(cosine(60) == 0.5);
    assert(cosine(225) == -sqrt(2.0) / 2);
    assert(cosine(30) == sqrt(3.0) / 2);
}

/**
 * Finds the tangents of the angle by its degree measure.
 * 
 * Params:
 *     angleMeasure = (`T`) Degree measure of the angle.
 * 
 * Returns: A number of type `double` is the tangents of the angle in radians.
 */
public double tangents(T)(T angleMeasure)
{
    return sine(angleMeasure) / cosine(angleMeasure);
}

unittest
{
    assert(tangents(0) == 0);
    assert(tangents(45) == 1);
}

/**
 * Finds the cotangents of the angle by its degree measure.
 * 
 * Params:
 *     angleMeasure = (`T`) Degree measure of the angle.
 * 
 * Returns: A number of type `double` is the cotangents of the angle in radians.
 */
public double cotangents(T)(T angleMeasure)
{
    return cosine(angleMeasure) / sine(angleMeasure);
}

unittest
{
    assert(cotangents(45) == 1);   
}
