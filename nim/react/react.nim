import tables, sequtils

type
  Reactor* = ref object
    cells: seq[Cell]
    lastId: int
    dirtyCellsIdMap: Table[int, bool]

  Cell* = ref object of RootObj
    callbacks: Table[int, CallbackFn]
    computeFn: ComputeFn
    dirty: bool
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
    dirtyCellsIdMap: initTable[int, bool](),
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

proc onReactorCellChanged(reactor: Reactor, changedCell: Cell)

proc compute(cell: Cell) =
  if cell of ComputeCell:
    cell.reactor.dirtyCellsIdMap.add(cell.id, false)
    let inputs = cell.getValuesForInputs()
    let newValue = cell.computeFn(inputs)
    if cell.valueP != newValue:
      cell.valueP = newValue
      for callback in cell.callbacks.values:
        callback(newValue)
      onReactorCellChanged(cell.reactor, cell)

proc onOtherCellChanged(cell: Cell, other: Cell) =
  proc isSameAsOther(id: int): bool =
    id == other.id
  
  proc isNotDirty(id: int): bool =
    not cell.reactor.dirtyCellsIdMap.mgetOrPut(id, false)

  if cell of ComputeCell:
    # This should not be called untils all the deps for this are resolved
    if cell.inputIds.any(isSameAsOther):
      # Mark this cell as dirty
      cell.reactor.dirtyCellsIdMap.add(cell.id, true)
      # Skip if any dep is dirty
      # Otherwise run it
      if cell.inputIds.all(isNotDirty):
        cell.compute()

proc onReactorCellChanged(reactor: Reactor, changedCell: Cell) =
  for cell in reactor.cells:
    cell.onOtherCellChanged(changedCell)

proc `value=`*(cell: InputCell, value: int) =
  if cell.valueP != value:
    cell.valueP = value
    onReactorCellChanged(cell.reactor, cell)

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