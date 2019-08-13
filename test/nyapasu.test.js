const assert = require('assert');
const Nyapasu = require('../src/nyapasu');

describe('Nyapasu', function() {
  it('sayHi', async function () {
    const nyapasu = new Nyapasu();
    assert.equal(nyapasu.sayHi(), 'Nyapasu!')
  });
})
