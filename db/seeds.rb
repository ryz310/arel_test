Baz.create(name: 'baz 1', bar_id: 
	Bar.create(name: 'bar 1', foo_id: 
		Foo.create(name: 'foo 1').id).id)

Baz.create(name: 'baz 2', bar_id: 
	Bar.create(name: 'bar 2', foo_id: 
		Foo.create(name: 'foo 2').id).id)

Baz.create(name: 'baz 3', bar_id: 
	Bar.create(name: 'bar 3', foo_id: 
		Foo.create(name: 'foo 3').id).id)

Baz.create(name: 'baz 4', bar_id: 
	Bar.create(name: 'bar 4', foo_id: 
		Foo.create(name: 'foo 4').id).id)