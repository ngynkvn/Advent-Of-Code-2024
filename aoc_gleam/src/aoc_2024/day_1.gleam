import gleam/int
import gleam/list
import gleam/result
import gleam/string

fn parse_input(input: String) {
  string.split(input, on: "\n")
  |> list.map(process_line)
  |> list.transpose
}

pub fn pt_1(input: String) {
  let assert [left, right] = parse_input(input)
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
  todo
}
