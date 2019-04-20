from django.urls import path
from customer import views

urlpatterns = [
    path('', views.index),
    path('register/', views.register),
    path('login/', views.my_login),
    path('buy_package/', views.buypackage),
    path('payment/', views.payment),
    path('profile/', views.profile),
    path('edit_profile/', views.editprofile),
    path('add_car/', views.addcar),
    path('change_password/', views.changepassword),
]