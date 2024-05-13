from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.contrib.messages.views import  SuccessMessageMixin
from django.contrib.auth.views import LoginView

class RegistrationForm(UserCreationForm):
    email = forms.EmailField(required=True)

    class Meta:
        model = User
        fields = [
            'username', 'email', 'password1', 'password2'
        ]

class LoginFormView(SuccessMessageMixin, LoginView):
    template_name = "users/login.html"
    success_url = "blog/home.html"
    success_message = "You were successfully logged in"
