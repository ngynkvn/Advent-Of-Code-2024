import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn pt_1(input: String) {
  let lines =
    input
    |> string.split(on: "\n")
    |> list.map(fn(line) {
      let assert [a, b] =
        line
        |> string.split("   ")
        |> list.map(int.parse)
        |> list.map(result.unwrap(_, 0))
      [a, b]
    })
  let assert [left, right] = {
    list.transpose(lines)
    |> list.map(fn(l) { list.sort(l, by: int.compare) })
  }
  let assert Ok(n) =
    list.zip(left, right)
    |> list.map(fn(arg: #(Int, Int)) {
      let #(x, y) = arg
      int.absolute_value(x - y)
    })
    |> list.reduce(int.add)
  n
}

pub fn pt_2(input: String) {
  0
}
