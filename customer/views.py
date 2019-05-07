import json

from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.models import User
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render, redirect

from customer.form import LoginForm, UsernameForm, Addcarform, Editprofileform, Changepassform
from customer.models import Parking_zone, Register_user, Car, User_sys, Parking_slot, Parking, Reservation


def index(request):
    if request.user.is_authenticated:
        id = request.user.id
        u = list(User_sys.objects.filter(user_id=id).values())
        user_list = list(Register_user.objects.filter(user_id=u[0]['id']).values())
        user_car_list = list(Car.objects.filter(register_user_id=user_list[0]['id']).values())
        park = []


    else:
        park = []
        user_list = [{'point': 0}]
        user_car_list = []
    parking_list = list(Parking_zone.objects.values())
    context = {
        'park_slot':park,
        'parking': parking_list,
        'user_in': user_list,
        'car_in': user_car_list

    }

    return render(request, 'customer/index.html', context=context)


def my_login(request):
    user=''
    username=''
    password=''
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
            if request.user.is_staff:
                return redirect("admin:index")
            else:
                return redirect("index")
        if username!= '' or password!= '':
            context['error'] = 'กรุณาระบุชื่อผู้ใช้หรือรหัสผ่านให้ถูกต้อง'
    elif request.method == 'GET':
        if (request.user.is_authenticated):
            return redirect("index")
    context['form'] = form
    return render(request, 'customer/login.html', context=context)


@login_required
def buypackage(request):
    id = request.user.id
    u = list(User_sys.objects.filter(user_id=id).values())
    user = list(Register_user.objects.filter(user_id=u[0]['id']).values())
    if request.method == "POST":
        re_user = Register_user.objects.get(user_id=u[0]['id'])
        re_user.point = user[0]['point'] + int(request.POST.get('point'))
        re_user.save()
    user_1 = list(Register_user.objects.filter(user_id=u[0]['id']).values())
    context = {
        'user_in': user_1,
    }

    return render(request, 'customer/buypackage.html', context=context)


def register(request):
    form_user = UsernameForm()
    if request.method == "POST":
        form_user = UsernameForm(request.POST)
        if form_user.is_valid():
            user = User.objects.create_user(username=form_user.cleaned_data.get("username"),
                                            first_name=form_user.cleaned_data.get("firstname"),
                                            last_name=form_user.cleaned_data.get("lastname"),
                                            email=form_user.cleaned_data.get("email"),
                                            password=form_user.cleaned_data.get("password1"))
            user.save()
            user_ob = User_sys.objects.create(
                user=user,
                type="re"
            )
            regist_user = Register_user.objects.create(
                phone_number=form_user.cleaned_data.get("phone"),
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
        'form_user': form_user,
    }
    return render(request, 'customer/register.html', context=context)


@login_required
def profile(request):
    id = request.user.id
    user_in = list(User.objects.filter(id=id).values())
    print(1)
    print(user_in)
    print(user_in[0]["first_name"])
    u = list(User_sys.objects.filter(user_id=id).values())
    user = list(Register_user.objects.filter(user_id=u[0]['id']).values())
    car = list(Car.objects.filter(register_user_id=user[0]["id"]).values())
    context = {
        'user_u': user_in,
        'user_in': user,
        'car_in': car
    }
    return render(request, 'customer/profile.html', context=context)


@login_required
def editprofile(request):
    form = Editprofileform()
    id = request.user.id
    user_in = list(User.objects.filter(id=id).values())
    us = User.objects.get(id=id)
    u = User_sys.objects.get(user_id=id)
    user = list(Register_user.objects.filter(user_id=u.id).values())
    if request.method == "POST":
        form = Editprofileform(request.POST)
        if form.is_valid():
            regist = Register_user.objects.get(user_id=u.id)

            us.email = form.cleaned_data.get('email')
            us.first_name = form.cleaned_data.get('firstname')
            us.last_name = form.cleaned_data.get('lastname')
            regist.phone_number = form.cleaned_data.get('phone')
            us.username = form.cleaned_data.get('username')
            regist.save()
            us.save()
            return redirect('profile')

    context = {
        'user_u': user_in,
        'user_in': user,
        'form': form
    }
    return render(request, 'customer/editprofile.html', context=context)


@login_required
def addcar(request):
    form = Addcarform()
    if request.method == "POST":
        id = request.user.id
        u = User_sys.objects.get(user_id=id)
        user = Register_user.objects.get(user_id=u.id)
        form = Addcarform(request.POST)
        if form.is_valid():
            car_ob = Car.objects.create(
                car_license_number=form.cleaned_data.get("carid"),
                car_brand=form.cleaned_data.get("carbrand"),
                car_model=form.cleaned_data.get("carmodel"),
                car_color=form.cleaned_data.get("carcolor"),
                register_user=user
            )
            return redirect('profile')
    context = {
        'form': form,
    }
    return render(request, 'customer/addcar.html', context=context)


@login_required
def changepassword(request):
    if request.method == "POST":
        form = Changepassform(request, request.POST)
        if form.is_valid():
            id = request.user.id
            us = User.objects.get(id=id)
            us.set_password(form.cleaned_data.get("newpassword1"))
            us.save()
            return redirect('index')

    else:
        form = Changepassform(request)

    context = {"form": form}
    return render(request, 'customer/changepassword.html', context=context)


