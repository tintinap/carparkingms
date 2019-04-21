from django.shortcuts import render

def index(request):
    return render(request, 'customer/index.html')

def my_login(request):
    return render(request, 'customer/login.html')

def buypackage(request):
    return render(request, 'customer/buypackage.html')

def register(request):
    return render(request, 'customer/register.html')

def profile(request):
    return render(request, 'customer/profile.html')

def editprofile(request):
    return render(request, 'customer/editprofile.html')

def addcar(request):
    return render(request, 'customer/addcar.html')

def changepassword(request):
    return render(request, 'customer/changepassword.html')
