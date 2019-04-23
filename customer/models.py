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
    arrive_at = models.DateField()
    leave_at = models.DateField()
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

class User(models.Model):
    user = models.OneToOneField('auth.User', on_delete=models.CASCADE)
    TYPES = (
        ('re', 'register_user'),
        ('gu', 'guess_user')
    )
    type = models.CharField(choices=TYPES,default='gu',max_length=2)

class Register_user(models.Model):
    user_fname = models.CharField(max_length=255)
    user_lname = models.CharField(max_length=255)
    username = models.CharField(null=False,unique=True,max_length=255)
    password = models.CharField(null=False,max_length=255)
    phone_number = models.CharField(max_length=10)
    email = models.EmailField()
    point = models.IntegerField()
    user = models.ForeignKey(User, models.PROTECT)

    def __str__(self):
        return self.user_fname

class Car(models.Model):
    register_user = models.ForeignKey(Register_user,models.PROTECT)
    car_license_number = models.CharField(primary_key=True ,max_length=25)
    car_brand = models.CharField(max_length=100)
    car_model = models.CharField(max_length=100)
    car_color = models.CharField(max_length=50)
# Create your models here.
