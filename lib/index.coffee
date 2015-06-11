intervals = require 'interval-tree'

KEYS = [0, 5, 6, 9, 11,13];
autotuneIntervals = new intervals(KEYS[Math.round(KEYS.length/2)])

exports.loadAutotune =  ->
  for key, i in KEYS
    if (i == KEYS.length - 1)
      return
    autotuneIntervals.add( [KEYS[i], KEYS[i+1] ])

exports.play = (note) ->
  note = note % 12
  if (KEYS.indexOf(note) >= 0)
    return true
  else 
    return false

exports.playChord = (chord) ->
  invalidKeys = (item for item in chord when (@play(item)) is false)
  if (invalidKeys.length > 0) 
    return false
  else
    return true

exports.tune = (note) ->
  note = note % 12
  match = autotuneIntervals.search(note)

  first = Math.abs(match[0].data[0] - note)
  second = Math.abs(match[0].data[1] - note)

  if (first <= second or match[0].data[0] == note)
    return match[0].data[0]
  else
    return match[0].data[1]

exports.autotune = (notes) ->
  @tune(item) for item in notes





