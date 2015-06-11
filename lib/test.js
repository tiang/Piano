var IntervalTree = require('interval-tree');

// add interval data

var itree = new IntervalTree(300); // 300 : the center of the tree

itree.add([100139008, 100204543,  'foo']);
itree.add([44, 199, 'bar']);

// search 1: get overlapped regions from one point
var results = itree.search(100139009);

results.forEach(function(result) {
  console.log(result.data); // overlapped range data
  console.log(result.id);   // id of the overlapped range
});
