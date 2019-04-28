from django.contrib import admin

# Register your models here.
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
    list_display = ['parking_zone','status']
    list_per_page = 10
    list_filter = ['status']

class reserveAd(admin.ModelAdmin):
    list_display = ['reserve_token','reserve_status','reserve_at']
    list_per_page = 10
    list_filter = ['reserve_status']
    search_fields = ['reserve_at']


class userAd(admin.ModelAdmin):
    list_display = ['user_fname', 'user_lname', 'username', 'phone_number','email','point']
    list_per_page = 10
    search_fields = ['user_fname']


class carAd(admin.ModelAdmin):
    list_display = ['car_license_number','car_brand','car_model','car_color']
    list_per_page = 10
    list_filter = ['car_brand', 'car_model','car_color']

admin.site.register(Parking,parkingAd)
admin.site.register(Parking_zone,parkingzAd)
admin.site.register(Parking_slot, parkingsAd)
admin.site.register(Reservation,reserveAd)
admin.site.register(Register_user,userAd)
admin.site.register(Car, carAd)
