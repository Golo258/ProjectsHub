def find_minimum(test_list):
    if not test_list:
        raise ValueError("The list is empty")

    min_value = None
    for value in test_list:
        if isinstance(value, (int, float)):
            if min_value is None or value < min_value:
                min_value = value
        elif isinstance(value, (list, dict)):
            raise TypeError("Elements of type list or dict are not allowed")
        else:
            raise TypeError(f"Unsupported element type: {type(value)}")

    return min_value


numbers = [5, 3, 8, 1, 9, 2]
print("Minimalna wartość:", find_minimum(numbers))


def read_list_from_file(file_name):
    with open(file_name, "r") as file:
        content = file.read().strip()
        return [int(numb) for numb in content.split(",")]

def write_list_to_file(file_path, data):
    with open(file_path, 'w') as file:
        file.write(','.join(map(str, data)))

def find_maximum(test_list):
    if not test_list:
        return None
    max_value = test_list[0]
    for value in test_list[1:]:
        if value > max_value:
            max_value = value
    return max_value


# Przykład użycia
numbers = [5, 3, 8, 1, 9, 2]
print("Maksymalna wartość:", find_maximum(numbers))


def selection_sort(sorted_list):
    n = len(sorted_list)
    for i in range(n):
        min_idx = i
        for j in range(i + 1, n):
            if sorted_list[j] < sorted_list[min_idx]:
                min_idx = j
        sorted_list[i], sorted_list[min_idx] = sorted_list[min_idx], sorted_list[i]
    return sorted_list


# Przykład użycia
numbers = [64, 25, 12, 22, 11]
print("Posortowana lista (Selection Sort):", selection_sort(numbers))


def linear_search(search_list, target):
    for i, value in enumerate(search_list):
        if value == target:
            return i
    return -1


# Przykład użycia
numbers = [5, 3, 8, 1, 9, 2]
target = 8
print("Indeks wartości", target, ":", linear_search(numbers, target))
