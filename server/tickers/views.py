from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import SAFE_METHODS

from .models import Ticker, UserInvestment
from .serializers import TickerSerializer, UserInvestmentListSerializer, UserInvestmentCreateSerializer


class TickerListCreateAPIView(ListCreateAPIView):
    queryset = Ticker.objects.all()
    serializer_class = TickerSerializer


class UserInvestmentListCreateAPIView(ListCreateAPIView):
    queryset = UserInvestment.objects.all()
    def get_serializer_class(self):
        if self.request.method in SAFE_METHODS:
            return UserInvestmentListSerializer
        return UserInvestmentCreateSerializer


class UserInvestmentRetrieveUpdateDestroyAPIView(RetrieveUpdateDestroyAPIView):
    queryset = UserInvestment.objects.all()
    serializer_class = UserInvestmentListSerializer