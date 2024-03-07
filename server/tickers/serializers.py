from rest_framework.serializers import ModelSerializer, IntegerField

from .models import Ticker, UserInvestment


class TickerSerializer(ModelSerializer):
    class Meta:
        model = Ticker
        fields = "__all__"


class UserInvestmentListSerializer(ModelSerializer):
    ticker = TickerSerializer()

    class Meta:
        model = UserInvestment
        fields = "__all__"


class UserInvestmentCreateSerializer(ModelSerializer):
    ticker = IntegerField()

    class Meta:
        model = UserInvestment
        fields = "__all__"
        extra_kwargs = {
            'ticker': {'write_only': True}
        }
    
    def create(self, validated_data):
        ticker = Ticker.objects.get(pk=validated_data.pop("ticker"))
        
        investment = UserInvestment.objects.create(ticker=ticker, **validated_data).defer("tikckers")

        return investment
