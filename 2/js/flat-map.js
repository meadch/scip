function flatMap(fn, arr) {
  return arr
          .map(fn)
          .reduce((accum, elem) => accum.concat(elem))
}

function permutations(set){
  if (set.length === 0) return [[]]

  return flatMap((i) => {
    return permutations(remove(i, set)).map((p) => {
      return [i, ...p]
    })
  }, set)
}

function remove(x, set){
  return set.filter((val) => val !== x)
}