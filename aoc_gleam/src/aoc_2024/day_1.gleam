import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn pt_1(input: String) {
  let lines =
    input
    |> string.split(on: "\n")
    |> list.map(process_line)

  let assert [left, right] = {
    list.transpose(lines)
    |> list.map(list.sort(_, by: int.compare))
  }
  let assert Ok(n) = {
    list.map2(left, right, fn(x, y) { int.absolute_value(x - y) })
    |> list.reduce(int.add)
  }
  n
}

fn process_line(line: String) {
  let assert [a, b] =
    line
    |> string.split("   ")
    |> list.map(int.parse)
    |> list.map(result.unwrap(_, 0))
  [a, b]
}

pub fn pt_2(input: String) {
  0
}
