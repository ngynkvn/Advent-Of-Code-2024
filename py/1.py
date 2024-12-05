def main():
    f = open("./input/1.txt")
    # split input and form two sorted lists of integers
    ls = map(str.strip, f.readlines())
    ls = map(str.split, ls)
    ls = list(ls)
    left = sorted(map(int, [line[0] for line in ls]))
    right = sorted(map(int, [line[1] for line in ls]))

    # compute the differences between them
    answer = 0
    for li, ri in zip(left, right):
        answer += abs(li - ri)

    print("Part 1:", answer)

    # This time, you'll need to figure out exactly how often each
    # number from the left list appears in the right list. Calculate a total
    # similarity score by adding up each number in the left list after
    # multiplying it by the number of times that number appears in the right
    # list.
    from collections import Counter

    counts = Counter(right)
    answer = 0
    for li in left:
        answer += li * counts[li]
    print("Part 2:", answer)


if __name__ == "__main__":
    main()
