from django.db import models
# คนมีpointเพิ่ม
class Parking_zone(models.Model):
    name = models.CharField(max_length=255)
    capacity = models.IntegerField()
    available = models.IntegerField()
    def __str__(self):
        return self.name

class Parking_slot(models.Model):
    status = models.BooleanField(null=False)
    parking_zone = models.ForeignKey(Parking_zone,models.PROTECT)

class Parking(models.Model):
    arrive_at = models.DateField(null=True)
    leave_at = models.DateField(null=True)
    parking_zone = models.ForeignKey(Parking_zone, models.PROTECT)
    parking_slot = models.ForeignKey(Parking_slot, models.PROTECT)
    reservation = models.ManyToManyField('Reservation')

class Reservation(models.Model):
    TYPES = (
        ('re', 'reserved'),
        ('ca', 'cancle')
    )

    reserve_status = models.CharField(choices=TYPES,default='re',max_length=2)
    reserve_token = models.CharField(max_length=64)
    reserve_at = models.DateField()

class User_sys(models.Model):
    user = models.OneToOneField('auth.User', on_delete=models.CASCADE)
    TYPES = (
        ('re', 'register_user'),
        ('gu', 'guess_user')
    )
    type = models.CharField(choices=TYPES,default='gu',max_length=2)

class Register_user(models.Model):
    phone_number = models.CharField(max_length=10)
    point = models.IntegerField()
    user = models.ForeignKey(User_sys, models.PROTECT)

class Car(models.Model):
    register_user = models.ForeignKey(Register_user,models.PROTECT)
    car_license_number = models.CharField(primary_key=True ,max_length=25)
    car_brand = models.CharField(max_length=100)
    car_model = models.CharField(max_length=100)
    car_color = models.CharField(max_length=50)
# Create your models here.
