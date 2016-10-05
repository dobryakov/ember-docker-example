import { test } from 'qunit';
import moduleForAcceptance from 'ember-app/tests/helpers/module-for-acceptance';

moduleForAcceptance('Acceptance | list rentals');

test('visiting /rentals', function(assert) {
  visit('/rentals');

  andThen(function() {
    assert.equal(currentURL(), '/rentals');
  });
});
