from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
from .forms import RegistrationForm

def register(request):
    if request.method == "POST":
        userForm = RegistrationForm(request.POST)
        if userForm.is_valid():
            userForm.save()
            username = userForm.cleaned_data.get("username")
            print(f"{userForm.cleaned_data=}")
            messages.success(request, f"Account {username} has been created successfully")
            return redirect("blog-home")
    else:
        userForm = RegistrationForm()
    return render(request,
                  "users/register.html",
                  {"userForm": userForm})
