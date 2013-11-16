# -*- encoding: utf-8 -*-

from django.contrib import admin
from redpepp.models import *

class ProjectImageInline(admin.TabularInline):
    model = ProjectImage
    extra = 3

class ProjectAdmin(admin.ModelAdmin):
    list_display = ['number', 'title', 'client', 'active']
    list_editable = ['active']
    search_fields = ['title']
    inlines = [ProjectImageInline]

class WorkerAdmin(admin.ModelAdmin):
    list_display = ['number', 'name', 'nick', 'email', 'active']
    list_editable = ['active']
    search_fields = ['name', 'nick', 'email']

class WorkerOccupationAdmin(admin.ModelAdmin):
    list_display = ['number', 'name']

class ClientAdmin(admin.ModelAdmin):
    list_display = ['number', 'title', 'image', 'active']
    list_editable = ['active']
    search_fields = ['title']

class NewAdmin(admin.ModelAdmin):
    list_display = ['datetime', 'title', 'text', 'active']
    list_editable = ['title', 'text', 'active']
    search_fields = ['datetime', 'title', 'text']

class OrderAdmin(admin.ModelAdmin):
    list_display = ['name', 'email', 'tariff', 'message', 'created']
    search_fields = ['name', 'email', 'message']

class TariffAdmin(admin.ModelAdmin):
    list_display = ['number', 'title', 'description', 'price', 'active']
    list_editable = ['title', 'description', 'price', 'active']
    search_fields = ['title', 'description', 'price']

admin.site.register(Project, ProjectAdmin)
admin.site.register(Worker, WorkerAdmin)
admin.site.register(WorkerOccupation, WorkerOccupationAdmin)
admin.site.register(Client, ClientAdmin)
admin.site.register(New, NewAdmin)
admin.site.register(Order, OrderAdmin)
admin.site.register(Tariff, TariffAdmin)
