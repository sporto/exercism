import tables, sequtils

type
  Reactor* = ref object
    cells: seq[Cell]
    lastId: int

  Cell* = ref object of RootObj
    callbacks: Table[int, CallbackFn]
    computeFn: ComputeFn
    id: int
    inputIds: seq[int]
    reactor: Reactor
    valueP: int

  InputCell* = ref object of Cell

  ComputeCell* = ref object of Cell

  ComputeFn* = proc(vals: seq[int]): int

  CallbackFn* = proc(val: int)

proc newReactor*(): Reactor =
  Reactor(
    cells: @[],
    lastId: 0,
  )

proc increaseId(reactor: Reactor): int =
  reactor.lastId = reactor.lastId + 1
  reactor.lastId

proc createInput*(reactor: Reactor, value: int): InputCell =
  let id = increaseId(reactor)
  result = InputCell(
    id: id,
    reactor: reactor,
    valueP: value,
  )
  reactor.cells.add(result)

proc getCellValue(cell: Cell): int =
  cell.valueP

proc getId(cell: Cell): int =
  cell.id

proc getValuesForInputs(cell: Cell): seq[int] =
  proc getValue(id: int): int =
    for c in cell.reactor.cells:
      if c.id == id:
        result = c.valueP

  cell.inputIds.map(getValue)

proc onReactorValueChanged(reactor: Reactor, changedCell: Cell)

proc compute(cell: Cell) =
  if cell of ComputeCell:
    let inputs = cell.getValuesForInputs()
    let newValue = cell.computeFn(inputs)
    if cell.valueP != newValue:
      cell.valueP = newValue
      for callback in cell.callbacks.values:
        callback(newValue)
      onReactorValueChanged(cell.reactor, cell)

proc onValueChanged(cell: Cell, other: Cell) =
  proc isSameAsOther(id: int): bool =
    id == other.id

  if cell of ComputeCell:
      if cell.inputIds.any(isSameAsOther):
        cell.compute()

proc onReactorValueChanged(reactor: Reactor, changedCell: Cell) =
  for cell in reactor.cells:
    cell.onValueChanged(changedCell)

proc `value=`*(cell: InputCell, value: int) =
  if cell.valueP != value:
    cell.valueP = value
    onReactorValueChanged(cell.reactor, cell)

proc value*(cell: Cell): int =
  cell.valueP

proc createCompute*(reactor: Reactor, inputs: seq[Cell], fn: ComputeFn): ComputeCell =
  let id = increaseId(reactor)

  result = ComputeCell(
    callbacks: initTable[int, CallbackFn](),
    computeFn: fn,
    id: id,
    reactor: reactor,
    valueP: 0,
    inputIds: inputs.map(getId)
  )

  reactor.cells.add(result)

  result.compute()

proc addCallback*(compute: ComputeCell, callback: CallbackFn): int =
  let key = compute.callbacks.len()

  compute.callbacks.add(
    key,
    callback
  )

  key

proc removeCallback*(compute: ComputeCell, id: int) =
  compute.callbacks.del(id)