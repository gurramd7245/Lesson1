def fibonacci(n):
    a, b = 0, 1
    series = []
    for _ in range(n):
        series.append(a)
        a, b = b, a + b
    return series

# Example usage:
if __name__ == '__main__':
    n = 10  # Specify the number of terms
    print(f'Fibonacci series up to {n} terms: {fibonacci(n)}')