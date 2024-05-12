from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User


class Post(models.Model):
    title = models.CharField(max_length=100, null=False)
    content = models.TextField(max_length=500)
    posted_date = models.DateTimeField(default=timezone.now)
    author = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return (f"Post: {self.title} with "
                f"content: {self.content}. "
                f"Author {self.author.username} "
                f"Published on {self.posted_date}")