* it is a bad idea to have generic `<T extends Object>` but using `T?` in code. it makes problems for type inference
* having `<T extends Object?>` and `T?` seems redundant, since all `T`s are considered nullable. but it makes a some problems!
* conclusion: (todo)
    - add a warning if we have `T?` in code and `<T extends Object>` at the same time,
      or change it ?
    - if we have `<T extends Object?>` treat all 'T's and 'T?'s as 'T?'.
    - use runtimeType for toString ?
    - copy method should not be generated for classes containing null fields.
    - copy method can be generated for non-nullable generics with bounds as top bounds, but with type information loss.
    - we can generate with* methods for nullables.