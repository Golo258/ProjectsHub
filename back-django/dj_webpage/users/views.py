from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
from .forms import RegistrationForm
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout

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


@login_required
def profile(request):
    return render(request, "users/profile.html")

def logout_view(request):
    logout(request)
    messages.success(request, "You have been logout successfully.")
    return redirect("blog-home")