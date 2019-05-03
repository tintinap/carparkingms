from django import forms
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.core import validators
from django.core.exceptions import ValidationError

from customer.models import Car


class LoginForm(forms.Form):
    username = forms.CharField(required=True,label="username")
    password = forms.CharField(max_length=100,required=True,label="password")

class UsernameForm(forms.Form):
    username = forms.CharField(required=True,label="username")
    password1 = forms.CharField(max_length=100, required=True,label="password1")
    password2 = forms.CharField(max_length=100, required=True,label="password2")
    email = forms.CharField(validators=[validators.validate_email],label="email",required=True)
    firstname = forms.CharField(required=True, label="firstname")
    lastname = forms.CharField(required=True, label="lastname")
    phone = forms.CharField(max_length=10 ,label="phone",required=True)
    carid = forms.CharField(required=True, label="carid")
    carbrand = forms.CharField(required=True, label="carbrand")
    carmodel = forms.CharField(required=True, label="carmodel")
    carcolor = forms.CharField(required=True, label="carcolor")

    def clean(self):
        cleaned_data = super().clean()
        p1 = cleaned_data.get("password1")
        p2 = cleaned_data.get("password2")
        user = list(User.objects.values())
        data = cleaned_data.get("username")
        phone = cleaned_data.get("phone")
        for i in user:
            if i['username'] == data:
                self.add_error('username', "ชื่อผู้ใช้นี้ถูกใช้ไปแล้ว")

        if p1 is not None:
            if len(p1) <= 8:
                self.add_error('password1', "รหัสผ่านต้องมีความยาวมากกว่า 8 ตัวอักษร")

        if p1 != p2:
            self.add_error('password2',"กรุณาใส่รหัสผ่านให้ถูกต้อง")

        if phone is not None:
            print(phone.isdigit())
            if len(phone) != 10 or not phone.isdigit() :

                self.add_error('phone', "กรุณาใส่เบอร์โทรศัพท์ให้ถูกต้อง")

class Addcarform(forms.Form):
    carid = forms.CharField(required=True, label="carid")
    carbrand = forms.CharField(required=True, label="carbrand")
    carmodel = forms.CharField(required=True, label="carmodel")
    carcolor = forms.CharField(required=True, label="carcolor")

    def clean(self):
        cleaned_data = super().clean()
        car = list(Car.objects.values())
        data = cleaned_data.get("carid")
        for i in car:
            if i['car_license_number'] == data:
                raise forms.ValidationError("carid ซ้ำ")

class Editprofileform(forms.Form):
    username = forms.CharField(label="username", required=True)
    email = forms.CharField(validators=[validators.validate_email], label="email",required=True)
    firstname = forms.CharField(label="firstname", required=True)
    lastname = forms.CharField(label="lastname", required=True)
    phone = forms.CharField(max_length=10, label="phone",required=True)

class Changepassform(forms.Form):
    oldpassword = forms.CharField(required=True, label="oldpassword")
    newpassword1 = forms.CharField(required=True, label="newpassword1")
    newpassword2 = forms.CharField(required=True, label="newpassword2")

    def __init__(self, request, *args, **kwargs):
        self.request = request
        super(Changepassform, self).__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = super().clean()
        pa = cleaned_data.get("newpassword1")
        repa = cleaned_data.get("newpassword2")
        oldpassword = cleaned_data.get('oldpassword')

        user = authenticate(self.request, username=self.request.user.username, password=oldpassword)

        if not user:
            self.add_error('oldpassword','รหัสผ่านเก่าไม่ถูกต้อง')

        if pa is not None:
            if(len(pa) <= 8):
                self.add_error('newpassword1', "รหัสผ่านต้องมีความยาวมากกว่า 8 ตัวอักษร")

        if repa is not None:
            if(len(repa) <= 8):
                self.add_error('newpassword2', "รหัสผ่านต้องมีความยาวมากกว่า 8 ตัวอักษร")

        if pa != repa:
            self.add_error('newpassword1', "กรุณาใส่รหัสผ่านให้ตรงกัน")
            self.add_error('newpassword2', "กรุณาใส่รหัสผ่านให้ตรงกัน")