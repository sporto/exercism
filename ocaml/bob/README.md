# Bob

Bob is a lackadaisical teenager. In conversation, his responses are very limited.

Bob answers 'Sure.' if you ask him a question.

He answers 'Whoa, chill out!' if you yell at him.

He says 'Fine. Be that way!' if you address him without actually saying
anything.

He answers 'Whatever.' to anything else.

For running the tests provided, you will need `Opam` and `Core`. Consult [opam](https://opam.ocaml.org) website for instuctions on how to install for your OS. Once `opam` is installed open a terminal window and run the following command to install core:

opam install core

## Running Tests

Because OCaml is a compiled language you need to compile your submission and the test code before you can run the tests. Compile with

```bash
$ corebuild -quiet test.native
```

and when successful run the tests by running the `test.native` executable:

```bash
./test.native
```

Alternatively just type

```bash
make
```

## Error: No implementations provided for the following modules:
         Str referenced from bob.cmx

### Message
```
+ ocamlfind ocamlopt -linkpkg -g -thread -package oUnit -package core bob.cmx test.cmx -o test.native
File "_none_", line 1:
Error: No implementations provided for the following modules:
         Str referenced from bob.cmx
Command exited with code 2.
```

### Reason
You are using a module in your solution, in this case the `Str` module, and the
OCaml build tool is not aware of this.

### Solution
Add the module you are trying to use to the `ocamlbuild` build options.

Modify the `test.native` directive of the Makefile to be:

```
test.native: *.ml *.mli
    @corebuild -quiet -pkg oUnit -pkg str test.native
```

Note the additional `-pkg str` option.

## Source

Inspired by the 'Deaf Grandma' exercise in Chris Pine's Learn to Program tutorial. [http://pine.fm/LearnToProgram/?Chapter=06](http://pine.fm/LearnToProgram/?Chapter=06)

## Submitting Incomplete Problems
It's possible to submit an incomplete solution so you can see how others have completed the exercise.

