(module
  (func (export "score") (param $x f32) (param $y f32) (result i32)
    (local $max f32)

    get_local $x
    get_local $y
    f32.max
    set_local $max

    (return (i32.const 42))
  )
)
