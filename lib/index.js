'use strict'

// flatten arrays into a single array.
// NOTE:
//   this mutates the specified array.
//   if you want to avoid that, then wrap your array:
//     flatten([myArray])
module.exports = function flatten (array) {

  // usual loop, but, don't put `i++` in third clause
  // because it won't increment it when the element is an array.
  for (let i = 0; i < array.length; ) {

    const value = array[i]

    // if the element is an array then we'll put its contents
    // into `array` replacing the current element.
    if (Array.isArray(value)) {

      // only process `value` if it has some elements.
      if (value.length > 0) {

        // prepend our value with [i,1] to tell splice to
        // start splicing at `i` and delete the element at `i`.
        // NOTE: This is an in-place change; it mutates `array`.
        // To avoid this, wrap your array like: flatten([myarray])
        array.splice.apply(array, [i,1].concat(value))
      } else {
        // remove an empty array from `array`
        array.splice(i, 1)
      }

      // NOTE: we don't do `i++` because we want it to re-evaluate
      // the new element at `i` in case it is an array,
      // or we deleted an empty array at `i`.

    } else {
      // it's not an array so move on to the next element.
      i++
    }
  }

  // return the array so `flatten` can be used inline.
  return array
}
