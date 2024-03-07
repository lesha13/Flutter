from django.urls import path

from .views import TickerListCreateAPIView, UserInvestmentListCreateAPIView, UserInvestmentRetrieveUpdateDestroyAPIView

urlpatterns = [
    path("", TickerListCreateAPIView.as_view()),
    path("by-user/", UserInvestmentListCreateAPIView.as_view()),
    path("by-user/<int:pk>", UserInvestmentRetrieveUpdateDestroyAPIView.as_view()),
]