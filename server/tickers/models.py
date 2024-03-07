from django.db import models


class Ticker(models.Model):
    ticker = models.CharField(max_length=16, unique=True)
    price = models.FloatField()


class UserInvestment(models.Model):
    user = models.ForeignKey("auth.User", on_delete=models.CASCADE)
    ticker = models.ForeignKey(Ticker, on_delete=models.CASCADE)
    quantity = models.IntegerField(default=1)
    timestamp = models.DateTimeField(auto_now_add=True)
