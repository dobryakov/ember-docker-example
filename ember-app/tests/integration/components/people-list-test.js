import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('people-list', 'Integration | Component | people list', {
  integration: true
});

test('it renders people-list', function(assert) {
  // Set any properties with this.set('myProperty', 'value');
  // Handle any actions with this.on('myAction', function(val) { ... });

  this.render(hbs`{{people-list}}`);

  assert.equal(this.$().text().trim(), '');

  // Template block usage:
  this.render(hbs`
    {{#people-list}}

    {{/people-list}}
  `);

  assert.equal(this.$().text().trim(), '');
});
