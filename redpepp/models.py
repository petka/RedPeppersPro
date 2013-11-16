# -*- encoding: utf-8 -*-

from django.db import models
from django_extensions.db.fields import CreationDateTimeField, ModificationDateTimeField
from sorl.thumbnail import ImageField
from django.forms import ModelForm, Textarea

class Project(models.Model):
    title = models.CharField(verbose_name=u'Название', max_length=250)
    caption = models.TextField(verbose_name=u'Заглавие', blank=True)
    text = models.TextField(verbose_name=u'О проекте', blank=True)
    client = models.ForeignKey('Client', related_name='clients')
    url = models.URLField(verbose_name=u'Ссылка', null=True, blank=True)
    number = models.IntegerField(default=0)
    created = CreationDateTimeField(verbose_name=u'Создан')
    modified = ModificationDateTimeField(verbose_name=u'Изменен')
    active = models.BooleanField(default=False)
    
    def get_first_image(self):
        if len(self.images.all()) > 0:
            return self.images.all()[0].image
        else :
            return False
    
    class Meta:
        ordering = ['number']
        verbose_name = u'Проект'
        verbose_name_plural = u'Проекты'
    def __unicode__(self):
        return self.title

class ProjectImage(models.Model):
    project = models.ForeignKey('Project', related_name='images')
    image = ImageField(upload_to='img/projects', null=True, blank=True)
    number = models.IntegerField(default=0)
    description = models.TextField(null=True, blank=True)
    created = CreationDateTimeField(verbose_name=u'Создана')
    modified = ModificationDateTimeField(verbose_name=u'Изменена')

    class Meta:
        ordering = ['number']
        unique_together = ('image', 'number')
        verbose_name = u'Картинка'
        verbose_name_plural = u'Картинки Проектов'

class Worker(models.Model):
    name = models.CharField(verbose_name=u'Имя', max_length=250)
    nick = models.CharField(verbose_name=u'NickName', max_length=250, null=True, blank=True)
    email = models.EmailField(null=True, blank=True)
    about = models.TextField(verbose_name=u'О себе', blank=True)
    occupations = models.ManyToManyField('WorkerOccupation')
    project = models.ManyToManyField('Project', null=True, blank=True, related_name='workers')
    photo = ImageField(upload_to='img/workers', null=True, blank=True)
    number = models.IntegerField(default=0)
    created = CreationDateTimeField(verbose_name=u'Создан')
    modified = ModificationDateTimeField(verbose_name=u'Изменен')
    active = models.BooleanField(default=False)
    
    class Meta:
        ordering = ['number']
        verbose_name = u'Работник'
        verbose_name_plural = u'Работники'
    
    def __unicode__(self):
        return self.name

class WorkerOccupation(models.Model):
    number = models.IntegerField(default=0)
    name = models.CharField(verbose_name=u'Профессия', max_length=250)
    
    class Meta:
        ordering = ['number']
        verbose_name = u'Профессия'
        verbose_name_plural = u'Профессии'
    
    def __unicode__(self):
        return self.name
    
class Client(models.Model):
    title = models.CharField(verbose_name=u'Имя', max_length=250)
    description = models.TextField(verbose_name=u'Описание', blank=True)
    image = ImageField(upload_to='img/clients', null=True, blank=True)
    number = models.IntegerField(default=0)
    created = CreationDateTimeField(verbose_name=u'Создан')
    modified = ModificationDateTimeField(verbose_name=u'Изменен')
    active = models.BooleanField(default=False)
    
    class Meta:
        ordering = ['number']
        verbose_name = u'Клиент'
        verbose_name_plural = u'Клиенты'
    def __unicode__(self):
        return self.title

class New(models.Model):
    datetime = models.DateTimeField(verbose_name=u'Время')
    title = models.CharField(verbose_name=u'Имя', max_length=250)
    text = models.TextField(verbose_name=u'Заглавие', blank=True)
    number = models.IntegerField(default=0)
    created = CreationDateTimeField(verbose_name=u'Создана')
    modified = ModificationDateTimeField(verbose_name=u'Изменена')
    active = models.BooleanField(default=False)
    
    class Meta:
        ordering = ['modified']
        verbose_name = u'Новость'
        verbose_name_plural = u'Новости'

class Order(models.Model):
    name = models.CharField(verbose_name=u'Имя', max_length=250)
    email = models.CharField(verbose_name=u'Email', max_length=250)
    tariff = models.ForeignKey('Tariff', related_name='tariffs')
    message = models.TextField(verbose_name=u'Сообщение', blank=True)
    created = CreationDateTimeField(verbose_name=u'Создан')

    class Meta:
        ordering = ['created']
        verbose_name = u'Заказ'
        verbose_name_plural = u'Заказы'

class Tariff(models.Model):
    title = models.CharField(verbose_name=u'Имя', max_length=250)
    description = models.TextField(verbose_name=u'Описание', blank=True)
    image = ImageField(upload_to='img/tariffs', null=True, blank=True)
    price = models.IntegerField(default=0)
    number = models.IntegerField(default=0)
    active = models.BooleanField(default=False)
    
    class Meta:
        ordering = ['number']
        verbose_name = u'Тариф'
        verbose_name_plural = u'Тарифы'
    def __unicode__(self):
        return self.title

class OrderForm(ModelForm):
    class Meta:
        model = Order
        widgets = {
            'message': Textarea(attrs={'cols': 20, 'rows': 5}),
        }