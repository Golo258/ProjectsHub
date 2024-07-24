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

    second_lowest =  list(sorted(set(grades)))[1]
    searched_students = []
    for student in students:
        if student[1] == second_lowest:
            searched_students.append(student[0])

    if len(searched_students) > 1 :
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

if __name__ == '__main__':
    n = int(input().strip())
    conditional_statments(n)
    show_range()
    find_out_input_correctness()
    find_runner_up()
    find_lowest_student_grades()