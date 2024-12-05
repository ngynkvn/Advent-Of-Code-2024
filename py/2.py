import numpy as np


def main():
    f = open("./input/2.txt")
    # split input and form two sorted lists of integers
    reports = map(str.strip, f.readlines())
    levels = [list(map(int, rs.split())) for rs in reports]
    levels = list(levels)

    answer = sum(list(map(safety_check, levels)))
    print("Part 1:", answer)

    answer = sum(list(map(safety_check_bruteforce, levels)))
    print("Part 2:", answer)


def safety_check(levels: list[int]) -> bool:
    """
    So, a report only counts as safe if both of the following are true:

    The levels are either all increasing or all decreasing.
    Any two adjacent levels differ by at least one and at most three.

    NOTE: Pair differences will be all positive or all negative
          Abs. difference must be 1 <= n <= 3 (0b1, 0b10  0b11)
    """
    diffs = np.diff(levels)
    same_sign = np.all(diffs > 0) or np.all(diffs < 0)
    within_params = np.all((np.abs(diffs) >= 1) & (np.abs(diffs) <= 3))
    return bool(same_sign and within_params)


def safety_check_bruteforce(levels: list[int]):
    """
    Now, the same rules apply as before, except if removing a single
    level from an unsafe report would make it safe, the report instead
    counts as safe.
    """
    safe = safety_check(levels)
    for i in range(len(levels)):
        safe |= safety_check(levels[:i] + levels[i + 1 :])
    return safe


if __name__ == "__main__":
    main()
