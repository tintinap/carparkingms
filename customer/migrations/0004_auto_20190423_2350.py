# Generated by Django 2.2 on 2019-04-23 16:50

from django.conf import settings
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('customer', '0003_register_user_email'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='User',
            new_name='User_sys',
        ),
    ]