@login_required
def my_logout(requset):
    logout(requset)
    return redirect('index')

@login_required
def api_index(request):
    if request.method == 'POST':
        id = request.user.id
        u = list(User_sys.objects.filter(user_id=id).values())
        user_list = list(Register_user.objects.filter(user_id=u[0]['id']).values())
        user_car_list = list(Car.objects.filter(register_user_id=u[0]['id']).values())
        reserve_info = json.loads(request.body)
        slot = list(Parking_slot.objects.values())



        for i in slot:
            if i['status']:
                break
        p_slot = Parking_slot.objects.get(id=i['id'])
        p_zone = Parking_zone.objects.get(id=i['parking_zone_id'])

        p_slot.status = 0
        p_slot.save()

        p_zone.available -= 1
        p_zone.save()

        u_point = Register_user.objects.get(user_id=u[0]['id'])
        u_point.point -= int(reserve_info['option']['point'])
        u_point.save()
        park_ing = Parking.objects.create(
            parking_slot=p_slot,
            parking_zone=p_zone,
        )
        re_u = Register_user.objects.get(user_id=u[0]['id'])
        print(re_u)
        reserve = Reservation.objects.create(
            reserve_status="re",
            reserve_token=reserve_info['token_auth'],
            reserve_at=reserve_info['timestamp'],
            parking_slot=park_ing,
            register_user=re_u
        )

        p_slot.reservation.add(reserve)

        park = list(Parking_slot.objects.filter(id=park_ing.parking_slot_id).values())
        parking_list = list(Parking_zone.objects.values())
        context = {
            'park_slot': park,
            'parking': parking_list,
            'user_in': user_list,
            'car_in': user_car_list
        }

        return JsonResponse(context, status=200)

@login_required
@user_passes_test(lambda u: u.is_staff)
def parking(request,p_token):
    context={}
    parking = list(Parking.objects.values())
    check_token = 0
    for i in parking:
        if i['parking_token'] == p_token:
            check_token +=1
            break
    if check_token==0:
        slot = list(Parking_slot.objects.values())
        for i in slot:
            if i['status']:
                break
        p_slot = Parking_slot.objects.get(id=i['id'])
        p_zone = Parking_zone.objects.get(id=i['parking_zone_id'])

        p_slot.status = 0
        p_slot.save()

        p_zone.available -= 1
        p_zone.save()

        park_ing = Parking.objects.create(
            parking_slot=p_slot,
            parking_zone=p_zone,
            parking_token=p_token
        )
        park = list(Parking_slot.objects.filter(id=park_ing.parking_slot_id).values())
        context = {
            'park_slot': park,
        }
    else:
        p_slot = Parking_slot.objects.get(id=i['parking_slot_id'])
        p_zone = Parking_zone.objects.get(id=i['parking_zone_id'])

        p_slot.status = 1
        p_slot.save()

        p_zone.available += 1
        p_zone.save()


    return JsonResponse(context, status=200)

@login_required
@user_passes_test(lambda u: u.is_staff)
def reserve(request,r_token):
    context={
        'park_slot':[]
    }
    parking = list(Parking.objects.values())
    check_token = 0
    for i in parking:
        if i['parking_token'] == r_token:
            check_token += 1
            break
    if check_token == 0:
        u = list(User_sys.objects.filter(user_id=request.user.id).values())
        user_list = Register_user.objects.get(user_id=u[0]['id'])
        user_list.point += 25
        user_list.save()

        reser = list(Reservation.objects.get(reserve_token=r_token).parking_slot_set.all())

        p_slot = Parking_slot.objects.get(id=reser[0].id)
        p_zone = Parking_zone.objects.get(id=reser[0].parking_zone_id)

        park_ing = Parking.objects.create(
            parking_slot=p_slot,
            parking_zone=p_zone,
            parking_token=r_token
        )
        park = list(Parking_slot.objects.filter(id=park_ing.parking_slot_id).values())
        context = {
            'park_slot': park,
        }
    else:
        p_slot = Parking_slot.objects.get(id=i['parking_slot_id'])
        p_zone = Parking_zone.objects.get(id=i['parking_zone_id'])

        p_slot.status = 1
        p_slot.save()

        p_zone.available += 1
        p_zone.save()

    return JsonResponse(context, status=200)

def expired(request):
    check_token = 0
    reserve_info = json.loads(request.body)
    print(reserve_info)
    print(3)
    park = list(Parking.objects.values())
    print(4)
    for i in park:
        if i['parking_token'] == reserve_info['token']:
            print(5)
            check_token = 1
            break
    print(2)
    if check_token == 0:
        print(1)
        re = Reservation.objects.get(reserve_token=reserve_info['token'])
        p_slot = Parking_slot.objects.get(id=reserve_info['p_id'])
        p_zone = Parking_zone.objects.get(id=p_slot.parking_zone_id)

        re.reserve_status = "ca"
        re.save()

        p_slot.status = 1
        p_slot.save()

        p_zone.available += 1
        p_zone.save()
    context={}

    return JsonResponse(context,status=200)