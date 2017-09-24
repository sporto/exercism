import tables

type
  Reactor* = object
    foo: int
  Cell* = ref object of RootObj
    value*: int
  InputCell* = ref object of Cell
  ComputeCell* = ref object of Cell
    callbacks: Table[int, CallbackFn]
  ComputeFn* = proc(vals: seq[int]): int
  CallbackFn* = proc(val: int)

proc newReactor*(): Reactor =
  Reactor(foo: 0)

proc createInput*(reactor: Reactor, value: int): InputCell =
  InputCell(value: value)

proc createCompute*(reactor: Reactor, inputs: seq[Cell], fn: ComputeFn): ComputeCell =
  ComputeCell(
    value: 1,
    callbacks: initTable[int, CallbackFn]()
  )

proc addCallback*(compute: ComputeCell, callback: CallbackFn): int =
  let key = compute.callbacks.len()

  compute.callbacks.add(
    key,
    callback
  )

  key

proc removeCallback*(compute: ComputeCell, id: int) =
  compute.callbacks.del(id)