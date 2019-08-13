const assert = require('assert');
const Nyanpasu = require('../src/nyanpasu');

describe('Nyanpasu', function() {
  it('sayHi', async function () {
    const nyanpasu = new Nyanpasu();
    assert.equal(nyanpasu.sayHi(), 'Nyanpasu!')
  });
})
