# Generated by Django 3.2.5 on 2021-07-23 17:36

from django.db import migrations
import versatileimagefield.fields


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='profile_pic',
            field=versatileimagefield.fields.VersatileImageField(blank=True, null=True, upload_to='users'),
        ),
    ]
