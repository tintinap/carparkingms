# Generated by Django 2.2 on 2019-04-28 07:45

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('customer', '0004_auto_20190423_2350'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='register_user',
            name='email',
        ),
        migrations.RemoveField(
            model_name='register_user',
            name='password',
        ),
        migrations.RemoveField(
            model_name='register_user',
            name='user_fname',
        ),
        migrations.RemoveField(
            model_name='register_user',
            name='user_lname',
        ),
        migrations.RemoveField(
            model_name='register_user',
            name='username',
        ),
    ]
