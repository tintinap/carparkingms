import random
import json

from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render, redirect

from customer.models import Parking_zone, User, Register_user, Car


def index(request):
    parking_list = list(Parking_zone.objects.values())
    user_list = list(Register_user.objects.values())
    user_car_list = list(Car.objects.values())
    print(user_car_list)
    context = {
        'parking':parking_list,
        'user_in':user_list,
        'car_in':user_car_list

    }
    return render(request, 'customer/index.html',context=context)

def my_login(request):
    context = {}
    if request.method == 'POST':
        username = request.POST.get("username")
        password = request.POST.get("password")

        user = authenticate(request, username=username, password=password)
        if user:
            login(request, user)

            next_url = request.POST.get('next_url')
            if next_url:
                return redirect(next_url)
            else:
                return redirect("index")
        else:
            context['username'] = username
            context['password'] = password
            context['error'] = 'Wrong username or password'
    next_url = request.GET.get('next')
    if next_url:
        context['next_url'] = next_url

    return render(request, 'customer/login.html',context=context)

def buypackage(request):
    u = User.objects.get()
    user = list(Register_user.objects.filter(user_id=u.id).values())
    context = {
        'user_in': user,
    }

    return render(request, 'customer/buypackage.html',context=context)

def register(request):
    return render(request, 'customer/register.html')

def profile(request):
    u = User.objects.get()
    user = list(Register_user.objects.filter(user_id=u.id).values())
    car = list(Car.objects.filter(register_user_id=user[0]["id"]).values())
    context = {
        'user_in':user,
        'car_in':car
    }
    return render(request, 'customer/profile.html',context=context)

def editprofile(request):
    u = User.objects.get()
    user = list(Register_user.objects.filter(user_id=u.id).values())
    context = {
        'user_in': user,
    }
    return render(request, 'customer/editprofile.html',context=context)

def addcar(request):
    return render(request, 'customer/addcar.html')

def changepassword(request):
    return render(request, 'customer/changepassword.html')

def my_logout(requset):
	logout(requset)
	return redirect('login')
