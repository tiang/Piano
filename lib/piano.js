var IntervalTree = require('interval-tree');

// add interval data
var s = [0,5,7,9]
console.log(s[s.length/2])
var itree = new IntervalTree(s[s.length/2]); // 300 : the center of the tree

itree.add([0, 5]);
itree.add([6, 9]);

// search 1: get overlapped regions from one point
var results = itree.search(9);

results.forEach(function(result) {
  console.log(result.data); // overlapped range data
  console.log(result.id);   // id of the overlapped range
});
