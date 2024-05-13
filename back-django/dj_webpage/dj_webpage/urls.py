
from django.contrib import admin
from django.urls import path, include
from django.contrib.auth import views as auth_views
from users import views as user_views
from users import forms as user_forms

from django.conf.urls.static import  static
from django.conf import settings


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include("blog.urls")),
    path('register/', user_views.register, name="register"),
    path('login/', user_forms.LoginFormView.as_view(), name="login"),
    path('logout/', user_views.logout_view, name='logout'),
    path('profile/', user_views.profile, name="profile"),

]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)