# Contributing to GFpedia

- for fixing lexical items that _already exist_ in the GF wordnet, you can do everything from the web interface
- for _adding_ lexical items to the wordnet, you need to clone [GrammaticalFramework/gf-wordnet](https://github.com/GrammaticalFramework/gf-wordnet) and work on the source code directly. It is okay to add items that do not have a wordnet ID
- to fix language-specific syntactical issues, you need to work with the GF RGL directly [GrammaticalFramework/gf-rgl](https://github.com/GrammaticalFramework/gf-rgl)
- for fixing the abstract syntax trees, you need to work on the Python scripts in [krangelov/gf-wikidata](https://github.com/krangelov/gf-wikidata). To test your changes locally, you need to:
  1. clone [GrammaticalFramework/gf-core](https://github.com/GrammaticalFramework/gf-core)
  2. switch to the `majestic` branch
  3. install the C runtime (instructions [here](https://github.com/GrammaticalFramework/gf-core/tree/majestic/src/runtime/c))
  4. install the Python bindings (instructions [here](https://github.com/GrammaticalFramework/gf-core/tree/majestic/src/runtime/python). Note that setting `LD_LIBRARY_PATH=/usr/local/lib` is not just a setup step - `LD_LIBRARY_PATH=` needs to be set to use the `pgf` module in Python)
  5. install the `wordnet` library from [GrammaticalFramework/gf-wordnet/python](https://github.com/GrammaticalFramework/gf-wordnet/tree/master/python) by running `python setup.py install` (requires Python 3)
  6. install the GF RGL ([GrammaticalFramework/gf-rgl](https://github.com/GrammaticalFramework/gf-rgl))
  7. clone [GrammaticalFramework/gf-wordnet](https://github.com/GrammaticalFramework/gf-wordnet)
  8. compile the GF wordnet (this might take forever unless you customize the Makefile to only compile the languages you are working with)
- [krangelov/wikimini](https://github.com/krangelov/wikimini) is obsolete