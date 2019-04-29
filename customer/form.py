from django import forms
from django.core import validators
from django.core.exceptions import ValidationError


class LoginForm(forms.Form):
    username = forms.CharField(required=True,label="username")
    password = forms.CharField(max_length=100,required=True,label="password")

class UsernameForm(forms.Form):
    username = forms.CharField(required=True,label="username")
    password1 = forms.CharField(max_length=100, required=True,label="password1")
    password2 = forms.CharField(max_length=100, required=True,label="password2")
    email = forms.CharField(validators=[validators.validate_email],label="email")
    firstname = forms.CharField(required=True, label="firstname")
    lastname = forms.CharField(required=True, label="lastname")
    phone = forms.IntegerField(max_value=9999999999 ,label="phone")
    carid = forms.CharField(required=True, label="carid")
    carbrand = forms.CharField(required=True, label="carbrand")
    carmodel = forms.CharField(required=True, label="carmodel")
    carcolor = forms.CharField(required=True, label="carcolor")

    def clean(self):
        cleaned_data = super().clean()
        p1 = cleaned_data.get("password1")
        p2 = cleaned_data.get("password2")


        if p1 != p2:
            raise forms.ValidationError("password not match")

class Addcarform(forms.Form):
    carid = forms.CharField(required=True, label="carid")
    carbrand = forms.CharField(required=True, label="carbrand")
    carmodel = forms.CharField(required=True, label="carmodel")
    carcolor = forms.CharField(required=True, label="carcolor")

class Editprofileform(forms.Form):
    username = forms.CharField(required=True, label="username")
    email = forms.CharField(validators=[validators.validate_email], label="email")
    firstname = forms.CharField(required=True, label="firstname")
    lastname = forms.CharField(required=True, label="lastname")
    phone = forms.CharField(max_length=10, label="phone")

class Changepassform(forms.Form):
    oldpassword = forms.CharField(required=True, label="oldpassword")
    newpassword1 = forms.CharField(required=True, label="newpassword1")
    newpassword2 = forms.CharField(required=True, label="newpassword2")

    def clean(self):
        cleaned_data = super().clean()
        pa = cleaned_data.get("newpassword1")
        repa = cleaned_data.get("newpassword2")

        if pa != repa:
            raise forms.ValidationError("password didn't match")