
## Behaviour

silk has a precise semantics about how the basic forms should be interpreted. For each form there are a number of statements about it that describe it's behaviour

### Visor
- a _visor_ is a container

- the _primary input_ of a _visor_ is related to the _primary inputs_ of all _matched_ values contained by it
  - whenever an event occurs upon the _primary input_ the event is _distributed_
    where all values is each of a composite where the event is composite or the single event if it is singular
    a) all _associated_ values are _sent_ to matching _associated_ values of the _visor_
    b) all _unassociated_ values are sent to all _unassociated_  values of the _visor_
    c) all _anonymously associated_ values are sent to corresponding _anonymously associated_

- the entities of a visor are able to designate other entities by their associations

- a value in a visor is considered _matched_ if it is added while the mode is set to _matched_

- if a value is the _symbol_ ```matched``` or ```ambient``` then set the mode accordingly

- there is an implicit auxilliary output called match which is bound to the internal channel of @onlyall.
 - ```@onlyall, @all, @only, @some, @none, ``` is bound to the distribution behaviour
 when a distribution occurs the
    - onlyall is set True when all input values reach all target values and all target values report match as True
    - all is set when all inputs send to targets that are then set true
    only is set when all targets are set true
    - some is when at least one input is sent to a target that is then set true
    - none is set when none of the targets match any inputs


### Construct
- a _construct_ is a container

- the _primary output_ of a _construct_ is it's product which implicitly draws from the @produce internal output.
  - @produce is related to all the primary outputs of _product_ values contained by it.
    - when produce is demanded values marked product will be demanded and added to the produced representation
    a) _associated_ values will produce value with the same association. only the latest will be added to product
      with the exception of anonymously associated values which produce anonymously associated representations
    b) _unassociated_ values
    - when a product fails to produce it is ignored

  - the primary input is treated as a trigger

### Chain

- a _chain_ is a container

- a chain can have an inner wing which divides the chain into layers and admits output from the left as input to the right.

- the _primary input_ of a _chain_ is implicitly the admitted primary input of the first layer
- the _primary output_ of a _chain_ is implicitly the admitted primary output of the last layer

- the primary admitted input to a layer is connected to the primary input of the first
- the primary output of a value is connected to the primary input of the next value
- the primary output of the last value is connected to the primary admitted output
- the admitted inputs of a layer are implicitly connected to the inputs of all successive values of the same name within the layer.
- the admitted outputs are implicitly connected to the ouputs of all preceding values of the same name.
- the admitted inputs of a layer are connected to the admitted output of the layer which have the same name.

### Reference

- a _reference_ is evaluated by following the reference to the root level structure and will be an _instantiation_ _interpretation_ or a _resourcing_

- an _instantiation_ will provide the representation contained as a construct to the primary input of the root structure, it will draw the resulting representation from the primary output is interpreted generically and added to the context.

- an _interpretation_ when the produced form is not a generic utility the resulting value must be mounted as a wrapper compatibilised to fit in a generic context

- a _resourcing_ is only a reflection of the structure that it refers and is only attached to the resource for as long as a synchronous execution is taking place.

- a _bus_ is another form of reference where events can distribute to all referrers.


### Literals

- includes strings numbers booleans templates symbols
- primary output which can only report its own representative value
- primary input which compares the input to its own value and triggers its production
- has an implicit output called match which is the result of the above comparison


### Conditionals

- provides 3 contexts. a condition, a truth path and a false path
- condition path uses the match to determine which path
- has a primary input which when events occur will
  - follow the condition path
  - pull from the match
  - push to the appropriate value
  - those values push to the primary output of the conditional
- has a primary output which when samples are drawn will
  - draw on the condition value match
  - pull from the appropriate value
  - the value then pulls from the conditional primary input

The conditional is an integrated unit
- the designation space of those values is the same as that of the conditional
- the advertisement space of those values is the same
- the self reference of the values is the the self reference of the conditional

### Association
- an association has a key and a value
 has a primary output that produces an association when its value produces and whose key is equal to its own
- has a primary input which dissociates the input value and puts to the values primary input
- has an output called match that reflects the match of it's own value

### Contacts
- a key, a channel and a chain of wrapping keys
- if has key claims a designation space from parent and targets the matching associations connecting those matching to its own context
  - it has a primary output which is a reflection of its targets primary output
  - it has a primary input which is a reflection of its targets primary input
- if it has no key
  - it has a primary output which is a forwarding of its nominated input
  - it has a primary input which  is a forward of its nominated output
- if it's key is '@' then
  - it has a primary input which is a reflection of it parent on the nominated output
  - it has a primary output which is a reflection of it parent on the nominated input
