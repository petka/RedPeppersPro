# -*- encoding: utf-8 -*-
from django.shortcuts import render_to_response, redirect, get_object_or_404, \
    get_list_or_404
from django.template import RequestContext
from django.http import HttpResponse, HttpResponseNotFound, Http404
from django.conf import settings
from redpepp.models import Project, OrderForm

def index(request):
    order_sended = False
    projects = Project.objects.filter(active=True).order_by('created')
    
    if request.method == 'POST':
        order_form = OrderForm(request.POST)
        if order_form.is_valid():
            order_form.save()
            order_sended = True
            order_form = OrderForm()
    else:
        order_form = OrderForm()
    
    return render_to_response("redpepp/index.html", {
        'projects': projects,
        'order_form': order_form,
        'order_sended': order_sended,
        'news': True,
    }, context_instance=RequestContext(request))

def project(request, id):
    print 'Project'
    print id
    try:
        project = Project.objects.get(pk=id, active=True)
    except Project.DoesNotExist:
        raise Http404
    print project
    return render_to_response("redpepp/project.html", {
        'project': project,
    }, context_instance=RequestContext(request))
