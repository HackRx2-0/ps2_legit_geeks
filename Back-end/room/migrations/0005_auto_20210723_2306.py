# Generated by Django 3.2.5 on 2021-07-23 17:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('room', '0004_alter_message_message_text'),
    ]

    operations = [
        migrations.AlterField(
            model_name='message',
            name='file_field',
            field=models.FileField(blank=True, null=True, upload_to='messages'),
        ),
        migrations.AlterField(
            model_name='room',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='rooms'),
        ),
        migrations.AlterField(
            model_name='userorderline',
            name='file',
            field=models.FileField(blank=True, null=True, upload_to='group_orders'),
        ),
    ]
