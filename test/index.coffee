assert = require 'assert'
piano = require '../lib'

describe 'piano', ->
  before -> piano.loadAutotune()

  describe 'play a song ...', ->

    it 'return the correct notes', ->
      assert.equal piano.play(0), true
      assert.equal piano.play(4), false
      assert.equal piano.play(12), true
      assert.equal piano.play(13), false

  describe 'playing chords ...', ->

    it 'returns correct chords', ->
      assert.equal piano.playChord([0,5]), true
      assert.equal piano.playChord([2,5]), false
      assert.equal piano.playChord([0,5,9]), true
      assert.equal piano.playChord([0,5,9,12]), true
      assert.equal piano.playChord([0,5,7,9,12]), false
      assert.equal piano.playChord([0,5,9,12,24]), true

  describe 'autotuning a single note ...', ->

    it 'TPain got nothing on me', ->
      assert.equal piano.tune(0), 0
      assert.equal piano.tune(2), 0
      assert.equal piano.tune(3), 5
      assert.equal piano.tune(4), 5
      assert.equal piano.tune(5), 5
      assert.equal piano.tune(6), 6
      assert.equal piano.tune(13), 0
      assert.equal piano.tune(16), 5

  describe 'Buy you a drink ...', ->

    it 'TPain got nothing on me', ->
      assert.deepEqual piano.autotune([0,5]), [0,5]
      assert.deepEqual piano.autotune([0,2,3,4,5,6,13,16]), [0,0,5,5,5,6,0,5]
