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

module simple_math.chances;

import std.format;

import simple_math.percents;

/*
	Finds the chance of `value` shares falling out of `from`.

	Params:
		value = (`T`) Number of shares from `from`.
		аfrom = (`T`) Absolute value (100% relative to `value`).

	Returns: A number of type identical to the type of other parameters.

	Throws: `Error` if value lower than 0 or greater than `from`.

	Note: 
		This functiuon is similar to `T percents(T)(T value, T from)` 
		function from `percents.d` module and later will be deprecated.
*/
public T chance(T)(T value, T from)
{
	if (value > from || value < 0)
		throw new Error(format("Comparing value cannot be higher than absolute (0 .. %d).", from));

	return percents!T(value, from);
}

unittest
{
	assert(chance!byte(5, 25) == 20);
	assert(chance!byte(19, 20) == 95);
}
