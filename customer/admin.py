from django.contrib import admin

# Register your models here.
from django.contrib.auth.models import User

from customer.models import Parking, Reservation, Register_user, Car, Parking_zone, Parking_slot


class parkingAd(admin.ModelAdmin):
    list_display = ['parking_zone','parking_slot','arrive_at','leave_at']
    list_per_page = 10
    list_filter = ['parking_zone','parking_slot']

class parkingzAd(admin.ModelAdmin):
    list_display = ['name','capacity','available']
    list_per_page = 10
    search_fields = ['name']

class parkingsAd(admin.ModelAdmin):
    list_display = ['id','parking_zone','status']
    list_per_page = 10
    list_filter = ['status']

class reserveAd(admin.ModelAdmin):
    list_display = ['register_user','reserve_token','reserve_status','reserve_at']
    list_per_page = 10
    list_filter = ['reserve_status','register_user']


class userAd(admin.ModelAdmin):
    model = User
    list_display = ['id','user','phone_number','point']
    list_per_page = 10
    search_fields = ['user']




class carAd(admin.ModelAdmin):
    list_display = ['register_user','car_license_number','car_brand','car_model','car_color']
    list_per_page = 10
    list_filter = ['car_brand', 'car_model','car_color']



admin.site.register(Parking,parkingAd)
admin.site.register(Parking_zone,parkingzAd)
admin.site.register(Parking_slot, parkingsAd)
admin.site.register(Reservation,reserveAd)
admin.site.register(Register_user,userAd)
admin.site.register(Car, carAd)
