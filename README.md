

# Silk

__A language of elegance where data flows are woven freely and expressively, where symettry and asymettry, push and pull are balanced and harmonized into an immaculate tapestry of forms.__

#### Caution: README driven development, may refer to things that don't yet exist

## Motivation

Programming is ugly, and this makes creating programs more arduous than it needs to be. Silk is an attempt to create a programming language based on conceptual balance and neccessity. At first it will likely appear strange and esoteric, rather than beautiful because it is so different to what most of us are used to. It operates without classes, functions, variables and for-loops. It is believed these are what create the asymettry that ultimately causes us to write twisted, intractable and verbose code.

The world we see is one distorted by the concepts we are familiar with, though they may be ultimately arbitrary in the grand schema. This project is an attempt to create a language which challenges our ideas about programming and hopefully leads to a leap forward in the effectiveness of our collective intellect commanding information technology.

we are talking about a migration from execution flow to information flow development since it is information that actually benefits people. People should be able to express ideas of how to create, transform, combine, distribute and consume information without having to think about


## Philosophy

silk is founded in a philosophical framework which gives ground to the design decisions. As a language without statements, keywords, functions or classes there is a great deal to explain and this section will be of general interest to many as a treatment of functional aesthetics which could change the way we think about systems both organic and synthetic.

[more](doc/Philosophy.md)

## Syntax

Silk's syntax is perhaps it's only fixed point, while there is some flexibility in how programs are interpreted, some with significant behavioural differences appropriate to the target platform. There is only one silk syntax which is an exact set of valid programs.

[more](doc/Syntax.md)

## Execution

Silk code can be compiled to many targets, yet there is a common process by which the code is loaded from it's source files into the target. There is a core silk runtime, for desktop and server development, and a playbook for implementing targets other than the development environment and for .

## Behaviour

where the former section is about how code is translated from it's textual artefacts(directories and files) into its live environment. This is about how it will operate from this point onward. This is the part of the specification for how to behave.

```

addOne = (~ + 1)
= core/*

app = [
  /core/init
  1
  /addOne
  /core/print
]

```

## Usage

#### Installation
one line install for latest stable platform binary and standard library

```console
curl https://silk-lang.org/install.sh | sh
```

#### New Project
begin a new silk project in the current directory on the specified platform
```sh
silk init platform-name
```

#### Running
start a silk program
```sh
silk runE
```

#### Compiling

#### Module Install
download the module
```
silk install module-name
```
events
Timestamps
Versions


## Execution Models

the syntax and core forms described could potentially encode for a plethora of different behaviours depending on how the implementions treat topics such as asynchronicity, blocking, recursion.

In essence the code produces an abstract syntax tree which is turned into an execution graph which becomes a number of buffers, executor threads and platform calls that are modelled in the implementing language.

The idea is to have a precise specification for how the language produces a graph which could be interpreted in a variety of distinct operational contexts, from Infrastructure as Code, to LLVM bytecode to

It is not however a one directional affair, there are certain actions which will modify the graph itself and these are essential to the operation to work not from the ground but also from within the program itself.
