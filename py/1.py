def main():
    f = open("./input/1.txt")
    # split input and form two sorted lists of integers
    ls = map(str.strip, f.readlines())
    ls = map(str.split, ls)
    ls = list(ls)
    left = sorted(map(int, [line[0] for line in ls]))
    right = sorted(map(int, [line[1] for line in ls]))

    # compute the differences between them
    dists = 0
    for li, ri in zip(left, right):
        dists += abs(li - ri)

    print(dists)


if __name__ == "__main__":
    main()
