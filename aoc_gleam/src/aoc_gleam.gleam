import argv.{Argv}
import gleam/int
import gleam/io
import gleam/list
import gleam/string
import simplifile

pub fn main() {
  let Argv(_, _, args) = argv.load()
  case args {
    ["1"] -> {
      io.println("Day 1")
      let assert Ok(input) = simplifile.read("./input/1.txt")
      io.println(solve_day1(input))
    }
    _ -> Nil
  }
}

pub fn solve_day1(input: String) -> String {
  let lines =
    input
    |> string.split(on: "\n")
    |> list.filter_map(fn(i) {
      case string.split(i, " ") {
        [a, _, _, b] -> {
          let assert Ok(a) = int.parse(a)
          let assert Ok(b) = int.parse(b)
          Ok([a, b])
        }
        _ -> Error("")
      }
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
  int.to_string(n)
}
