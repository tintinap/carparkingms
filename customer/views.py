import random
import json

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.shortcuts import render, redirect

from customer.form import LoginForm, UsernameForm, Addcarform, Editprofileform, Changepassform
from customer.models import Parking_zone, Register_user, Car, User_sys


def index(request):
    parking_list = list(Parking_zone.objects.values())
    if request.user.is_authenticated:
        id = request.user.id
        u = list(User_sys.objects.filter(user_id=id).values())
        user_list = list(Register_user.objects.filter(id=u[0]['id']).values())
        user_car_list = list(Car.objects.filter(register_user_id=u[0]['id']).values())
    else:
        user_list = [{'point':0}]
        user_car_list=[]
    context = {
        'parking':parking_list,
        'user_in':user_list,
        'car_in':user_car_list

    }
    return render(request, 'customer/index.html',context=context)

def my_login(request):
    context = {}
    form = LoginForm()
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data.get("username")
            password = form.cleaned_data.get("password")
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
    context={
        'form':form
    }
    print(form)
    return render(request, 'customer/login.html',context=context)

def buypackage(request):
    id = request.user.id
    u = list(User_sys.objects.filter(user_id=id).values())
    user = list(Register_user.objects.filter(id=u[0]['id']).values())
    if request.method == "POST":
        re_user = Register_user.objects.get(id=u[0]['id'])
        re_user.point = user[0]['point']+int(request.POST.get('point'))
        re_user.save()
    user_1 = list(Register_user.objects.filter(id=u[0]['id']).values())
    context = {
        'user_in': user_1,
    }

    return render(request, 'customer/buypackage.html',context=context)

def register(request):
    form_user = UsernameForm()
    if request.method == "POST":
        print(2)
        form_user = UsernameForm(request.POST)
        if form_user.is_valid():
            print(3)
            user = User.objects.create_user(form_user.cleaned_data.get("username"), form_user.cleaned_data.get("email"),form_user.cleaned_data.get("password1"))
            user.save()
            user_ob = User_sys.objects.create(
                user=user,
                type="re"
            )
            regist_user = Register_user.objects.create(

                user_fname=form_user.cleaned_data.get("firstname"),
                user_lname=form_user.cleaned_data.get("lastname"),
                username=form_user.cleaned_data.get("username"),
                password=form_user.cleaned_data.get("password1"),
                phone_number=form_user.cleaned_data.get("phone"),
                email=form_user.cleaned_data.get("email"),
                point=0,
                user=User_sys.objects.get(user_id=user.id)
            )
            car_ob = Car.objects.create(
                car_license_number=form_user.cleaned_data.get("carid"),
                car_brand=form_user.cleaned_data.get("carbrand"),
                car_model=form_user.cleaned_data.get("carmodel"),
                car_color=form_user.cleaned_data.get("carcolor"),
                register_user=regist_user
            )
            return redirect('index')
    context = {
        'form_user':form_user,
    }
    return render(request, 'customer/register.html',context=context)

def profile(request):
    id = request.user.id
    u = list(User_sys.objects.filter(user_id=id).values())
    user = list(Register_user.objects.filter(user_id=u[0]['id']).values())
    car = list(Car.objects.filter(register_user_id=user[0]["id"]).values())
    context = {
        'user_in':user,
        'car_in':car
    }
    return render(request, 'customer/profile.html',context=context)

def editprofile(request):
    form = Editprofileform()
    id = request.user.id
    us = User.objects.get(id=id)
    u = User_sys.objects.get(user_id=id)
    user = list(Register_user.objects.filter(user_id=u.id).values())
    if request.method == "POST":
        form = Editprofileform(request.POST)
        if form.is_valid():
            regist = Register_user.objects.get(user_id=u.id)

            regist.username = form.cleaned_data.get('username')
            regist.email = form.cleaned_data.get('email')
            regist.user_fname = form.cleaned_data.get('firstname')
            regist.user_lname = form.cleaned_data.get('lastname')
            regist.phone_number = form.cleaned_data.get('phone')
            us.username = form.cleaned_data.get('username')
            regist.save()
            us.save()
            return redirect('profile')


    context = {
        'user_in': user,
        'form':form
    }
    return render(request, 'customer/editprofile.html',context=context)

def addcar(request):
    form = Addcarform()
    print(1)
    print(request.method)
    if request.method == "POST":
        print(2)
        id = request.user.id
        u = User_sys.objects.get(user_id=id)
        user = Register_user.objects.get(user_id=u.id)
        form_user = Addcarform(request.POST)
        if form_user.is_valid():
            print(3)
            car_ob = Car.objects.create(
                car_license_number=form_user.cleaned_data.get("carid"),
                car_brand=form_user.cleaned_data.get("carbrand"),
                car_model=form_user.cleaned_data.get("carmodel"),
                car_color=form_user.cleaned_data.get("carcolor"),
                register_user=user
            )
            return redirect('profile')
    context = {
        'form': form,
    }
    return render(request, 'customer/addcar.html',context=context)

def changepassword(request):
    error = ''
    if request.method == "POST":
        form = Changepassform(request.POST)
        if form.is_valid():
            print(3)
            id = request.user.id
            us = User.objects.get(id=id)
            u = User_sys.objects.get(user_id=id)
            print(us.check_password(form.cleaned_data.get("oldpassword")))
            if us.check_password(form.cleaned_data.get("oldpassword")):
                print(1)
                regist = Register_user.objects.get(user_id=u.id)
                regist.password = form.cleaned_data.get("newpassword1")
                us.set_password(form.cleaned_data.get("newpassword1"))
                us.save()
                regist.save()
                return redirect('index')
            else:
                error = "old pass didn't match"
                form = Changepassform()

    else:
        form = Changepassform()

    context = {"form": form,
               'error': error}
    return render(request, 'customer/changepassword.html',context=context)

def my_logout(requset):
	logout(requset)
	return redirect('index')
