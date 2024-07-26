#!/bin/python3

import math
import os
import random
import re
import sys


def conditional_statments(numb: int):
    if numb % 2 == 1:
        print("Weird")
    elif numb % 2 == 0:
        if 2 <= numb <= 5:
            print("Not Weird")
        elif 6 <= numb <= 20:
            print("Weird")
        elif numb > 20:
            print("Not weird")


def show_range():
    numb = int(input("Enter a number: "))
    numbers = [numb for numb in range(1, numb + 1)]
    print(*numbers, sep="")


import re


def check_number_correctness(number):
    pattern = r'^[789]\d{9}'
    if re.match(pattern, number):
        return "YES"
    else:
        return "NO"


def find_out_input_correctness():
    # 10 digits, 7 8 or 9 at beggining
    number_of_taken_numbers = int(input(""))
    numbers = []
    for occurrence in range(0, number_of_taken_numbers):
        checked_number = input()
        check_number_correctness(checked_number)


def geh_runner_up(scores: list):
    sorted_scores = list(sorted(set(scores)))
    return sorted_scores[-2]


def find_runner_up():
    n = int(input())
    arr = list(map(int, input().split()))
    runner_up = geh_runner_up(arr)
    print(runner_up)


def find_students_by_grade(students):
    grades = []
    for student in students:
        name, score = student
        grades.append(score)

    second_lowest = list(sorted(set(grades)))[1]
    searched_students = []
    for student in students:
        if student[1] == second_lowest:
            searched_students.append(student[0])

    if len(searched_students) > 1:
        return sorted(searched_students)
    else:
        return searched_students


def find_lowest_student_grades():
    students = []
    for _ in range(int(input())):
        name = input()
        score = float(input())
        students.append([name, score])

    students_name = find_students_by_grade(students)
    for student in students_name:
        print(student)


from functools import reduce


def get_scores_average_by_name(student_name, students_scores: dict):
    for name, scores in students_scores.items():
        if student_name == name:
            sum_of_scores = reduce(lambda first_score, second_score: first_score + second_score, scores)
            return "{:.2f}".format(sum_of_scores / len(scores))


def count_average_of_students_scores():
    n = int(input())
    student_marks = {}
    for _ in range(n):
        name, *line = input().split()
        scores = list(map(float, line))
        student_marks[name] = scores
    query_name = input()
    average = get_scores_average_by_name(query_name, student_marks)
    print(average)


def perform_actions(number_of_actions: int):
    base_list = []
    for _ in range(0, number_of_actions):
        action, *object = input().split()
        object_elements = list(map(int, object))
        match action:
            case "insert":
                base_list.insert(object_elements[0], object_elements[1])
            case  "append":
                base_list.append(object_elements[0])
            case "remove":
                base_list.remove(object_elements[0])
            case "pop":
                base_list.pop()
            case  "reverse":
                base_list.reverse()
            case "sort":
                base_list.sort()
            case "print":
                print(base_list)

def get_input_if_its_None(line):
    if line is None:
        line = input()
    return line

def swap_case(word):
    word = get_input_if_its_None(word)
    changed_word = ""
    for letter in word:
        if letter.islower():
            changed_word += letter.upper()
        elif letter.isupper:
            changed_word += letter.lower()

    return changed_word

def split_and_join(line):
    line = get_input_if_its_None(line)
    splited_line= line.split(" ")
    joined_splited_line = "-".join(splited_line)
    return joined_splited_line


def mutate_string(string, position, character):
    converted = list(string)
    converted[position] = character
    return "".join(converted)


def count_substring(string, sub_string):
    number_of_occurance = 0
    for index in range(0, len(string)):
        if string[index] in sub_string:
            if string[index:len(sub_string) + index] == sub_string:
                number_of_occurance += 1

    return number_of_occurance


if __name__ == '__main__':
    string = "ABCDCDC" #input().strip()
    sub_string = "CDC" #input().strip()

    count = count_substring(string, sub_string)
    print(count)

# ABCDCDC
# CDC

def run_all():
    n = int(input().strip())
    conditional_statments(n)
    show_range()
    find_out_input_correctness()
    find_runner_up()
    find_lowest_student_grades()
    count_average_of_students_scores()


# if __name__ == '__main__':
#     # run_all()
#     perform_actions(int(input()))
