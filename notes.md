# Random, easy-to-forget things from the GF tutorial 

## Keywords
- `cat` : `fun` = `lincat` : `lin`:
    - `cat` = grammatical category (type) (NP, adjective etc.)
    - `fun` = type of a function to construct a category
    - `lincat` = concrete "implementation" of a category (e.g. as a simple string, or as a string and a gender)
    - `lin` = linearization rule, i.e. "body" of a `fun`
- `oper` = function as commonly intended in FP (basically lambda abstraction)

## Shell
- generating nice graphs:
    - `visualize_tree` (`vt`) for __GF ASTs__ (?)
    - `visualize_parse` (`vp`) for __parse trees__
    - `align_word` (`aw`) for __word alignments__
  to actually view things on Linux, add `-view="xdg-open"`
- testing a resource module:
    1. `import` (`i`) it with `-retain`
    2. run it on some parameters with `compute_concrete` (`cc`), i.e. `cc oprname params`

## Module types
(to indicate in module header):
    
name | purpose
--- | ---
`abstract` | AS
`concrete` | CS
`resource` | collection of `oper`s, i.e. library. 

Opening a resource module in a CS module:

```
concrete CSModuleName of ASModuleName = openResModuleName in {
    ...
}
```

## Extending a grammar (inheritance)
```
abstract/concrete ExtensionModuleName = ModuleToExtendName ** {
    ...
}
```

Multiple inheritance is also possible:

```
abstract/concrete ExtensionModuleName = Module1ToExtendName, Module2ToExtendName, ... ** {
    ...
}
```
