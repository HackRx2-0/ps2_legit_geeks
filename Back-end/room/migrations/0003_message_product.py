# Generated by Django 3.2.4 on 2021-07-22 07:27

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0003_brand_color'),
        ('room', '0002_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='message',
            name='product',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='product.product'),
        ),
    ]