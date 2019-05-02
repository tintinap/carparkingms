from django import forms
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
        for i in user:
            if i['username'] == data:
                raise forms.ValidationError("username ซ้ำ")

        if p1 != p2:
            raise forms.ValidationError("password not match")

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
    username = forms.CharField(required=True, label="username")
    email = forms.CharField(validators=[validators.validate_email], label="email",required=True)
    firstname = forms.CharField(required=True, label="firstname")
    lastname = forms.CharField(required=True, label="lastname")
    phone = forms.CharField(max_length=10, label="phone",required=True)

class Changepassform(forms.Form):
    oldpassword = forms.CharField(required=True, label="oldpassword")
    newpassword1 = forms.CharField(required=True, label="newpassword1")
    newpassword2 = forms.CharField(required=True, label="newpassword2")

    def set_old_password_flag(self):

        # This method is called if the old password entered by user does not match the password in the database, which sets the flag to False

        self.old_password_flag = False

        return 0

    def clean_old_password(self, *args, **kwargs):
        old_password = self.cleaned_data.get('oldpassword')

        if self.old_password_flag == False:
            # It raise the validation error that password entered by user does not match the actucal old password.

            raise forms.ValidationError("The old password that you have entered is wrong.")

        return old_password
    def clean(self):
        cleaned_data = super().clean()
        pa = cleaned_data.get("newpassword1")
        repa = cleaned_data.get("newpassword2")
        old_password = cleaned_data.get('oldpassword')


        if pa != repa:
            raise forms.ValidationError("password didn't match")