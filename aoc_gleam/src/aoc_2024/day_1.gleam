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
  list.map2(left, right, fn(x, y) { int.absolute_value(x - y) })
  |> list.reduce(int.add)
  |> result.unwrap(-1)
}

fn process_line(line: String) {
  string.split(line, "   ")
  |> list.map(int.parse)
  |> list.map(result.unwrap(_, 0))
}

pub fn pt_2(input: String) {
  todo
}
